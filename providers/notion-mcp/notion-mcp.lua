-- Notion — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/notion.com/1.0.0/openapi.json
-- APIs.guru's mirror of notion.com, matched on notion.com. A mirror lags the vendor.
-- 13 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "notion-mcp",
  name = "Notion",
  base = "https://mcp.notion.com",
  docs = "https://nango.dev/docs/api-integrations/notion-mcp",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "NOTION_MCP_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["notion-mcp.append_block_children"] = { method = "PATCH", url = "https://mcp.notion.com/v1/blocks/{id}/children", path = {"id"}, header = {"Notion-Version"}, body = {"children"} },
    ["notion-mcp.delete_ablock"] = { method = "DELETE", url = "https://mcp.notion.com/v1/blocks/{id}", path = {"id"}, header = {"Notion-Version"} },
    ["notion-mcp.query_adatabase"] = { method = "POST", url = "https://mcp.notion.com/v1/databases/{id}/query", path = {"id"}, header = {"Notion-Version"}, body = {"filter"} },
    ["notion-mcp.retrieve_ablock"] = { method = "GET", url = "https://mcp.notion.com/v1/blocks/{id}", path = {"id"}, header = {"Notion-Version"} },
    ["notion-mcp.retrieve_adatabase"] = { method = "GET", url = "https://mcp.notion.com/v1/databases/{id}", path = {"id"}, header = {"Notion-Version"} },
    ["notion-mcp.retrieve_apage"] = { method = "GET", url = "https://mcp.notion.com/v1/pages/{id}", path = {"id"}, header = {"Notion-Version"} },
    ["notion-mcp.retrieve_apage_property_item"] = { method = "GET", url = "https://mcp.notion.com/v1/pages/{page_id}/properties/{property_id}", path = {"page_id", "property_id"} },
    ["notion-mcp.retrieve_auser"] = { method = "GET", url = "https://mcp.notion.com/v1/users/{id}", path = {"id"}, header = {"Notion-Version"} },
    ["notion-mcp.retrieve_block_children"] = { method = "GET", url = "https://mcp.notion.com/v1/blocks/{id}/children", path = {"id"}, query = {"page_size"}, header = {"Notion-Version"} },
    ["notion-mcp.retrieve_comments"] = { method = "GET", url = "https://mcp.notion.com/v1/comments", query = {"block_id", "page_size"}, header = {"Notion-Version"} },
    ["notion-mcp.update_ablock"] = { method = "PATCH", url = "https://mcp.notion.com/v1/blocks/{id}", path = {"id"}, header = {"Notion-Version"}, body = {"paragraph"} },
    ["notion-mcp.update_adatabase"] = { method = "PATCH", url = "https://mcp.notion.com/v1/databases/{id}", path = {"id"}, header = {"Notion-Version"}, body = {"properties", "title"} },
    ["notion-mcp.update_page_properties"] = { method = "PATCH", url = "https://mcp.notion.com/v1/pages/{id}", path = {"id"}, header = {"Notion-Version"}, body = {"properties"} },
  },
}
