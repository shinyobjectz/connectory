-- Google Tasks — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/googleapis.com/tasks/v1/openapi.json
-- APIs.guru's mirror of googleapis.com:tasks, matched on googleapis.com. A mirror lags the vendor.
-- 14 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "google-tasks",
  name = "Google Tasks",
  base = "https://tasks.googleapis.com",
  docs = "https://nango.dev/docs/api-integrations/google-tasks",
  auth = {
    kind = "manual",
    header = "authorization",
    format = "Bearer {token}",
    env = "GOOGLE_TASKS_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["google-tasks.tasks_tasklists_delete"] = { method = "DELETE", url = "https://tasks.googleapis.com/tasks/v1/users/@me/lists/{tasklist}", path = {"tasklist"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-tasks.tasks_tasklists_get"] = { method = "GET", url = "https://tasks.googleapis.com/tasks/v1/users/@me/lists/{tasklist}", path = {"tasklist"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-tasks.tasks_tasklists_insert"] = { method = "POST", url = "https://tasks.googleapis.com/tasks/v1/users/@me/lists", query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"etag", "id", "kind", "selfLink", "title", "updated"} },
    ["google-tasks.tasks_tasklists_list"] = { method = "GET", url = "https://tasks.googleapis.com/tasks/v1/users/@me/lists", query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "maxResults", "pageToken"} },
    ["google-tasks.tasks_tasklists_patch"] = { method = "PATCH", url = "https://tasks.googleapis.com/tasks/v1/users/@me/lists/{tasklist}", path = {"tasklist"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"etag", "id", "kind", "selfLink", "title", "updated"} },
    ["google-tasks.tasks_tasklists_update"] = { method = "PUT", url = "https://tasks.googleapis.com/tasks/v1/users/@me/lists/{tasklist}", path = {"tasklist"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"etag", "id", "kind", "selfLink", "title", "updated"} },
    ["google-tasks.tasks_tasks_clear"] = { method = "POST", url = "https://tasks.googleapis.com/tasks/v1/lists/{tasklist}/clear", path = {"tasklist"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-tasks.tasks_tasks_delete"] = { method = "DELETE", url = "https://tasks.googleapis.com/tasks/v1/lists/{tasklist}/tasks/{task}", path = {"tasklist", "task"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-tasks.tasks_tasks_get"] = { method = "GET", url = "https://tasks.googleapis.com/tasks/v1/lists/{tasklist}/tasks/{task}", path = {"tasklist", "task"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-tasks.tasks_tasks_insert"] = { method = "POST", url = "https://tasks.googleapis.com/tasks/v1/lists/{tasklist}/tasks", path = {"tasklist"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "parent", "previous"}, body = {"completed", "deleted", "due", "etag", "hidden", "id", "kind", "links", "notes", "parent", "position", "selfLink", "status", "title", "updated"} },
    ["google-tasks.tasks_tasks_list"] = { method = "GET", url = "https://tasks.googleapis.com/tasks/v1/lists/{tasklist}/tasks", path = {"tasklist"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "completedMax", "completedMin", "dueMax", "dueMin", "maxResults", "pageToken", "showCompleted", "showDeleted", "showHidden", "updatedMin"} },
    ["google-tasks.tasks_tasks_move"] = { method = "POST", url = "https://tasks.googleapis.com/tasks/v1/lists/{tasklist}/tasks/{task}/move", path = {"tasklist", "task"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "parent", "previous"} },
    ["google-tasks.tasks_tasks_patch"] = { method = "PATCH", url = "https://tasks.googleapis.com/tasks/v1/lists/{tasklist}/tasks/{task}", path = {"tasklist", "task"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"completed", "deleted", "due", "etag", "hidden", "id", "kind", "links", "notes", "parent", "position", "selfLink", "status", "title", "updated"} },
    ["google-tasks.tasks_tasks_update"] = { method = "PUT", url = "https://tasks.googleapis.com/tasks/v1/lists/{tasklist}/tasks/{task}", path = {"tasklist", "task"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"}, body = {"completed", "deleted", "due", "etag", "hidden", "id", "kind", "links", "notes", "parent", "position", "selfLink", "status", "title", "updated"} },
  },
}
