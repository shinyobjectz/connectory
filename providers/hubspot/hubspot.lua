-- HubSpot — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/hubapi.com/cms/v3/openapi.json
-- APIs.guru's mirror, matched on hubapi.com. A mirror lags the vendor.
-- 2 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "hubspot",
  name = "HubSpot",
  base = "https://api.hubapi.com",
  docs = "https://nango.dev/docs/api-integrations/hubspot",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "HUBSPOT_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["hubspot.get_cms_v3_domains_domain_id_get_by_id"] = { method = "GET", url = "https://api.hubapi.com/cms/v3/domains/{domainId}", path = {"domainId"} },
    ["hubspot.get_cms_v3_domains_get_page"] = { method = "GET", url = "https://api.hubapi.com/cms/v3/domains/", query = {"createdAt", "createdAfter", "createdBefore", "updatedAt", "updatedAfter", "updatedBefore", "sort", "after", "limit", "archived"} },
  },
}
