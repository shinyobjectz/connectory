-- Monday — every call this API accepts, as data.
--
-- GENERATED from https://monday.com/openapi.json
-- Published on the vendor's own documentation site (https://monday.com).
-- 2 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "monday",
  name = "Monday",
  base = "https://api.monday.com",
  docs = "https://nango.dev/docs/api-integrations/monday",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "MONDAY_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["monday.get_schema"] = { method = "GET", url = "https://api.monday.com/v2/get_schema", query = {"format", "version"} },
    ["monday.graphql"] = { method = "POST", url = "https://api.monday.com/v2", header = {"Idempotency-Key"}, body = {"query", "variables", "operationName"} },
  },
}
