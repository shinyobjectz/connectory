-- Heymarket — every call this API accepts, as data.
--
-- GENERATED from https://developers.heymarket.com/api-reference/openapi.json
-- Published on the vendor's own documentation site (https://developers.heymarket.com).
-- 3 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "heymarket",
  name = "Heymarket",
  base = "https://api.heymarket.com",
  docs = "https://nango.dev/docs/api-integrations/heymarket",
  auth = {
    kind = "manual",
    header = "authorization",
    format = "Bearer {token}",
    env = "HEYMARKET_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["heymarket.delete_plants_id"] = { method = "DELETE", url = "https://api.heymarket.com/plants/{id}", path = {"id"} },
    ["heymarket.get_plants"] = { method = "GET", url = "https://api.heymarket.com/plants", query = {"limit"} },
    ["heymarket.post_plants"] = { method = "POST", url = "https://api.heymarket.com/plants", body = {"name", "tag"} },
  },
}
