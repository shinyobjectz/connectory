-- Google Docs — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/googleapis.com/docs/v1/openapi.json
-- APIs.guru's mirror of googleapis.com:docs, matched on googleapis.com. A mirror lags the vendor.
-- 3 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "google-docs",
  name = "Google Docs",
  base = "https://docs.googleapis.com",
  docs = "https://nango.dev/docs/api-integrations/google-docs",
  auth = {
    kind = "manual",
    header = "authorization",
    format = "Bearer {token}",
    env = "GOOGLE_DOCS_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["google-docs.docs_documents_batch_update"] = { method = "POST", url = "https://docs.googleapis.com/v1/documents/{documentId}:batchUpdate", path = {"documentId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"requests", "writeControl"} },
    ["google-docs.docs_documents_create"] = { method = "POST", url = "https://docs.googleapis.com/v1/documents", query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"body", "documentId", "documentStyle", "footers", "footnotes", "headers", "inlineObjects", "lists", "namedRanges", "namedStyles", "positionedObjects", "revisionId", "suggestedDocumentStyleChanges", "suggestedNamedStylesChanges", "suggestionsViewMode", "title"} },
    ["google-docs.docs_documents_get"] = { method = "GET", url = "https://docs.googleapis.com/v1/documents/{documentId}", path = {"documentId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "suggestionsViewMode"} },
  },
}
