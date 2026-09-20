-- FullEnrich — every call this API accepts, as data.
--
-- GENERATED from https://docs.fullenrich.com/api-reference/openapi.json
-- Published on the vendor's own documentation site (https://docs.fullenrich.com).
-- 3 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "fullenrich",
  name = "FullEnrich",
  base = "https://app.fullenrich.com/api",
  docs = "https://nango.dev/docs/api-integrations/fullenrich",
  auth = {
    kind = "key",
    header = "authorization",
    format = "Bearer {token}",
    env = "FULLENRICH_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["fullenrich.delete_plants_id"] = { method = "DELETE", url = "https://app.fullenrich.com/api/plants/{id}", path = {"id"} },
    ["fullenrich.get_plants"] = { method = "GET", url = "https://app.fullenrich.com/api/plants", query = {"limit"} },
    ["fullenrich.post_plants"] = { method = "POST", url = "https://app.fullenrich.com/api/plants", body = {"name", "tag"} },
  },
}
