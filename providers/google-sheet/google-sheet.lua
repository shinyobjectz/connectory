-- Google Sheet — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/googleapis.com/sheets/v4/openapi.json
-- APIs.guru's mirror of googleapis.com:sheets, matched on googleapis.com. A mirror lags the vendor.
-- 17 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "google-sheet",
  name = "Google Sheet",
  base = "https://sheets.googleapis.com",
  docs = "https://nango.dev/docs/api-integrations/google-sheet",
  auth = {
    kind = "manual",
    header = "authorization",
    format = "Bearer {token}",
    env = "GOOGLE_SHEET_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["google-sheet.sheets_spreadsheets_batch_update"] = { method = "POST", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}:batchUpdate", path = {"spreadsheetId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"includeSpreadsheetInResponse", "requests", "responseIncludeGridData", "responseRanges"} },
    ["google-sheet.sheets_spreadsheets_create"] = { method = "POST", url = "https://sheets.googleapis.com/v4/spreadsheets", query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"dataSourceSchedules", "dataSources", "developerMetadata", "namedRanges", "properties", "sheets", "spreadsheetId", "spreadsheetUrl"} },
    ["google-sheet.sheets_spreadsheets_developer_metadata_get"] = { method = "GET", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/developerMetadata/{metadataId}", path = {"spreadsheetId", "metadataId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-sheet.sheets_spreadsheets_developer_metadata_search"] = { method = "POST", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/developerMetadata:search", path = {"spreadsheetId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"dataFilters"} },
    ["google-sheet.sheets_spreadsheets_get"] = { method = "GET", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}", path = {"spreadsheetId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "includeGridData", "ranges"} },
    ["google-sheet.sheets_spreadsheets_get_by_data_filter"] = { method = "POST", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}:getByDataFilter", path = {"spreadsheetId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"dataFilters", "includeGridData"} },
    ["google-sheet.sheets_spreadsheets_sheets_copy_to"] = { method = "POST", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/sheets/{sheetId}:copyTo", path = {"spreadsheetId", "sheetId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"destinationSpreadsheetId"} },
    ["google-sheet.sheets_spreadsheets_values_append"] = { method = "POST", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values/{range}:append", path = {"spreadsheetId", "range"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "includeValuesInResponse", "insertDataOption", "responseDateTimeRenderOption", "responseValueRenderOption", "valueInputOption"}, body = {"majorDimension", "range", "values"} },
    ["google-sheet.sheets_spreadsheets_values_batch_clear"] = { method = "POST", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchClear", path = {"spreadsheetId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"ranges"} },
    ["google-sheet.sheets_spreadsheets_values_batch_clear_by_data_filter"] = { method = "POST", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchClearByDataFilter", path = {"spreadsheetId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"dataFilters"} },
    ["google-sheet.sheets_spreadsheets_values_batch_get"] = { method = "GET", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchGet", path = {"spreadsheetId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "dateTimeRenderOption", "majorDimension", "ranges", "valueRenderOption"} },
    ["google-sheet.sheets_spreadsheets_values_batch_get_by_data_filter"] = { method = "POST", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchGetByDataFilter", path = {"spreadsheetId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"dataFilters", "dateTimeRenderOption", "majorDimension", "valueRenderOption"} },
    ["google-sheet.sheets_spreadsheets_values_batch_update"] = { method = "POST", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchUpdate", path = {"spreadsheetId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"data", "includeValuesInResponse", "responseDateTimeRenderOption", "responseValueRenderOption", "valueInputOption"} },
    ["google-sheet.sheets_spreadsheets_values_batch_update_by_data_filter"] = { method = "POST", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchUpdateByDataFilter", path = {"spreadsheetId"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"data", "includeValuesInResponse", "responseDateTimeRenderOption", "responseValueRenderOption", "valueInputOption"} },
    ["google-sheet.sheets_spreadsheets_values_clear"] = { method = "POST", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values/{range}:clear", path = {"spreadsheetId", "range"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-sheet.sheets_spreadsheets_values_get"] = { method = "GET", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values/{range}", path = {"spreadsheetId", "range"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "dateTimeRenderOption", "majorDimension", "valueRenderOption"} },
    ["google-sheet.sheets_spreadsheets_values_update"] = { method = "PUT", url = "https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values/{range}", path = {"spreadsheetId", "range"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "includeValuesInResponse", "responseDateTimeRenderOption", "responseValueRenderOption", "valueInputOption"}, body = {"majorDimension", "range", "values"} },
  },
}
