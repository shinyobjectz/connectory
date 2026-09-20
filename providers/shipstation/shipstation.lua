-- Shipstation — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/shipstation.com/1.0.0/openapi.json
-- APIs.guru's mirror, matched on shipstation.com. A mirror lags the vendor.
-- 2 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "shipstation",
  name = "Shipstation",
  base = "https://ssapi.shipstation.com",
  docs = "https://nango.dev/docs/integrations/all/shipstation",
  auth = {
    kind = "basic",
    header = "authorization",
    format = "Bearer {token}",
    env = nil,
    user_env = "SHIPSTATION_USER",
    pass_env = "SHIPSTATION_PASS",
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["shipstation.create_a_new_question"] = { method = "POST", url = "https://ssapi.shipstation.com/questions", body = {"choices", "question"} },
    ["shipstation.list_all_questions"] = { method = "GET", url = "https://ssapi.shipstation.com/questions" },
  },
}
