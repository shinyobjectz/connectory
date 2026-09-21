-- Zapier NLA — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/zapier.com/nla/1.0.0/openapi.json
-- APIs.guru's mirror of zapier.com:nla, matched on zapier.com. A mirror lags the vendor.
-- 4 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "zapier-nla",
  name = "Zapier NLA",
  base = "https://nla.zapier.com",
  docs = "https://nango.dev/docs/integrations/all/zapier-nla",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "ZAPIER_NLA_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["zapier-nla.check"] = { method = "GET", url = "https://nla.zapier.com/api/v1/check/" },
    ["zapier-nla.execute_app_action_endpoint"] = { method = "POST", url = "https://nla.zapier.com/api/v1/exposed/{exposed_app_action_id}/execute/", path = {"exposed_app_action_id"}, body = {"instructions", "preview_only"} },
    ["zapier-nla.get_configuration_link"] = { method = "GET", url = "https://nla.zapier.com/api/v1/configuration-link/" },
    ["zapier-nla.list_exposed_actions"] = { method = "GET", url = "https://nla.zapier.com/api/v1/exposed/" },
  },
}
