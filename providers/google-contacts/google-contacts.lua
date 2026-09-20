-- Google Contacts — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/googleapis.com/essentialcontacts/v1/openapi.json
-- APIs.guru's mirror of googleapis.com:essentialcontacts, matched on googleapis.com. A mirror lags the vendor.
-- 7 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "google-contacts",
  name = "Google Contacts",
  base = "https://people.googleapis.com",
  docs = "https://nango.dev/docs/api-integrations/google-contacts",
  auth = {
    kind = "manual",
    header = "authorization",
    format = "Bearer {token}",
    env = "GOOGLE_CONTACTS_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["google-contacts.essentialcontacts_projects_contacts_compute"] = { method = "GET", url = "https://people.googleapis.com/v1/{parent}/contacts:compute", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "notificationCategories", "pageSize", "pageToken"} },
    ["google-contacts.essentialcontacts_projects_contacts_create"] = { method = "POST", url = "https://people.googleapis.com/v1/{parent}/contacts", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"email", "languageTag", "name", "notificationCategorySubscriptions", "validateTime", "validationState"} },
    ["google-contacts.essentialcontacts_projects_contacts_delete"] = { method = "DELETE", url = "https://people.googleapis.com/v1/{name}", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-contacts.essentialcontacts_projects_contacts_get"] = { method = "GET", url = "https://people.googleapis.com/v1/{name}", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-contacts.essentialcontacts_projects_contacts_list"] = { method = "GET", url = "https://people.googleapis.com/v1/{parent}/contacts", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "pageSize", "pageToken"} },
    ["google-contacts.essentialcontacts_projects_contacts_patch"] = { method = "PATCH", url = "https://people.googleapis.com/v1/{name}", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "updateMask"}, body = {"email", "languageTag", "name", "notificationCategorySubscriptions", "validateTime", "validationState"} },
    ["google-contacts.essentialcontacts_projects_contacts_send_test_message"] = { method = "POST", url = "https://people.googleapis.com/v1/{resource}/contacts:sendTestMessage", path = {"resource"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"contacts", "notificationCategory"} },
  },
}
