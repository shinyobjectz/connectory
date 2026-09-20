-- AgentLine — every call this API accepts, as data.
--
-- GENERATED from https://docs.agentline.cloud/openapi.json
-- Published on the vendor's own documentation site (https://docs.agentline.cloud).
-- 33 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "agentline",
  name = "AgentLine",
  base = "https://api.agentline.cloud",
  docs = "https://nango.dev/docs/api-integrations/agentline",
  auth = {
    kind = "key",
    header = "authorization",
    format = "Bearer {token}",
    env = "AGENTLINE_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["agentline.buy_phone_number"] = { method = "POST", url = "https://api.agentline.cloud/v1/numbers", body = {"agent_id", "country", "number_type", "area_code", "pattern"} },
    ["agentline.create_agent"] = { method = "POST", url = "https://api.agentline.cloud/v1/agents", body = {"name", "system_prompt", "initial_greeting", "voice_id", "transfer_number", "voicemail_message", "owner_phone"} },
    ["agentline.delete_agent"] = { method = "DELETE", url = "https://api.agentline.cloud/v1/agents/{agent_id}", path = {"agent_id"} },
    ["agentline.delete_webhook"] = { method = "DELETE", url = "https://api.agentline.cloud/v1/webhooks", query = {"agent_id"} },
    ["agentline.get_account_balance"] = { method = "GET", url = "https://api.agentline.cloud/v1/billing/balance" },
    ["agentline.get_account_voice"] = { method = "GET", url = "https://api.agentline.cloud/v1/account/voice" },
    ["agentline.get_agent"] = { method = "GET", url = "https://api.agentline.cloud/v1/agents/{agent_id}", path = {"agent_id"} },
    ["agentline.get_call_charges"] = { method = "GET", url = "https://api.agentline.cloud/v1/billing/expenditure/calls", query = {"limit", "offset"} },
    ["agentline.get_call_details"] = { method = "GET", url = "https://api.agentline.cloud/v1/calls/{call_id}", path = {"call_id"} },
    ["agentline.get_call_transcript"] = { method = "GET", url = "https://api.agentline.cloud/v1/calls/{call_id}/transcript", path = {"call_id"} },
    ["agentline.get_expenditure_breakdown"] = { method = "GET", url = "https://api.agentline.cloud/v1/billing/expenditure", query = {"period"} },
    ["agentline.get_number_charges"] = { method = "GET", url = "https://api.agentline.cloud/v1/billing/expenditure/numbers", query = {"limit", "offset"} },
    ["agentline.get_phone_number"] = { method = "GET", url = "https://api.agentline.cloud/v1/numbers/{number_id}", path = {"number_id"} },
    ["agentline.get_spending_summary"] = { method = "GET", url = "https://api.agentline.cloud/v1/billing/summary", query = {"months"} },
    ["agentline.get_webhook"] = { method = "GET", url = "https://api.agentline.cloud/v1/webhooks", query = {"agent_id"} },
    ["agentline.hangup_call"] = { method = "POST", url = "https://api.agentline.cloud/v1/calls/{call_id}/hangup", path = {"call_id"} },
    ["agentline.list_agents"] = { method = "GET", url = "https://api.agentline.cloud/v1/agents" },
    ["agentline.list_available_voices"] = { method = "GET", url = "https://api.agentline.cloud/v1/voices" },
    ["agentline.list_calls"] = { method = "GET", url = "https://api.agentline.cloud/v1/calls", query = {"agent_id", "status", "limit", "offset"} },
    ["agentline.list_conversations"] = { method = "GET", url = "https://api.agentline.cloud/v1/messages/conversations", query = {"agent_id"} },
    ["agentline.list_messages"] = { method = "GET", url = "https://api.agentline.cloud/v1/messages", query = {"agent_id", "conversation_id", "limit", "offset"} },
    ["agentline.list_phone_numbers"] = { method = "GET", url = "https://api.agentline.cloud/v1/numbers" },
    ["agentline.make_outbound_call"] = { method = "POST", url = "https://api.agentline.cloud/v1/calls", body = {"agent_id", "to_number", "system_prompt", "initial_greeting", "voice_id", "from_number_id"} },
    ["agentline.peek_events"] = { method = "GET", url = "https://api.agentline.cloud/v1/events/peek", query = {"agent_id", "limit"} },
    ["agentline.poll_events"] = { method = "GET", url = "https://api.agentline.cloud/v1/events", query = {"agent_id", "event_type", "limit"} },
    ["agentline.push_call_context"] = { method = "POST", url = "https://api.agentline.cloud/v1/calls/{call_id}/context", path = {"call_id"}, query = {"turn_id"}, header = {"X-Push-Token"} },
    ["agentline.reassign_number"] = { method = "PATCH", url = "https://api.agentline.cloud/v1/numbers/{number_id}/reassign", path = {"number_id"}, query = {"agent_id"} },
    ["agentline.reset_account_voice"] = { method = "DELETE", url = "https://api.agentline.cloud/v1/account/voice" },
    ["agentline.send_sms"] = { method = "POST", url = "https://api.agentline.cloud/v1/messages", body = {"agent_id", "to_number", "body", "media_url", "from_number_id"} },
    ["agentline.set_account_voice"] = { method = "PATCH", url = "https://api.agentline.cloud/v1/account/voice", body = {"voice_id"} },
    ["agentline.set_webhook"] = { method = "POST", url = "https://api.agentline.cloud/v1/webhooks", body = {"url", "agent_id", "signature_header"} },
    ["agentline.test_webhook"] = { method = "POST", url = "https://api.agentline.cloud/v1/webhooks/test", query = {"agent_id"} },
    ["agentline.update_agent"] = { method = "PATCH", url = "https://api.agentline.cloud/v1/agents/{agent_id}", path = {"agent_id"}, body = {"name", "system_prompt", "initial_greeting", "voice_id", "transfer_number", "voicemail_message", "owner_phone"} },
  },
}
