-- workbook — the runtime a compiled workbook runs on.
--
-- A workbook file is a declaration: `wb.book { ... }` builds a table and runs nothing.
-- `wb.run(book, event, port)` executes it. The runtime knows no vendor: every call to the
-- outside world goes through `port.execute(tool, args)`, which returns `data` or
-- `nil, err` (malleable's port convention: a wrong shape raises, a wrong world returns).
--
-- Plain Lua, standard library only, inside the subset Lua 5.3 (luerl), 5.4 and LuaJIT
-- all accept — so the same file runs in the BEAM, in a host through mlua, or on a PATH lua.

local M = { version = "0.1.0" }

-- Path access -------------------------------------------------------------------------

-- `path` is a list of keys. A numeric key indexes a list 0-based, the way the JSON the
-- data came from counts; a missing link anywhere yields nil rather than an error.
function M.get(ctx, path)
  local v = ctx
  for i = 1, #path do
    if type(v) ~= "table" then return nil end
    local k = path[i]
    if type(k) == "number" then k = k + 1 end
    v = v[k]
  end
  return v
end

-- Functions the expression language may call -----------------------------------------

local F = {}
M.fn = F

local function str(v)
  if v == nil then return "" end
  if type(v) == "table" then
    local parts = {}
    for i = 1, #v do parts[#parts + 1] = str(v[i]) end
    return table.concat(parts, ", ")
  end
  return tostring(v)
end

F.str = str
function F.lower(s) return str(s):lower() end
function F.upper(s) return str(s):upper() end
function F.trim(s) return (str(s):gsub("^%s+", ""):gsub("%s+$", "")) end
function F.len(v)
  if type(v) == "table" then return #v end
  return #str(v)
end
function F.contains(hay, needle)
  if type(hay) == "table" then
    for i = 1, #hay do if hay[i] == needle then return true end end
    return false
  end
  return str(hay):find(str(needle), 1, true) ~= nil
end
function F.starts_with(s, p) s, p = str(s), str(p); return s:sub(1, #p) == p end
function F.ends_with(s, p) s, p = str(s), str(p); return p == "" or s:sub(-#p) == p end
function F.truncate(s, n)
  s = str(s); n = tonumber(n) or #s
  if #s <= n then return s end
  return s:sub(1, n) .. "…"
end
function F.default(v, d)
  if v == nil or v == "" then return d end
  return v
end
function F.concat(...)
  local parts, n = {}, select("#", ...)
  for i = 1, n do parts[i] = str((select(i, ...))) end
  return table.concat(parts)
end
function F.join(list, sep)
  if type(list) ~= "table" then return str(list) end
  local parts = {}
  for i = 1, #list do parts[i] = str(list[i]) end
  return table.concat(parts, sep == nil and ", " or str(sep))
end

-- Comparison is loose on purpose: a trigger payload carries "3" where a person wrote 3.
local function num(v) return tonumber(v) end
function F.eq(a, b)
  if a == b then return true end
  local x, y = num(a), num(b)
  if x and y then return x == y end
  return a ~= nil and b ~= nil and str(a) == str(b)
end
function F.neq(a, b) return not F.eq(a, b) end
local function order(a, b)
  local x, y = num(a), num(b)
  if x and y then return x, y end
  return str(a), str(b)
end
function F.lt(a, b) local x, y = order(a, b); return x < y end
function F.gt(a, b) local x, y = order(a, b); return x > y end
function F.le(a, b) local x, y = order(a, b); return x <= y end
function F.ge(a, b) local x, y = order(a, b); return x >= y end

-- Truth as a person means it: nil, false, "", 0 and an empty list are all "no".
function F.truthy(v)
  if v == nil or v == false or v == "" or v == 0 then return false end
  if type(v) == "table" and next(v) == nil then return false end
  return true
end

-- Declarations ------------------------------------------------------------------------

local function need(t, field, kind, where)
  if type(t[field]) ~= kind then
    error(where .. ": `" .. field .. "` must be a " .. kind .. ", got " .. type(t[field]), 3)
  end
end

function M.trigger(t)
  need(t, "kind", "string", "wb.trigger")
  return t
end

function M.step(t)
  need(t, "id", "string", "wb.step")
  need(t, "tool", "string", "wb.step")
  need(t, "args", "function", "wb.step")
  t.kind = "tool"
  return t
end

-- A judgment made while the workflow runs: the text asked for something to be decided
-- ("an agent reads the results and decides whether there is an issue"). The host answers
-- it through `port.decide(question, criteria, state)`, which returns { yes = bool, p = n }.
-- Steps after it can be gated on `steps.<id>.yes`.
function M.decide(t)
  need(t, "id", "string", "wb.decide")
  need(t, "question", "string", "wb.decide")
  need(t, "criteria", "table", "wb.decide")
  t.kind = "decide"
  return t
end

function M.book(t)
  need(t, "name", "string", "wb.book")
  need(t, "trigger", "table", "wb.book")
  need(t, "steps", "table", "wb.book")
  local seen = {}
  for i = 1, #t.steps do
    local id = t.steps[i].id
    if seen[id] then error("wb.book: two steps are called " .. id, 2) end
    seen[id] = true
  end
  t.runtime = M.version
  return t
end

-- Running -----------------------------------------------------------------------------

-- Runs `book` against one `event`. `inputs` are the values the text did not give (a
-- spreadsheet id, a repository), named in `book.inputs`. Returns a result table, never
-- raises for the world:
--   { ok, skipped, failed_step, error, steps = { {id, tool, ok, args, data, err}, ... } }
function M.run(book, event, port, inputs)
  if type(port) ~= "table" or type(port.execute) ~= "function" then
    error("wb.run: port.execute(tool, args) is required", 2)
  end
  inputs = inputs or {}
  local ctx = { event = event or {}, steps = {}, inputs = inputs }
  local result = { ok = true, skipped = false, steps = {} }

  local need = book.inputs or {}
  for i = 1, #need do
    if not F.truthy(inputs[need[i]]) then
      result.ok = false
      result.error = { code = "not_found", message = "this workbook needs the input " .. need[i] }
      return result
    end
  end

  if book.when then
    local passed, why = pcall(book.when, ctx, F, M.get)
    if not passed then
      result.ok = false
      result.error = { code = "malformed", message = "the filter failed: " .. str(why) }
      return result
    end
    if not F.truthy(why) then
      result.skipped = true
      return result
    end
  end

  for i = 1, #book.steps do
    local step = book.steps[i]
    local rec = { id = step.id, kind = step.kind, tool = step.tool, ok = false }
    result.steps[#result.steps + 1] = rec

    -- A step of its own may be gated on an earlier judgment.
    local gated, pass = true, true
    if step.when then
      gated, pass = pcall(step.when, ctx, F, M.get)
      if not gated then
        rec.err = { code = "malformed", message = "the gate failed: " .. str(pass) }
      elseif not F.truthy(pass) then
        rec.ok = true
        rec.skipped = true
        ctx.steps[step.id] = { skipped = true }
      end
    end

    if rec.skipped then
      -- nothing to do
    elseif gated then
      if step.kind == "decide" then
        if type(port.decide) ~= "function" then
          rec.err = { code = "unavailable", message = "this workbook asks for a judgment; the host must supply port.decide" }
        else
          local state = {}
          if step.state then
            local built, v = pcall(step.state, ctx, F, M.get)
            if built and type(v) == "table" then state = v end
          end
          rec.question = step.question
          local answer, err = port.decide(step.question, step.criteria, state)
          if answer == nil then
            rec.err = err or { code = "unavailable", message = "the port returned nothing" }
          else
            rec.ok = true
            rec.data = answer
            ctx.steps[step.id] = { yes = answer.yes, p = answer.p, data = answer }
          end
        end
      else
        local built, args = pcall(step.args, ctx, F, M.get)
        if not built then
          rec.err = { code = "malformed", message = "arguments failed to build: " .. str(args) }
        else
          rec.args = args
          local data, err = port.execute(step.tool, args)
          if data == nil then
            rec.err = err or { code = "unavailable", message = "the port returned nothing" }
          else
            rec.ok = true
            rec.data = data
            ctx.steps[step.id] = { data = data }
          end
        end
      end
    end

    if not rec.ok then
      result.ok = false
      result.failed_step = step.id
      return result
    end
  end
  return result
end

return M
