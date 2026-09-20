-- SurveyMonkey — every call this API accepts, as data.
--
-- GENERATED from https://surveymonkey.com/openapi.json
-- Published on the vendor's own documentation site (https://surveymonkey.com).
-- 4 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "survey-monkey",
  name = "SurveyMonkey",
  base = "https://api.surveymonkey.com",
  docs = "https://nango.dev/docs/integrations/all/survey-monkey",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "SURVEY_MONKEY_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["survey-monkey.get_pricing"] = { method = "GET", url = "https://api.surveymonkey.com/pricing/" },
    ["survey-monkey.get_pricing_md"] = { method = "GET", url = "https://api.surveymonkey.com/pricing.md" },
    ["survey-monkey.get_sign_up"] = { method = "GET", url = "https://api.surveymonkey.com/sign-up/" },
    ["survey-monkey.get_signup_md"] = { method = "GET", url = "https://api.surveymonkey.com/signup.md" },
  },
}
