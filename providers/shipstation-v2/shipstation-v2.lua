-- Shipstation — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/shipstation.com/1.0.0/openapi.json
-- APIs.guru's mirror of shipstation.com, matched on shipstation.com. A mirror lags the vendor.
-- 2 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "shipstation-v2",
  name = "Shipstation",
  base = "https://api.shipstation.com",
  docs = "https://nango.dev/docs/integrations/all/shipstation-v2",
  auth = {
    kind = "key",
    header = "api-key",
    format = "{token}",
    env = "SHIPSTATION_V2_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["shipstation-v2.create_a_new_question"] = { method = "POST", url = "https://api.shipstation.com/questions", body = {"choices", "question"} },
    ["shipstation-v2.list_all_questions"] = { method = "GET", url = "https://api.shipstation.com/questions" },
  },
}
