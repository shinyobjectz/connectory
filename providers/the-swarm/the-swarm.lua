-- The Swarm — every call this API accepts, as data.
--
-- GENERATED from https://docs.theswarm.com/openapi.json
-- Published on the vendor's own documentation site (https://docs.theswarm.com).
-- 26 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "the-swarm",
  name = "The Swarm",
  base = "https://bee.theswarm.com",
  docs = "https://nango.dev/docs/api-integrations/the-swarm",
  auth = {
    kind = "key",
    header = "x-api-key",
    format = "{token}",
    env = "THE_SWARM_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["the-swarm.add_connector"] = { method = "POST", url = "https://bee.theswarm.com/team/add-connector", body = {"linkedin_usernames", "group"} },
    ["the-swarm.aggregate_profiles"] = { method = "POST", url = "https://bee.theswarm.com/v2/profiles/aggregate", body = {"query", "field"} },
    ["the-swarm.create_team"] = { method = "POST", url = "https://bee.theswarm.com/team/create-team", body = {"team_name", "owner_email", "company_website", "company_linkedin_url"} },
    ["the-swarm.fetch_companies"] = { method = "POST", url = "https://bee.theswarm.com/companies/fetch", body = {"ids", "linkedinNames", "linkedinIds", "fields"} },
    ["the-swarm.fetch_companies_v3"] = { method = "POST", url = "https://bee.theswarm.com/v3/companies/fetch", header = {"x-authenticate-team"}, body = {"ids", "linkedin_names", "linkedin_ids", "fields"} },
    ["the-swarm.fetch_profiles"] = { method = "POST", url = "https://bee.theswarm.com/v2/profiles/fetch", body = {"ids", "linkedinNames", "linkedinIds", "linkedinEntityIds", "fields"} },
    ["the-swarm.fetch_profiles_v3"] = { method = "POST", url = "https://bee.theswarm.com/v3/profiles/fetch", header = {"x-authenticate-team"}, body = {"ids", "linkedin_names", "linkedin_ids", "linkedin_entity_ids", "fields"} },
    ["the-swarm.get_company_posts"] = { method = "GET", url = "https://bee.theswarm.com/social/company/posts", query = {"linkedinID", "linkedinName", "perPage", "page"} },
    ["the-swarm.get_credits_usage"] = { method = "GET", url = "https://bee.theswarm.com/credits/usage" },
    ["the-swarm.get_partner_network_status"] = { method = "GET", url = "https://bee.theswarm.com/v2/network-mapper/partner/network/status", query = {"task_id"} },
    ["the-swarm.get_partner_network_status_v3"] = { method = "GET", url = "https://bee.theswarm.com/v3/network-mapper/status", query = {"task_id"} },
    ["the-swarm.get_post_comments"] = { method = "GET", url = "https://bee.theswarm.com/social/post/{urn}/comments", path = {"urn"}, query = {"page", "perPage"} },
    ["the-swarm.get_post_reactions"] = { method = "GET", url = "https://bee.theswarm.com/social/post/{urn}/reactions", path = {"urn"}, query = {"page", "perPage"} },
    ["the-swarm.get_post_reshares"] = { method = "GET", url = "https://bee.theswarm.com/social/post/{urn}/reshares", path = {"urn"}, query = {"page", "perPage"} },
    ["the-swarm.get_profile_posts"] = { method = "GET", url = "https://bee.theswarm.com/social/profile/posts", query = {"linkedinID", "linkedinName", "linkedinEntityID", "perPage", "paginationToken"} },
    ["the-swarm.get_refreshed_profile"] = { method = "GET", url = "https://bee.theswarm.com/v2/profiles/fetch/refresh", query = {"linkedinName"} },
    ["the-swarm.mcp"] = { method = "POST", url = "https://bee.theswarm.com/mcp" },
    ["the-swarm.network_mapper"] = { method = "POST", url = "https://bee.theswarm.com/v2/profiles/network-mapper", body = {"query", "mapping_company_website", "callback_url"} },
    ["the-swarm.network_mapper_task_status"] = { method = "POST", url = "https://bee.theswarm.com/v2/profiles/network-mapper-task-status", body = {"task_id"} },
    ["the-swarm.post_partner_network"] = { method = "POST", url = "https://bee.theswarm.com/v2/network-mapper/partner/network", body = {"query", "mapping_company_website", "callback_url"} },
    ["the-swarm.post_partner_network_v3"] = { method = "POST", url = "https://bee.theswarm.com/v3/network-mapper", body = {"query", "mapping_company_website", "callback_url"} },
    ["the-swarm.relationships_v3"] = { method = "POST", url = "https://bee.theswarm.com/v3/relationships", header = {"x-authenticate-team"}, body = {"query", "limit", "pagination_token"} },
    ["the-swarm.search_companies"] = { method = "POST", url = "https://bee.theswarm.com/companies/search", body = {"query", "limit", "paginationToken", "stable_pagination"} },
    ["the-swarm.search_companies_v3"] = { method = "POST", url = "https://bee.theswarm.com/v3/companies/search", header = {"x-authenticate-team"}, body = {"query", "limit", "pagination_token", "stable_pagination"} },
    ["the-swarm.search_profiles"] = { method = "POST", url = "https://bee.theswarm.com/v2/profiles/search", body = {"query", "limit", "paginationToken", "stable_pagination", "inNetworkOnly"} },
    ["the-swarm.search_profiles_v3"] = { method = "POST", url = "https://bee.theswarm.com/v3/profiles/search", header = {"x-authenticate-team"}, body = {"query", "limit", "pagination_token", "stable_pagination", "in_network_only"} },
  },
}
