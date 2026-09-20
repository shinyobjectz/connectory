-- Smartlead.ai — every call this API accepts, as data.
--
-- GENERATED from https://api.smartlead.ai/api-reference/openapi.json
-- Published on the vendor's own documentation site (https://api.smartlead.ai).
-- 3 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "smartlead-ai",
  name = "Smartlead.ai",
  base = "https://server.smartlead.ai/api",
  docs = "https://nango.dev/docs/integrations/all/smartlead-ai",
  auth = {
    kind = "key",
    header = "authorization",
    format = "Bearer {token}",
    env = "SMARTLEAD_AI_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["smartlead-ai.delete_plants_id"] = { method = "DELETE", url = "https://server.smartlead.ai/api/plants/{id}", path = {"id"} },
    ["smartlead-ai.get_plants"] = { method = "GET", url = "https://server.smartlead.ai/api/plants", query = {"limit"} },
    ["smartlead-ai.post_plants"] = { method = "POST", url = "https://server.smartlead.ai/api/plants", body = {"name", "tag"} },
  },
}
