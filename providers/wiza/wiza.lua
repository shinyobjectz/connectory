-- Wiza — every call this API accepts, as data.
--
-- GENERATED from https://docs.wiza.co/api-reference/openapi.json
-- Published on the vendor's own documentation site (https://docs.wiza.co).
-- 3 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "wiza",
  name = "Wiza",
  base = "https://wiza.co/api",
  docs = "https://nango.dev/docs/integrations/all/wiza",
  auth = {
    kind = "key",
    header = "authorization",
    format = "Bearer {token}",
    env = "WIZA_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["wiza.delete_plants_id"] = { method = "DELETE", url = "https://wiza.co/api/plants/{id}", path = {"id"} },
    ["wiza.get_plants"] = { method = "GET", url = "https://wiza.co/api/plants", query = {"limit"} },
    ["wiza.post_plants"] = { method = "POST", url = "https://wiza.co/api/plants", body = {"name", "tag"} },
  },
}
