-- RapidAPI — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/rapidapi.com/ecowetter/1.0.0/openapi.json
-- APIs.guru's mirror, matched on rapidapi.com. A mirror lags the vendor.
-- 1 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "rapidapi",
  name = "RapidAPI",
  base = "https://{subdomain}.p.rapidapi.com",
  docs = "https://nango.dev/docs/integrations/all/rapidapi",
  auth = {
    kind = "key",
    header = "x-rapidapi-key",
    format = "{token}",
    env = "RAPIDAPI_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = { ["subdomain"] = "RAPIDAPI_SUBDOMAIN" },
  headers = {},
  operations = {
    ["rapidapi.get_public_history"] = { method = "GET", url = "https://{subdomain}.p.rapidapi.com/public/history", query = {"q", "from", "to"} },
  },
}
