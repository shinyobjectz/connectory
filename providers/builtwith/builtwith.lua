-- BuiltWith — every call this API accepts, as data.
--
-- GENERATED from https://api.builtwith.com/openapi.json
-- Published on the vendor's own documentation site (https://api.builtwith.com).
-- 14 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "builtwith",
  name = "BuiltWith",
  base = "https://api.builtwith.com",
  docs = "https://nango.dev/docs/integrations/all/builtwith",
  auth = {
    kind = "key",
    header = "authorization",
    format = "Bearer {token}",
    env = "BUILTWITH_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["builtwith.ask_for_websites"] = { method = "POST", url = "https://api.builtwith.com/agent/ask", body = {"query", "meta"} },
    ["builtwith.find_company_domains"] = { method = "POST", url = "https://api.builtwith.com/agent/company-domains", body = {"company"} },
    ["builtwith.find_domains_by_tag"] = { method = "POST", url = "https://api.builtwith.com/agent/tags", body = {"lookup"} },
    ["builtwith.find_related_websites"] = { method = "POST", url = "https://api.builtwith.com/agent/relationships", body = {"domain"} },
    ["builtwith.get_company_identifiers"] = { method = "POST", url = "https://api.builtwith.com/agent/company-identifiers", body = {"domain"} },
    ["builtwith.get_domain_keywords"] = { method = "POST", url = "https://api.builtwith.com/agent/keywords", body = {"domain"} },
    ["builtwith.get_domain_redirects"] = { method = "POST", url = "https://api.builtwith.com/agent/redirects", body = {"domain"} },
    ["builtwith.get_domain_technology_changes"] = { method = "POST", url = "https://api.builtwith.com/agent/changes", body = {"domain", "since"} },
    ["builtwith.get_domain_trust"] = { method = "POST", url = "https://api.builtwith.com/agent/trust", body = {"domain"} },
    ["builtwith.lookup_domain_technologies"] = { method = "GET", url = "https://api.builtwith.com/agent/domain", query = {"domain", "liveOnly"} },
    ["builtwith.purchase_basic_list_pass"] = { method = "POST", url = "https://api.builtwith.com/x402/list-pass/basic" },
    ["builtwith.purchase_pro_list_pass"] = { method = "POST", url = "https://api.builtwith.com/x402/list-pass/pro" },
    ["builtwith.recommend_technologies"] = { method = "POST", url = "https://api.builtwith.com/agent/recommendations", body = {"domain"} },
    ["builtwith.search_technologies"] = { method = "POST", url = "https://api.builtwith.com/agent/technology-search", body = {"query", "limit"} },
  },
}
