-- Perplexity — every call this API accepts, as data.
--
-- GENERATED from https://docs.perplexity.ai/openapi.json
-- Published on the vendor's own documentation site (https://docs.perplexity.ai).
-- 22 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "perplexity",
  name = "Perplexity",
  base = "https://api.perplexity.ai",
  docs = "https://nango.dev/docs/integrations/all/perplexity",
  auth = {
    kind = "key",
    header = "authorization",
    format = "Bearer {token}",
    env = "PERPLEXITY_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["perplexity.cancel_agent_response"] = { method = "POST", url = "https://api.perplexity.ai/v1/agent/{id}/cancel", path = {"id"} },
    ["perplexity.chat_completions_chat_completions_post"] = { method = "POST", url = "https://api.perplexity.ai/v1/sonar", body = {"max_tokens", "model", "stream", "stop", "temperature", "top_p", "response_format", "messages", "web_search_options", "search_mode", "return_images", "return_related_questions", "enable_search_classifier", "disable_search", "search_domain_filter", "search_language_filter", "search_recency_filter", "search_after_date_filter", "search_before_date_filter", "last_updated_before_filter", "last_updated_after_filter", "image_format_filter", "image_domain_filter", "stream_mode", "reasoning_effort", "language_preference"} },
    ["perplexity.contextualized_embeddings_v1_contextualizedembeddings_post"] = { method = "POST", url = "https://api.perplexity.ai/v1/contextualizedembeddings", body = {"input", "model", "dimensions", "encoding_format"} },
    ["perplexity.create_agent"] = { method = "POST", url = "https://api.perplexity.ai/v1/agent", body = {"input", "background", "instructions", "language_preference", "max_output_tokens", "max_steps", "model", "models", "preset", "profile", "previous_response_id", "reasoning", "response_format", "store", "stream", "tools", "skills", "temperature", "top_p"} },
    ["perplexity.create_async_chat_completions_async_chat_completions_post"] = { method = "POST", url = "https://api.perplexity.ai/v1/async/sonar", body = {"request", "idempotency_key"} },
    ["perplexity.create_skill"] = { method = "POST", url = "https://api.perplexity.ai/v1/skills" },
    ["perplexity.delete_skill"] = { method = "DELETE", url = "https://api.perplexity.ai/v1/skills/{skill_id}", path = {"skill_id"}, query = {"expected_revision"} },
    ["perplexity.download_agent_file"] = { method = "GET", url = "https://api.perplexity.ai/v1/agent/{id}/files/{file_id}/content", path = {"id", "file_id"} },
    ["perplexity.download_skill"] = { method = "GET", url = "https://api.perplexity.ai/v1/skills/{skill_id}/download", path = {"skill_id"}, query = {"revision"} },
    ["perplexity.embeddings_v1_embeddings_post"] = { method = "POST", url = "https://api.perplexity.ai/v1/embeddings", body = {"input", "model", "dimensions", "encoding_format"} },
    ["perplexity.get_async_chat_completion_response_async_chat_completions_api_request_get"] = { method = "GET", url = "https://api.perplexity.ai/v1/async/sonar/{api_request}", path = {"api_request"} },
    ["perplexity.get_computer_usage_analytics"] = { method = "GET", url = "https://api.perplexity.ai/v1/analytics/computer/usage", query = {"dataset", "start_time", "end_time", "bucket_width", "limit", "page", "user_email"} },
    ["perplexity.get_computer_usage_analytics_v2"] = { method = "GET", url = "https://api.perplexity.ai/v2/analytics/computer/usage", query = {"dataset", "group_by", "start_time", "end_time", "limit", "page"} },
    ["perplexity.get_skill"] = { method = "GET", url = "https://api.perplexity.ai/v1/skills/{skill_id}", path = {"skill_id"}, query = {"revision"} },
    ["perplexity.list_agent_files"] = { method = "GET", url = "https://api.perplexity.ai/v1/agent/{id}/files", path = {"id"} },
    ["perplexity.list_async_chat_completions_async_chat_completions_get"] = { method = "GET", url = "https://api.perplexity.ai/v1/async/sonar" },
    ["perplexity.list_models"] = { method = "GET", url = "https://api.perplexity.ai/v1/models" },
    ["perplexity.list_skill_revisions"] = { method = "GET", url = "https://api.perplexity.ai/v1/skills/{skill_id}/revisions", path = {"skill_id"}, query = {"limit", "page_token"} },
    ["perplexity.list_skills"] = { method = "GET", url = "https://api.perplexity.ai/v1/skills", query = {"limit", "page_token"} },
    ["perplexity.retrieve_agent"] = { method = "GET", url = "https://api.perplexity.ai/v1/agent/{id}", path = {"id"} },
    ["perplexity.search_search_post"] = { method = "POST", url = "https://api.perplexity.ai/search", body = {"country", "max_results", "search_type", "search_context_size", "max_tokens", "max_tokens_per_page", "query", "search_language_filter"} },
    ["perplexity.update_skill"] = { method = "PUT", url = "https://api.perplexity.ai/v1/skills/{skill_id}", path = {"skill_id"}, query = {"expected_revision"} },
  },
}
