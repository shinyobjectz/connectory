-- Google Forms — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/googleapis.com/forms/v1/openapi.json
-- APIs.guru's mirror of googleapis.com:forms, matched on googleapis.com. A mirror lags the vendor.
-- 9 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "google-forms",
  name = "Google Forms",
  base = "https://forms.googleapis.com",
  docs = "https://nango.dev/docs/api-integrations/google-forms",
  auth = {
    kind = "manual",
    header = "authorization",
    format = "Bearer {token}",
    env = "GOOGLE_FORMS_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["google-forms.forms_forms_batch_update"] = { method = "POST", url = "https://forms.googleapis.com/v1/forms/{formId}:batchUpdate", path = {"formId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"includeFormInResponse", "requests", "writeControl"} },
    ["google-forms.forms_forms_create"] = { method = "POST", url = "https://forms.googleapis.com/v1/forms", query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"formId", "info", "items", "linkedSheetId", "responderUri", "revisionId", "settings"} },
    ["google-forms.forms_forms_get"] = { method = "GET", url = "https://forms.googleapis.com/v1/forms/{formId}", path = {"formId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-forms.forms_forms_responses_get"] = { method = "GET", url = "https://forms.googleapis.com/v1/forms/{formId}/responses/{responseId}", path = {"formId", "responseId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-forms.forms_forms_responses_list"] = { method = "GET", url = "https://forms.googleapis.com/v1/forms/{formId}/responses", path = {"formId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "filter", "pageSize", "pageToken"} },
    ["google-forms.forms_forms_watches_create"] = { method = "POST", url = "https://forms.googleapis.com/v1/forms/{formId}/watches", path = {"formId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"watch", "watchId"} },
    ["google-forms.forms_forms_watches_delete"] = { method = "DELETE", url = "https://forms.googleapis.com/v1/forms/{formId}/watches/{watchId}", path = {"formId", "watchId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-forms.forms_forms_watches_list"] = { method = "GET", url = "https://forms.googleapis.com/v1/forms/{formId}/watches", path = {"formId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-forms.forms_forms_watches_renew"] = { method = "POST", url = "https://forms.googleapis.com/v1/forms/{formId}/watches/{watchId}:renew", path = {"formId", "watchId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
  },
}
