-- TickTick — every call this API accepts, as data.
--
-- GENERATED from https://ticktick.com/openapi.yaml
-- Published on the vendor's own documentation site (https://ticktick.com).
-- 24 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "ticktick",
  name = "TickTick",
  base = "https://api.ticktick.com",
  docs = "https://nango.dev/docs/integrations/all/ticktick",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "TICKTICK_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["ticktick.assign_task"] = { method = "POST", url = "https://api.ticktick.com/open/v1/task/assign", body = {"projectId", "taskId", "assigneeUsername"} },
    ["ticktick.batch_sync_tasks"] = { method = "POST", url = "https://api.ticktick.com/open/v1/task/batch", body = {"add", "update"} },
    ["ticktick.complete_specify_task"] = { method = "POST", url = "https://api.ticktick.com/open/v1/project/{projectId}/task/{taskId}/complete", path = {"projectId", "taskId"} },
    ["ticktick.create_single_task"] = { method = "POST", url = "https://api.ticktick.com/open/v1/task", body = {"id", "etag", "projectId", "title", "isAllDay", "completedTime", "content", "desc", "dueDate", "items", "priority", "reminders", "repeatFlag", "repeatFrom", "sortOrder", "startDate", "status", "assigneeUsername", "timeZone"} },
    ["ticktick.create_tag"] = { method = "POST", url = "https://api.ticktick.com/open/v1/tag", body = {"name", "label", "sortOrder", "sortType", "color", "parent", "type"} },
    ["ticktick.delete_specify_task"] = { method = "DELETE", url = "https://api.ticktick.com/open/v1/project/{projectId}/task/{taskId}", path = {"projectId", "taskId"} },
    ["ticktick.delete_tag"] = { method = "DELETE", url = "https://api.ticktick.com/open/v1/tag/delete", query = {"scope"}, body = {"name"} },
    ["ticktick.filter_tasks"] = { method = "POST", url = "https://api.ticktick.com/open/v1/task/filter", body = {"projectIds", "startDate", "endDate", "priority", "tag", "kind", "status"} },
    ["ticktick.get_all_projects"] = { method = "GET", url = "https://api.ticktick.com/open/v1/project" },
    ["ticktick.get_completed_tasks"] = { method = "POST", url = "https://api.ticktick.com/open/v1/task/completed", body = {"projectIds", "startDate", "endDate"} },
    ["ticktick.get_focus_by_id"] = { method = "GET", url = "https://api.ticktick.com/open/v1/focus/{focusId}", path = {"focusId"}, query = {"type"} },
    ["ticktick.get_habit_by_id"] = { method = "GET", url = "https://api.ticktick.com/open/v1/habit/{habitId}", path = {"habitId"} },
    ["ticktick.get_project_by_id"] = { method = "GET", url = "https://api.ticktick.com/open/v1/project/{projectId}", path = {"projectId"} },
    ["ticktick.get_project_members"] = { method = "GET", url = "https://api.ticktick.com/open/v1/project/{projectId}/members", path = {"projectId"} },
    ["ticktick.get_project_with_data_by_id"] = { method = "GET", url = "https://api.ticktick.com/open/v1/project/{projectId}/data", path = {"projectId"} },
    ["ticktick.get_tags"] = { method = "GET", url = "https://api.ticktick.com/open/v1/tag" },
    ["ticktick.get_task_by_id"] = { method = "GET", url = "https://api.ticktick.com/open/v1/project/{projectId}/task/{taskId}", path = {"projectId", "taskId"} },
    ["ticktick.get_user_preference"] = { method = "POST", url = "https://api.ticktick.com/open/v1/preference" },
    ["ticktick.move_tasks"] = { method = "POST", url = "https://api.ticktick.com/open/v1/task/move" },
    ["ticktick.rename_tag"] = { method = "PUT", url = "https://api.ticktick.com/open/v1/tag/rename", query = {"scope"}, body = {"name", "newName"} },
    ["ticktick.unassign_task"] = { method = "POST", url = "https://api.ticktick.com/open/v1/task/unassign", body = {"projectId", "taskId"} },
    ["ticktick.update_focus"] = { method = "POST", url = "https://api.ticktick.com/open/v1/focus/{focusId}", path = {"focusId"}, body = {"id", "type", "taskId", "note", "tasks", "status", "startTime", "endTime", "pauseDuration", "adjustTime", "added", "duration", "createdTime", "modifiedTime", "etag"} },
    ["ticktick.update_tag"] = { method = "PUT", url = "https://api.ticktick.com/open/v1/tag", body = {"name", "label", "sortOrder", "sortType", "color", "parent", "type"} },
    ["ticktick.update_task"] = { method = "POST", url = "https://api.ticktick.com/open/v1/task/{taskId}", path = {"taskId"}, body = {"id", "etag", "projectId", "title", "isAllDay", "completedTime", "content", "desc", "dueDate", "items", "priority", "reminders", "repeatFlag", "repeatFrom", "sortOrder", "startDate", "status", "assigneeUsername", "timeZone"} },
  },
}
