-- Granola — every call this API accepts, as data.
--
-- GENERATED from https://docs.granola.ai/api-reference/openapi.json
-- Published on the vendor's own documentation site (https://docs.granola.ai).
-- 9 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "granola-mcp",
  name = "Granola",
  base = "https://mcp.granola.ai",
  docs = "https://nango.dev/docs/api-integrations/granola-mcp",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "GRANOLA_MCP_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["granola-mcp.delete_v1_webhook_endpoints_webhook_endpoint_id"] = { method = "DELETE", url = "https://mcp.granola.ai/v1/webhook-endpoints/{webhook_endpoint_id}", path = {"webhook_endpoint_id"} },
    ["granola-mcp.get_v1_audit"] = { method = "GET", url = "https://mcp.granola.ai/v1/audit", query = {"action", "occurred_before", "occurred_after", "cursor", "page_size"} },
    ["granola-mcp.get_v1_folders"] = { method = "GET", url = "https://mcp.granola.ai/v1/folders", query = {"cursor", "page_size"} },
    ["granola-mcp.get_v1_notes"] = { method = "GET", url = "https://mcp.granola.ai/v1/notes", query = {"created_before", "created_after", "updated_after", "folder_id", "cursor", "page_size"} },
    ["granola-mcp.get_v1_notes_note_id"] = { method = "GET", url = "https://mcp.granola.ai/v1/notes/{note_id}", path = {"note_id"}, query = {"include"} },
    ["granola-mcp.get_v1_notes_note_id_transcript"] = { method = "GET", url = "https://mcp.granola.ai/v1/notes/{note_id}/transcript", path = {"note_id"}, query = {"cursor", "page_size"} },
    ["granola-mcp.get_v1_webhook_endpoints"] = { method = "GET", url = "https://mcp.granola.ai/v1/webhook-endpoints" },
    ["granola-mcp.patch_v1_webhook_endpoints_webhook_endpoint_id"] = { method = "PATCH", url = "https://mcp.granola.ai/v1/webhook-endpoints/{webhook_endpoint_id}", path = {"webhook_endpoint_id"}, body = {"url", "scopes", "events", "folder_ids", "enabled"} },
    ["granola-mcp.post_v1_webhook_endpoints"] = { method = "POST", url = "https://mcp.granola.ai/v1/webhook-endpoints", body = {"url", "scopes", "events", "folder_ids"} },
  },
}
