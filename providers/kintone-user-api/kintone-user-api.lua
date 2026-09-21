-- Kintone User API — every call this API accepts, as data.
--
-- GENERATED from https://raw.githubusercontent.com/kintone/rest-api-spec/main/kintone/20250423000000/openapi.yaml
-- Published by kintone, the vendor's own GitHub organisation.
-- 0 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "kintone-user-api",
  name = "Kintone User API",
  base = "https://{subdomain}.kintone.com",
  docs = "https://nango.dev/docs/integrations/all/kintone-user-api",
  auth = {
    kind = "key",
    header = "authorization",
    format = "Bearer {token}",
    env = "KINTONE_USER_API_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = { ["subdomain"] = "KINTONE_USER_API_SUBDOMAIN" },
  headers = {},
  operations = {
  },
}
