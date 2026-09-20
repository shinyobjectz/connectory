-- Zapier — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/zapier.com/nla/1.0.0/openapi.json
-- APIs.guru's mirror, matched on zapier.com. A mirror lags the vendor.
-- 4 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "zapier",
  name = "Zapier",
  base = "https://api.zapier.com",
  docs = "https://nango.dev/docs/api-integrations/zapier",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "ZAPIER_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["zapier.check"] = { method = "GET", url = "https://api.zapier.com/api/v1/check/" },
    ["zapier.execute_app_action_endpoint"] = { method = "POST", url = "https://api.zapier.com/api/v1/exposed/{exposed_app_action_id}/execute/", path = {"exposed_app_action_id"}, body = {"instructions", "preview_only"} },
    ["zapier.get_configuration_link"] = { method = "GET", url = "https://api.zapier.com/api/v1/configuration-link/" },
    ["zapier.list_exposed_actions"] = { method = "GET", url = "https://api.zapier.com/api/v1/exposed/" },
  },
}
