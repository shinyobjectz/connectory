-- Ocean.io — every call this API accepts, as data.
--
-- GENERATED from https://api.ocean.io/openapi.json
-- Published on the vendor's own documentation site (https://api.ocean.io).
-- 24 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "ocean-io",
  name = "Ocean.io",
  base = "https://api.ocean.io",
  docs = "https://nango.dev/docs/api-integrations/ocean-io",
  auth = {
    kind = "key",
    header = "x-api-token",
    format = "{token}",
    env = "OCEAN_IO_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["ocean-io.add_marked_domains"] = { method = "POST", url = "https://api.ocean.io/v2/segmentation/{segmentation_id}/markDomains", path = {"segmentation_id"}, query = {"apiToken"}, header = {"x-api-token"}, body = {"domains", "type"} },
    ["ocean-io.attribute_segmentation_domains"] = { method = "POST", url = "https://api.ocean.io/v2/segmentation/{segmentation_id}/attribute-domains", path = {"segmentation_id"}, query = {"apiToken"}, header = {"x-api-token"}, body = {"domains"} },
    ["ocean-io.auto_complete_company"] = { method = "POST", url = "https://api.ocean.io/v2/autocomplete/companies", query = {"apiToken"}, header = {"x-api-token"}, body = {"name", "countryFilters", "excludeDomains", "forLookalikeSearch"} },
    ["ocean-io.auto_complete_job_titles"] = { method = "POST", url = "https://api.ocean.io/v2/autocomplete/job-titles", query = {"apiToken"}, header = {"x-api-token"}, body = {"query", "limit"} },
    ["ocean-io.auto_complete_keywords"] = { method = "POST", url = "https://api.ocean.io/v2/autocomplete/keywords", query = {"apiToken"}, header = {"x-api-token"}, body = {"query", "limit"} },
    ["ocean-io.auto_complete_locations"] = { method = "POST", url = "https://api.ocean.io/v2/autocomplete/locations", query = {"apiToken"}, header = {"x-api-token"}, body = {"query", "limit", "locationType"} },
    ["ocean-io.auto_complete_skills"] = { method = "POST", url = "https://api.ocean.io/v2/autocomplete/skills", query = {"apiToken"}, header = {"x-api-token"}, body = {"query", "limit"} },
    ["ocean-io.create_segmentation"] = { method = "POST", url = "https://api.ocean.io/v2/segmentation", query = {"apiToken"}, header = {"x-api-token"}, body = {"domains", "leadScoringFeatures", "numberOfSegmentsMode", "positiveDomains", "negativeDomains"} },
    ["ocean-io.enrich_companies"] = { method = "POST", url = "https://api.ocean.io/v2/enrich/companies", query = {"apiToken"}, header = {"x-api-token"}, body = {"companyDataMapping", "webhookUrl", "fields"} },
    ["ocean-io.enrich_company"] = { method = "POST", url = "https://api.ocean.io/v2/enrich/company", query = {"apiToken"}, header = {"x-api-token"}, body = {"company", "people", "fields"} },
    ["ocean-io.enrich_people"] = { method = "POST", url = "https://api.ocean.io/v2/enrich/people", query = {"apiToken"}, header = {"x-api-token"}, body = {"peopleDataMapping", "webhookUrl"} },
    ["ocean-io.enrich_person"] = { method = "POST", url = "https://api.ocean.io/v2/enrich/person", query = {"apiToken"}, header = {"x-api-token"}, body = {"person", "company", "revealEmails", "revealPhones"} },
    ["ocean-io.get_credit_balance"] = { method = "GET", url = "https://api.ocean.io/v2/credits/balance", query = {"apiToken"}, header = {"x-api-token"} },
    ["ocean-io.get_data_fields_public"] = { method = "GET", url = "https://api.ocean.io/v2/data-fields", query = {"apiToken"}, header = {"x-api-token"} },
    ["ocean-io.get_segmentation"] = { method = "GET", url = "https://api.ocean.io/v2/segmentation/{segmentation_id}", path = {"segmentation_id"}, query = {"apiToken"}, header = {"x-api-token"} },
    ["ocean-io.lookup_companies"] = { method = "POST", url = "https://api.ocean.io/v2/lookup/companies", query = {"apiToken"}, header = {"x-api-token"}, body = {"domains", "fields"} },
    ["ocean-io.lookup_people"] = { method = "POST", url = "https://api.ocean.io/v2/lookup/people", query = {"apiToken"}, header = {"x-api-token"}, body = {"linkedinHandles", "oceanIds"} },
    ["ocean-io.preview_search_companies_v3"] = { method = "POST", url = "https://api.ocean.io/v3/search/companies/preview", query = {"apiToken"}, header = {"x-api-token"}, body = {"size", "companiesFilters", "peopleFilters"} },
    ["ocean-io.reveal_emails"] = { method = "POST", url = "https://api.ocean.io/v2/reveal/emails", query = {"apiToken"}, header = {"x-api-token"}, body = {"personIds", "webhookUrl"} },
    ["ocean-io.reveal_phones"] = { method = "POST", url = "https://api.ocean.io/v2/reveal/phones", query = {"apiToken"}, header = {"x-api-token"}, body = {"personIds", "webhookUrl"} },
    ["ocean-io.search_companies_v3"] = { method = "POST", url = "https://api.ocean.io/v3/search/companies", query = {"apiToken"}, header = {"x-api-token"}, body = {"size", "searchAfter", "companiesFilters", "peopleFilters", "fields"} },
    ["ocean-io.search_people_v3"] = { method = "POST", url = "https://api.ocean.io/v3/search/people", query = {"apiToken"}, header = {"x-api-token"}, body = {"size", "peopleFilters", "companiesFilters", "peoplePerCompany", "jobTitleThreshold", "searchAfter", "fields"} },
    ["ocean-io.search_people_v3_preview"] = { method = "POST", url = "https://api.ocean.io/v3/search/people/preview", query = {"apiToken"}, header = {"x-api-token"}, body = {"size", "peopleFilters", "companiesFilters", "peoplePerCompany", "jobTitleThreshold", "searchAfter", "fields"} },
    ["ocean-io.warmup_companies"] = { method = "POST", url = "https://api.ocean.io/v2/warmup/companies", query = {"apiToken"}, header = {"x-api-token"}, body = {"domains"} },
  },
}
