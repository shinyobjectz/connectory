-- Gmail — every call this API accepts, as data.
--
-- GENERATED from https://www.googleapis.com/discovery/v1/apis/gmail/v1/rest
-- Google's own discovery document
-- 0 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "gmail",
  name = "Gmail",
  base = "https://gmail.googleapis.com",
  docs = "https://developers.google.com/gmail/api/reference/rest",
  auth = {
    kind = "key",
    header = "authorization",
    format = "Bearer {token}",
    env = "GOOGLE_ACCESS_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
  },
}
