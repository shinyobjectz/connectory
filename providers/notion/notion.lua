-- Notion — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/notion.com/1.0.0/openapi.json
-- APIs.guru mirror; Notion publishes no OpenAPI of its own
-- 13 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "notion",
  name = "Notion",
  base = "https://api.notion.com",
  docs = "https://developers.notion.com/reference",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "NOTION_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = { ["notion-version"] = "2022-06-28" },
  operations = {
    ["notion.append_block_children"] = { method = "PATCH", url = "https://api.notion.com/v1/blocks/{id}/children", path = {"id"}, header = {"Notion-Version"}, body = {"children"} },
    ["notion.delete_ablock"] = { method = "DELETE", url = "https://api.notion.com/v1/blocks/{id}", path = {"id"}, header = {"Notion-Version"} },
    ["notion.query_adatabase"] = { method = "POST", url = "https://api.notion.com/v1/databases/{id}/query", path = {"id"}, header = {"Notion-Version"}, body = {"filter"} },
    ["notion.retrieve_ablock"] = { method = "GET", url = "https://api.notion.com/v1/blocks/{id}", path = {"id"}, header = {"Notion-Version"} },
    ["notion.retrieve_adatabase"] = { method = "GET", url = "https://api.notion.com/v1/databases/{id}", path = {"id"}, header = {"Notion-Version"} },
    ["notion.retrieve_apage"] = { method = "GET", url = "https://api.notion.com/v1/pages/{id}", path = {"id"}, header = {"Notion-Version"} },
    ["notion.retrieve_apage_property_item"] = { method = "GET", url = "https://api.notion.com/v1/pages/{page_id}/properties/{property_id}", path = {"page_id", "property_id"} },
    ["notion.retrieve_auser"] = { method = "GET", url = "https://api.notion.com/v1/users/{id}", path = {"id"}, header = {"Notion-Version"} },
    ["notion.retrieve_block_children"] = { method = "GET", url = "https://api.notion.com/v1/blocks/{id}/children", path = {"id"}, query = {"page_size"}, header = {"Notion-Version"} },
    ["notion.retrieve_comments"] = { method = "GET", url = "https://api.notion.com/v1/comments", query = {"block_id", "page_size"}, header = {"Notion-Version"} },
    ["notion.update_ablock"] = { method = "PATCH", url = "https://api.notion.com/v1/blocks/{id}", path = {"id"}, header = {"Notion-Version"}, body = {"paragraph"} },
    ["notion.update_adatabase"] = { method = "PATCH", url = "https://api.notion.com/v1/databases/{id}", path = {"id"}, header = {"Notion-Version"}, body = {"properties", "title"} },
    ["notion.update_page_properties"] = { method = "PATCH", url = "https://api.notion.com/v1/pages/{id}", path = {"id"}, header = {"Notion-Version"}, body = {"properties"} },
  },
}
