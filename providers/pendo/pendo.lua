-- Pendo — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/pendo.io/1.0.0/swagger.json
-- APIs.guru's mirror of pendo.io, matched on pendo.io. A mirror lags the vendor.
-- 31 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "pendo",
  name = "Pendo",
  base = "https://app.pendo.io",
  docs = "https://nango.dev/docs/integrations/all/pendo",
  auth = {
    kind = "key",
    header = "x-pendo-integration-key",
    format = "{token}",
    env = "PENDO_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["pendo.delete_accounts_id"] = { method = "DELETE", url = "https://app.pendo.io/accounts/{id}", path = {"id"} },
    ["pendo.delete_accounts_id_tags"] = { method = "DELETE", url = "https://app.pendo.io/accounts/{id}/tags", path = {"id"} },
    ["pendo.delete_features_id_tags"] = { method = "DELETE", url = "https://app.pendo.io/features/{id}/tags", path = {"id"} },
    ["pendo.delete_users_id"] = { method = "DELETE", url = "https://app.pendo.io/users/{id}", path = {"id"} },
    ["pendo.delete_users_id_tags"] = { method = "DELETE", url = "https://app.pendo.io/users/{id}/tags", path = {"id"} },
    ["pendo.get_accounts"] = { method = "GET", url = "https://app.pendo.io/accounts", query = {"limit", "start", "order_dir", "order_by"} },
    ["pendo.get_accounts_id"] = { method = "GET", url = "https://app.pendo.io/accounts/{id}", path = {"id"} },
    ["pendo.get_accounts_id_tags"] = { method = "GET", url = "https://app.pendo.io/accounts/{id}/tags", path = {"id"} },
    ["pendo.get_comments"] = { method = "GET", url = "https://app.pendo.io/comments", query = {"case_id"} },
    ["pendo.get_features"] = { method = "GET", url = "https://app.pendo.io/features", query = {"limit", "start", "order_dir", "is_private", "wanted_by", "order_by", "tags", "products"} },
    ["pendo.get_features_id"] = { method = "GET", url = "https://app.pendo.io/features/{id}", path = {"id"} },
    ["pendo.get_features_id_tags"] = { method = "GET", url = "https://app.pendo.io/features/{id}/tags", path = {"id"} },
    ["pendo.get_health_check_ping"] = { method = "GET", url = "https://app.pendo.io/health-check/ping" },
    ["pendo.get_search"] = { method = "GET", url = "https://app.pendo.io/search", query = {"scope", "q", "status", "tags", "products"} },
    ["pendo.get_users"] = { method = "GET", url = "https://app.pendo.io/users", query = {"role", "account", "start", "limit", "order_by", "order_dir"} },
    ["pendo.get_users_id"] = { method = "GET", url = "https://app.pendo.io/users/{id}", path = {"id"} },
    ["pendo.get_users_id_tags"] = { method = "GET", url = "https://app.pendo.io/users/{id}/tags", path = {"id"} },
    ["pendo.get_users_search"] = { method = "GET", url = "https://app.pendo.io/users/search", query = {"external_id", "email", "role"} },
    ["pendo.get_votes"] = { method = "GET", url = "https://app.pendo.io/votes", query = {"user_id", "feature_id", "positive", "negative", "offset", "limit"} },
    ["pendo.post_accounts_id_tags"] = { method = "POST", url = "https://app.pendo.io/accounts/{id}/tags", path = {"id"}, body = {"tags"} },
    ["pendo.post_features_id_tags"] = { method = "POST", url = "https://app.pendo.io/features/{id}/tags", path = {"id"}, body = {"tags"} },
    ["pendo.post_hooks"] = { method = "POST", url = "https://app.pendo.io/hooks", body = {"event", "target_url", "data"} },
    ["pendo.post_hooks_unsubscribe"] = { method = "POST", url = "https://app.pendo.io/hooks/unsubscribe", body = {"target_url", "data"} },
    ["pendo.post_users"] = { method = "POST", url = "https://app.pendo.io/users", body = {"account", "return_url", "user", "data"} },
    ["pendo.post_users_id_tags"] = { method = "POST", url = "https://app.pendo.io/users/{id}/tags", path = {"id"}, body = {"tags"} },
    ["pendo.post_users_invite_end_user"] = { method = "POST", url = "https://app.pendo.io/users/invite_end_user", body = {"account_external_id", "account_name", "account_status", "email", "full_name", "monthly_value", "send_invite", "user_external_id", "data"} },
    ["pendo.post_users_invite_vendor_user"] = { method = "POST", url = "https://app.pendo.io/users/invite_vendor_user", body = {"email", "external_id", "full_name", "permission_group_id", "team", "data"} },
    ["pendo.post_vendor_users"] = { method = "POST", url = "https://app.pendo.io/vendor_users", body = {"email", "external_id", "full_name", "permission_group_id", "team", "data"} },
    ["pendo.post_votes"] = { method = "POST", url = "https://app.pendo.io/votes", body = {"user_id", "votes", "data"} },
    ["pendo.put_accounts_id"] = { method = "PUT", url = "https://app.pendo.io/accounts/{id}", path = {"id"}, body = {"monthly_value", "name", "status", "account"} },
    ["pendo.put_users_id"] = { method = "PUT", url = "https://app.pendo.io/users/{id}", path = {"id"}, body = {"email", "external_id", "name", "permission_group_id", "user"} },
  },
}
