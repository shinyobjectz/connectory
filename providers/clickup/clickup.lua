-- ClickUp — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/clickup.com/1.0.0/openapi.json
-- APIs.guru's mirror of clickup.com, matched on clickup.com. A mirror lags the vendor.
-- 2 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "clickup",
  name = "ClickUp",
  base = "https://api.clickup.com",
  docs = "https://nango.dev/docs/api-integrations/clickup",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "CLICKUP_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["clickup.create_a_new_question"] = { method = "POST", url = "https://api.clickup.com/questions", body = {"choices", "question"} },
    ["clickup.list_all_questions"] = { method = "GET", url = "https://api.clickup.com/questions" },
  },
}
