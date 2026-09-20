-- Render — every call this API accepts, as data.
--
-- GENERATED from https://render.com/openapi.json
-- Published on the vendor's own documentation site (https://render.com).
-- 14 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "render-mcp",
  name = "Render",
  base = "https://mcp.render.com",
  docs = "https://nango.dev/docs/api-integrations/render-mcp",
  auth = {
    kind = "key",
    header = "authorization",
    format = "Bearer {token}",
    env = "RENDER_MCP_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["render-mcp.get_agent_skills_discovery_index"] = { method = "GET", url = "https://mcp.render.com/.well-known/agent-skills/index.json" },
    ["render-mcp.get_agents_directory"] = { method = "GET", url = "https://mcp.render.com/.well-known/agents.json" },
    ["render-mcp.get_api_catalog"] = { method = "GET", url = "https://mcp.render.com/.well-known/api-catalog" },
    ["render-mcp.get_api_status"] = { method = "GET", url = "https://mcp.render.com/api/status" },
    ["render-mcp.get_articles_markdown_index"] = { method = "GET", url = "https://mcp.render.com/articles.md" },
    ["render-mcp.get_blog_markdown_index"] = { method = "GET", url = "https://mcp.render.com/blog.md" },
    ["render-mcp.get_docs_page_markdown"] = { method = "GET", url = "https://mcp.render.com/docs/{slug}.md", path = {"slug"} },
    ["render-mcp.get_llms_full"] = { method = "GET", url = "https://mcp.render.com/llms-full.txt" },
    ["render-mcp.get_llms_index"] = { method = "GET", url = "https://mcp.render.com/llms.txt" },
    ["render-mcp.get_mcp_discovery"] = { method = "GET", url = "https://mcp.render.com/.well-known/mcp.json" },
    ["render-mcp.get_mcp_server_card"] = { method = "GET", url = "https://mcp.render.com/.well-known/mcp/server-card.json" },
    ["render-mcp.get_open_api_spec"] = { method = "GET", url = "https://mcp.render.com/openapi.json" },
    ["render-mcp.get_web_mcp_manifest"] = { method = "GET", url = "https://mcp.render.com/.well-known/webmcp.json" },
    ["render-mcp.search_render_docs"] = { method = "GET", url = "https://mcp.render.com/api/agent/docs-search", query = {"query"} },
  },
}
