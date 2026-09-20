-- Digits — every call this API accepts, as data.
--
-- GENERATED from https://digits.com/openapi.json
-- Published on the vendor's own documentation site (https://digits.com).
-- 4 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "digits",
  name = "Digits",
  base = "https://connect.digits.com",
  docs = "https://nango.dev/docs/api-integrations/digits",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "DIGITS_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["digits.get_llms_txt"] = { method = "GET", url = "https://connect.digits.com/llms.txt" },
    ["digits.get_mcp_config"] = { method = "GET", url = "https://connect.digits.com/.well-known/mcp.json" },
    ["digits.get_mcp_server_card"] = { method = "GET", url = "https://connect.digits.com/.well-known/mcp/server.json" },
    ["digits.get_sitemap"] = { method = "GET", url = "https://connect.digits.com/sitemap.xml" },
  },
}
