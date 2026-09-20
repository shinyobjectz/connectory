-- Devin — every call this API accepts, as data.
--
-- GENERATED from https://docs.devin.ai/openapi.yaml
-- Published on the vendor's own documentation site (https://docs.devin.ai).
-- 23 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "devin",
  name = "Devin",
  base = "https://api.devin.ai",
  docs = "https://nango.dev/docs/integrations/all/devin",
  auth = {
    kind = "key",
    header = "authorization",
    format = "Bearer {token}",
    env = "DEVIN_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["devin.delete_sessions_session_id"] = { method = "DELETE", url = "https://api.devin.ai/sessions/{session_id}", path = {"session_id"} },
    ["devin.delete_v1_knowledge_note_id"] = { method = "DELETE", url = "https://api.devin.ai/v1/knowledge/{note_id}", path = {"note_id"} },
    ["devin.delete_v1_playbooks_playbook_id"] = { method = "DELETE", url = "https://api.devin.ai/v1/playbooks/{playbook_id}", path = {"playbook_id"} },
    ["devin.delete_v1_secrets_secret_id"] = { method = "DELETE", url = "https://api.devin.ai/v1/secrets/{secret_id}", path = {"secret_id"} },
    ["devin.delete_v1_sessions_session_id"] = { method = "DELETE", url = "https://api.devin.ai/v1/sessions/{session_id}", path = {"session_id"} },
    ["devin.get_enterprise_consumption"] = { method = "GET", url = "https://api.devin.ai/enterprise/consumption", query = {"start_date", "end_date"} },
    ["devin.get_v1_attachments_uuid_name"] = { method = "GET", url = "https://api.devin.ai/v1/attachments/{uuid}/{name}", path = {"uuid", "name"} },
    ["devin.get_v1_audit_logs"] = { method = "GET", url = "https://api.devin.ai/v1/audit-logs", query = {"limit", "before", "after"} },
    ["devin.get_v1_knowledge"] = { method = "GET", url = "https://api.devin.ai/v1/knowledge" },
    ["devin.get_v1_playbooks"] = { method = "GET", url = "https://api.devin.ai/v1/playbooks" },
    ["devin.get_v1_playbooks_playbook_id"] = { method = "GET", url = "https://api.devin.ai/v1/playbooks/{playbook_id}", path = {"playbook_id"} },
    ["devin.get_v1_secrets"] = { method = "GET", url = "https://api.devin.ai/v1/secrets" },
    ["devin.get_v1_sessions"] = { method = "GET", url = "https://api.devin.ai/v1/sessions", query = {"limit", "offset", "tags"} },
    ["devin.get_v1_sessions_session_id"] = { method = "GET", url = "https://api.devin.ai/v1/sessions/{session_id}", path = {"session_id"} },
    ["devin.post_v1_attachments"] = { method = "POST", url = "https://api.devin.ai/v1/attachments", body = {"file"} },
    ["devin.post_v1_knowledge"] = { method = "POST", url = "https://api.devin.ai/v1/knowledge", body = {"body", "name", "parent_folder_id", "trigger_description", "pinned_repo"} },
    ["devin.post_v1_playbooks"] = { method = "POST", url = "https://api.devin.ai/v1/playbooks", body = {"title", "body", "macro"} },
    ["devin.post_v1_secrets"] = { method = "POST", url = "https://api.devin.ai/v1/secrets", body = {"type", "value", "sensitive", "note"} },
    ["devin.post_v1_sessions"] = { method = "POST", url = "https://api.devin.ai/v1/sessions", body = {"prompt", "snapshot_id", "unlisted", "idempotent", "max_acu_limit", "secret_ids", "knowledge_ids", "tags", "title"} },
    ["devin.post_v1_sessions_session_id_message"] = { method = "POST", url = "https://api.devin.ai/v1/sessions/{session_id}/message", path = {"session_id"}, body = {"message"} },
    ["devin.put_v1_knowledge_note_id"] = { method = "PUT", url = "https://api.devin.ai/v1/knowledge/{note_id}", path = {"note_id"}, body = {"body", "name", "parent_folder_id", "trigger_description", "pinned_repo"} },
    ["devin.put_v1_playbooks_playbook_id"] = { method = "PUT", url = "https://api.devin.ai/v1/playbooks/{playbook_id}", path = {"playbook_id"}, body = {"title", "body", "macro"} },
    ["devin.put_v1_sessions_session_id_tags"] = { method = "PUT", url = "https://api.devin.ai/v1/sessions/{session_id}/tags", path = {"session_id"}, body = {"tags"} },
  },
}
