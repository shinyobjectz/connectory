-- Glyphic — every call this API accepts, as data.
--
-- GENERATED from https://api.glyphic.ai/openapi.json
-- Published on the vendor's own documentation site (https://api.glyphic.ai).
-- 13 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "glyphic",
  name = "Glyphic",
  base = "https://api.glyphic.ai",
  docs = "https://nango.dev/docs/api-integrations/glyphic",
  auth = {
    kind = "key",
    header = "x-api-key",
    format = "{token}",
    env = "GLYPHIC_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["glyphic.get_agent_run"] = { method = "GET", url = "https://api.glyphic.ai/v1/agent-runs/{run_id}", path = {"run_id"} },
    ["glyphic.get_call_info"] = { method = "GET", url = "https://api.glyphic.ai/v1/calls/{call_id}", path = {"call_id"} },
    ["glyphic.get_call_media"] = { method = "GET", url = "https://api.glyphic.ai/v1/calls/{call_id}/media", path = {"call_id"} },
    ["glyphic.get_call_snippets"] = { method = "GET", url = "https://api.glyphic.ai/v1/calls/{call_id}/snippets", path = {"call_id"} },
    ["glyphic.get_ping_v1_test_ping_get"] = { method = "GET", url = "https://api.glyphic.ai/v1/test/ping" },
    ["glyphic.get_playbook"] = { method = "GET", url = "https://api.glyphic.ai/v1/playbooks/{playbook_id}", path = {"playbook_id"} },
    ["glyphic.get_playbook_version"] = { method = "GET", url = "https://api.glyphic.ai/v1/playbooks/{playbook_id}/versions/{version_id}", path = {"playbook_id", "version_id"} },
    ["glyphic.join_call"] = { method = "POST", url = "https://api.glyphic.ai/v1/call_bots", body = {"meeting_url", "title", "participants"} },
    ["glyphic.list_agent_runs"] = { method = "GET", url = "https://api.glyphic.ai/v1/agent-runs/", query = {"agent_id", "agent_workflow_id", "user_id", "call_id", "cursor", "limit", "direction"} },
    ["glyphic.list_call_tags"] = { method = "GET", url = "https://api.glyphic.ai/v1/call_tags/" },
    ["glyphic.list_calls"] = { method = "GET", url = "https://api.glyphic.ai/v1/calls/", query = {"participant_email", "start_time_from", "start_time_to", "title_filter", "tag_ids", "cursor", "limit", "direction"} },
    ["glyphic.list_playbook_versions"] = { method = "GET", url = "https://api.glyphic.ai/v1/playbooks/{playbook_id}/versions", path = {"playbook_id"} },
    ["glyphic.list_playbooks"] = { method = "GET", url = "https://api.glyphic.ai/v1/playbooks/", query = {"cursor", "limit", "direction"} },
  },
}
