-- Google Search Console — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/googleapis.com/kgsearch/v1/openapi.json
-- APIs.guru's mirror of googleapis.com:kgsearch, matched on googleapis.com. A mirror lags the vendor.
-- 1 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "google-search-console",
  name = "Google Search Console",
  base = "https://www.googleapis.com/webmasters",
  docs = "https://nango.dev/docs/api-integrations/google-search-console",
  auth = {
    kind = "manual",
    header = "authorization",
    format = "Bearer {token}",
    env = "GOOGLE_SEARCH_CONSOLE_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["google-search-console.kgsearch_entities_search"] = { method = "GET", url = "https://www.googleapis.com/webmasters/v1/entities:search", query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "ids", "indent", "languages", "limit", "prefix", "query", "types"} },
  },
}
