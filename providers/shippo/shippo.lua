-- Shippo — every call this API accepts, as data.
--
-- GENERATED from https://docs.goshippo.com/api-reference/openapi.json
-- Published on the vendor's own documentation site (https://docs.goshippo.com).
-- 3 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "shippo",
  name = "Shippo",
  base = "https://api.goshippo.com",
  docs = "https://nango.dev/docs/api-integrations/shippo",
  auth = {
    kind = "key",
    header = "authorization",
    format = "ShippoToken {token}",
    env = "SHIPPO_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["shippo.delete_plants_id"] = { method = "DELETE", url = "https://api.goshippo.com/plants/{id}", path = {"id"} },
    ["shippo.get_plants"] = { method = "GET", url = "https://api.goshippo.com/plants", query = {"limit"} },
    ["shippo.post_plants"] = { method = "POST", url = "https://api.goshippo.com/plants", body = {"name", "tag"} },
  },
}
