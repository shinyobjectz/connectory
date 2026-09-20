-- The port a workbook runs against: it turns a step into an HTTP request, signs it with the
-- token in the environment, and hands it to one function the host provides.
--
--   local port = require "port_http" { request = function (r) ... end }
--   wb.run(book, event, port, inputs)
--
-- `request` takes { method, url, headers, body, body_format } and returns
-- (status, body_table) or (nil, message). Use whatever your host already has — an HTTP
-- client in the language embedding Lua, or curl through io.popen.
--
-- What it can call comes from `host.catalog`, which is either the `endpoints` an export
-- writes, one provider pack, or a list of them:
--
--   require "port_http" { request = …, catalog = require "providers.github" }
--   require "port_http" { request = …, catalog = { require "providers.github",
--                                                  require "providers.slack" } }
--
-- With no catalog it falls back to `require "endpoints"`, which is what an exported
-- workbook ships beside it.

local M = {}

-- A pack describes one provider; an export's endpoints table describes several. Both become
-- the same two lookups: an operation by name, and the provider that signs it.
local function as_catalog(source)
  if source.operations and source.providers then return source end

  local packs = source.provider and { source } or source
  local providers, operations = {}, {}
  for i = 1, #packs do
    local pack = packs[i]
    providers[pack.provider] = pack
    for name, op in pairs(pack.operations) do
      operations[name] = setmetatable({ provider = pack.provider }, { __index = op })
    end
  end
  return { providers = providers, operations = operations }
end

local function encode_query(params)
  local parts = {}
  for k, v in pairs(params) do
    parts[#parts + 1] = tostring(k) .. "=" .. tostring(v):gsub("[^%w%-%._~]", function (c)
      return string.format("%%%02X", string.byte(c))
    end)
  end
  if #parts == 0 then return "" end
  return "?" .. table.concat(parts, "&")
end

-- A pack leaves an empty list out rather than writing a thousand `{}`, so absent means none.
local function pick(args, names)
  local out, any = {}, false
  for i = 1, #(names or {}) do
    local v = args[names[i]]
    if v ~= nil then out[names[i]] = v; any = true end
  end
  return out, any
end

local function err(code, message)
  return nil, { port = "workbook", call = "execute", code = code, message = message }
end

-- Basic authentication is base64 of "user:password", and Lua has no base64. Twenty lines
-- is cheaper than a C dependency in something meant to run wherever Lua runs.
local B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function base64(data)
  local out, n = {}, #data
  for i = 1, n, 3 do
    local a, b, c = data:byte(i), data:byte(i + 1), data:byte(i + 2)
    local triple = a * 65536 + (b or 0) * 256 + (c or 0)
    local chunk = {}
    for j = 1, 4 do
      local index = math.floor(triple / (64 ^ (4 - j))) % 64
      chunk[j] = B64:sub(index + 1, index + 1)
    end
    if not b then chunk[3], chunk[4] = "=", "=" elseif not c then chunk[4] = "=" end
    out[#out + 1] = table.concat(chunk)
  end
  return table.concat(out)
end

-- The credential, as the provider wants it carried: a header whose value is the vendor's
-- own format with the token substituted in, a user/password pair, or a query parameter.
local function sign(provider, headers, query, getenv)
  local function need(name)
    local v = name and getenv(name)
    if name and (v == nil or v == "") then
      return nil, provider.name .. " needs " .. name .. " in the environment"
    end
    return v
  end

  if provider.kind == "basic" and provider.user_env then
    local user, why = need(provider.user_env)
    if why then return why end
    local pass, why2 = need(provider.pass_env)
    if why2 then return why2 end
    headers["authorization"] = "Basic " .. base64(user .. ":" .. pass)
    return nil
  end

  local token, why = need(provider.env)
  if why then return why end
  if token == nil then return nil end

  if provider.kind == "basic" then
    headers["authorization"] = "Basic " .. base64(token .. ":")
  elseif provider.kind == "query" then
    query[provider.param] = token
  else
    headers[provider.header or "authorization"] =
      (provider.format or "Bearer {token}"):gsub("{token}", (token:gsub("%%", "%%%%")))
  end
  return nil
end

function M.new(host)
  if type(host) ~= "table" or type(host.request) ~= "function" then
    error("port_http.new{ request = function (r) ... end }: request is required", 2)
  end

  local getenv = host.getenv or os.getenv
  local endpoints = as_catalog(host.catalog or require "endpoints")

  return {
    execute = function (tool, args)
      local op = endpoints.operations[tool]
      if not op then return err("not_found", "this workbook has no endpoint for " .. tostring(tool)) end

      local provider = endpoints.providers[op.provider]

      local url = op.url

      -- Some APIs have no one address: yours lives at your own subdomain, or your own
      -- instance. Those come from the environment too, never from an argument.
      for name, env in pairs(provider.config or {}) do
        local v = getenv(env)
        if v == nil or v == "" then
          return err("denied", provider.name .. " needs " .. env .. " in the environment: it is part of the address")
        end
        url = url:gsub("{" .. name .. "}", v)
      end

      for i = 1, #(op.path or {}) do
        local name = op.path[i]
        local v = args[name]
        if v == nil then return err("malformed", name .. " is part of the URL and was not given") end
        url = url:gsub("{" .. name .. "}", tostring(v))
      end

      local headers = {}
      for k, v in pairs(provider.headers or {}) do headers[k] = v end
      for k, v in pairs((pick(args, op.header))) do headers[k] = tostring(v) end

      local query = pick(args, op.query)
      local why = sign(provider, headers, query, getenv)
      if why then return err("denied", why) end

      url = url .. encode_query(query)
      local body, has_body = pick(args, op.body)

      local status, answer = host.request({
        method = op.method,
        url = url,
        headers = headers,
        body = has_body and body or nil,
        body_format = op.body_format,
      })

      if status == nil then return err("unavailable", tostring(answer)) end
      if status >= 200 and status < 300 then
        if type(answer) == "table" and answer.ok == false and answer.error then
          return err("unavailable", provider.name .. ": " .. tostring(answer.error))
        end
        return answer or {}
      end
      if status == 401 or status == 403 then return err("denied", provider.name .. " refused the token") end
      if status == 404 then return err("not_found", provider.name .. " answered 404") end
      if status == 429 then return err("exhausted", provider.name .. " rate limited the call") end
      return err("unavailable", provider.name .. " answered " .. tostring(status))
    end,
  }
end

return setmetatable(M, { __call = function (_, host) return M.new(host) end })
