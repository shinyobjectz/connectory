-- Google — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/googleapis.com/ml/v1/openapi.json
-- APIs.guru's mirror, matched on googleapis.com. A mirror lags the vendor.
-- 29 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "google",
  name = "Google",
  base = "https://www.googleapis.com",
  docs = "https://nango.dev/docs/api-integrations/google",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "GOOGLE_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["google.ml_projects_explain"] = { method = "POST", url = "https://www.googleapis.com/v1/{name}:explain", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"httpBody"} },
    ["google.ml_projects_get_config"] = { method = "GET", url = "https://www.googleapis.com/v1/{name}:getConfig", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google.ml_projects_jobs_create"] = { method = "POST", url = "https://www.googleapis.com/v1/{parent}/jobs", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"createTime", "endTime", "errorMessage", "etag", "jobId", "jobPosition", "labels", "predictionInput", "predictionOutput", "startTime", "state", "trainingInput", "trainingOutput"} },
    ["google.ml_projects_jobs_list"] = { method = "GET", url = "https://www.googleapis.com/v1/{parent}/jobs", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "filter", "pageSize", "pageToken"} },
    ["google.ml_projects_locations_list"] = { method = "GET", url = "https://www.googleapis.com/v1/{parent}/locations", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "pageSize", "pageToken"} },
    ["google.ml_projects_locations_studies_create"] = { method = "POST", url = "https://www.googleapis.com/v1/{parent}/studies", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "studyId"}, body = {"createTime", "inactiveReason", "name", "state", "studyConfig"} },
    ["google.ml_projects_locations_studies_list"] = { method = "GET", url = "https://www.googleapis.com/v1/{parent}/studies", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google.ml_projects_locations_studies_trials_add_measurement"] = { method = "POST", url = "https://www.googleapis.com/v1/{name}:addMeasurement", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"measurement"} },
    ["google.ml_projects_locations_studies_trials_check_early_stopping_state"] = { method = "POST", url = "https://www.googleapis.com/v1/{name}:checkEarlyStoppingState", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google.ml_projects_locations_studies_trials_complete"] = { method = "POST", url = "https://www.googleapis.com/v1/{name}:complete", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"finalMeasurement", "infeasibleReason", "trialInfeasible"} },
    ["google.ml_projects_locations_studies_trials_create"] = { method = "POST", url = "https://www.googleapis.com/v1/{parent}/trials", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"clientId", "endTime", "finalMeasurement", "infeasibleReason", "measurements", "name", "parameters", "startTime", "state", "trialInfeasible"} },
    ["google.ml_projects_locations_studies_trials_list"] = { method = "GET", url = "https://www.googleapis.com/v1/{parent}/trials", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google.ml_projects_locations_studies_trials_list_optimal_trials"] = { method = "POST", url = "https://www.googleapis.com/v1/{parent}/trials:listOptimalTrials", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google.ml_projects_locations_studies_trials_stop"] = { method = "POST", url = "https://www.googleapis.com/v1/{name}:stop", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google.ml_projects_locations_studies_trials_suggest"] = { method = "POST", url = "https://www.googleapis.com/v1/{parent}/trials:suggest", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"clientId", "suggestionCount"} },
    ["google.ml_projects_models_create"] = { method = "POST", url = "https://www.googleapis.com/v1/{parent}/models", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"defaultVersion", "description", "etag", "labels", "name", "onlinePredictionConsoleLogging", "onlinePredictionLogging", "regions"} },
    ["google.ml_projects_models_get_iam_policy"] = { method = "GET", url = "https://www.googleapis.com/v1/{resource}:getIamPolicy", path = {"resource"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "options.requestedPolicyVersion"} },
    ["google.ml_projects_models_list"] = { method = "GET", url = "https://www.googleapis.com/v1/{parent}/models", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "filter", "pageSize", "pageToken"} },
    ["google.ml_projects_models_set_iam_policy"] = { method = "POST", url = "https://www.googleapis.com/v1/{resource}:setIamPolicy", path = {"resource"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"policy", "updateMask"} },
    ["google.ml_projects_models_test_iam_permissions"] = { method = "POST", url = "https://www.googleapis.com/v1/{resource}:testIamPermissions", path = {"resource"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"permissions"} },
    ["google.ml_projects_models_versions_create"] = { method = "POST", url = "https://www.googleapis.com/v1/{parent}/versions", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"acceleratorConfig", "autoScaling", "container", "createTime", "deploymentUri", "description", "errorMessage", "etag", "explanationConfig", "framework", "isDefault", "labels", "lastMigrationModelId", "lastMigrationTime", "lastUseTime", "machineType", "manualScaling", "name", "packageUris", "predictionClass", "pythonVersion", "requestLoggingConfig", "routes", "runtimeVersion", "serviceAccount", "state"} },
    ["google.ml_projects_models_versions_delete"] = { method = "DELETE", url = "https://www.googleapis.com/v1/{name}", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google.ml_projects_models_versions_list"] = { method = "GET", url = "https://www.googleapis.com/v1/{parent}/versions", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "filter", "pageSize", "pageToken"} },
    ["google.ml_projects_models_versions_patch"] = { method = "PATCH", url = "https://www.googleapis.com/v1/{name}", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "updateMask"}, body = {"acceleratorConfig", "autoScaling", "container", "createTime", "deploymentUri", "description", "errorMessage", "etag", "explanationConfig", "framework", "isDefault", "labels", "lastMigrationModelId", "lastMigrationTime", "lastUseTime", "machineType", "manualScaling", "name", "packageUris", "predictionClass", "pythonVersion", "requestLoggingConfig", "routes", "runtimeVersion", "serviceAccount", "state"} },
    ["google.ml_projects_models_versions_set_default"] = { method = "POST", url = "https://www.googleapis.com/v1/{name}:setDefault", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google.ml_projects_operations_cancel"] = { method = "POST", url = "https://www.googleapis.com/v1/{name}:cancel", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google.ml_projects_operations_get"] = { method = "GET", url = "https://www.googleapis.com/v1/{name}", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google.ml_projects_operations_list"] = { method = "GET", url = "https://www.googleapis.com/v1/{name}/operations", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "filter", "pageSize", "pageToken"} },
    ["google.ml_projects_predict"] = { method = "POST", url = "https://www.googleapis.com/v1/{name}:predict", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"httpBody"} },
  },
}
