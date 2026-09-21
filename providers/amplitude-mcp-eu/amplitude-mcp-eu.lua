-- Amplitude — every call this API accepts, as data.
--
-- GENERATED from https://amplitude.com/openapi.json
-- Published on the vendor's own documentation site (https://amplitude.com).
-- 34 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "amplitude-mcp-eu",
  name = "Amplitude",
  base = "https://mcp.eu.amplitude.com",
  docs = "https://nango.dev/docs/api-integrations/amplitude-mcp-eu",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "AMPLITUDE_MCP_EU_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["amplitude-mcp-eu.create_event_property"] = { method = "POST", url = "https://mcp.eu.amplitude.com/api/2/taxonomy/event-property", body = {"event_type", "event_property", "description", "type", "is_required"} },
    ["amplitude-mcp-eu.create_event_type"] = { method = "POST", url = "https://mcp.eu.amplitude.com/api/2/taxonomy/event", body = {"event_type", "category", "description", "display_name"} },
    ["amplitude-mcp-eu.create_user_property"] = { method = "POST", url = "https://mcp.eu.amplitude.com/api/2/taxonomy/user-property", body = {"user_property", "description", "type"} },
    ["amplitude-mcp-eu.delete_event_type"] = { method = "DELETE", url = "https://mcp.eu.amplitude.com/api/2/taxonomy/event/{eventType}", path = {"eventType"} },
    ["amplitude-mcp-eu.download_cohort"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/5/cohorts/request/{requestId}/file", path = {"requestId"} },
    ["amplitude-mcp-eu.export_events"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/export", query = {"start", "end"} },
    ["amplitude-mcp-eu.get_ai_catalog"] = { method = "GET", url = "https://mcp.eu.amplitude.com/.well-known/ai-catalog.json" },
    ["amplitude-mcp-eu.get_average_session_length"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/sessions/average", query = {"start", "end"} },
    ["amplitude-mcp-eu.get_chart_results"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/3/chart/{chartId}/csv", path = {"chartId"} },
    ["amplitude-mcp-eu.get_cohort_export_status"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/5/cohorts/request-status/{requestId}", path = {"requestId"} },
    ["amplitude-mcp-eu.get_event_segmentation"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/events/segmentation", query = {"e", "e2", "start", "end", "m", "i", "s", "g", "limit"} },
    ["amplitude-mcp-eu.get_event_type"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/taxonomy/event/{eventType}", path = {"eventType"} },
    ["amplitude-mcp-eu.get_funnel_analysis"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/funnels", query = {"e", "start", "end", "mode", "n", "cs", "s", "g", "limit"} },
    ["amplitude-mcp-eu.get_llms_full_txt"] = { method = "GET", url = "https://mcp.eu.amplitude.com/llms-full.txt" },
    ["amplitude-mcp-eu.get_llms_txt"] = { method = "GET", url = "https://mcp.eu.amplitude.com/llms.txt" },
    ["amplitude-mcp-eu.get_open_api_document"] = { method = "GET", url = "https://mcp.eu.amplitude.com/openapi.json" },
    ["amplitude-mcp-eu.get_page_markdown"] = { method = "GET", url = "https://mcp.eu.amplitude.com/{pagePath}.md", path = {"pagePath"} },
    ["amplitude-mcp-eu.get_realtime_active_users"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/realtime", query = {"i"} },
    ["amplitude-mcp-eu.get_retention_analysis"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/retention", query = {"se", "re", "start", "end", "rm", "i", "s", "g"} },
    ["amplitude-mcp-eu.get_revenue_ltv"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/revenue/ltv", query = {"start", "end", "m", "i", "s", "g"} },
    ["amplitude-mcp-eu.get_session_length_distribution"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/sessions/length", query = {"start", "end", "timeHistogramConfigBinTimeUnit", "timeHistogramConfigBinMin", "timeHistogramConfigBinMax", "timeHistogramConfigBinSize"} },
    ["amplitude-mcp-eu.get_user_activity"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/useractivity", query = {"user", "offset", "limit"} },
    ["amplitude-mcp-eu.get_user_composition"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/composition", query = {"start", "end", "p"} },
    ["amplitude-mcp-eu.get_user_counts"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/users", query = {"start", "end", "m", "i", "s", "g"} },
    ["amplitude-mcp-eu.list_cohorts"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/3/cohorts" },
    ["amplitude-mcp-eu.list_event_properties"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/taxonomy/event-property", query = {"event_type"} },
    ["amplitude-mcp-eu.list_event_types"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/taxonomy/event" },
    ["amplitude-mcp-eu.list_events"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/events/list" },
    ["amplitude-mcp-eu.list_user_properties"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/taxonomy/user-property" },
    ["amplitude-mcp-eu.request_cohort_export"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/5/cohorts/request/{cohortId}", path = {"cohortId"}, query = {"props", "propKeys"} },
    ["amplitude-mcp-eu.search_users"] = { method = "GET", url = "https://mcp.eu.amplitude.com/api/2/usersearch", query = {"user"} },
    ["amplitude-mcp-eu.update_event_type"] = { method = "PUT", url = "https://mcp.eu.amplitude.com/api/2/taxonomy/event/{eventType}", path = {"eventType"}, body = {"category", "description", "display_name", "new_event_type"} },
    ["amplitude-mcp-eu.upload_events"] = { method = "POST", url = "https://mcp.eu.amplitude.com/2/httpapi", body = {"events", "options"} },
    ["amplitude-mcp-eu.upload_events_batch"] = { method = "POST", url = "https://mcp.eu.amplitude.com/batch", body = {"events", "options"} },
  },
}
