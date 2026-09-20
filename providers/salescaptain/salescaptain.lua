-- SalesCaptain — every call this API accepts, as data.
--
-- GENERATED from https://docs.salescaptain.com/api-reference/openapi.json
-- Published on the vendor's own documentation site (https://docs.salescaptain.com).
-- 26 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "salescaptain",
  name = "SalesCaptain",
  base = "https://api.salescaptain.com",
  docs = "https://nango.dev/docs/api-integrations/salescaptain",
  auth = {
    kind = "key",
    header = "authorization",
    format = "Bearer {token}",
    env = "SALESCAPTAIN_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["salescaptain.add_tag_to_contact"] = { method = "POST", url = "https://api.salescaptain.com/v1/add-tag-to-contact/{company_id}", path = {"company_id"}, body = {"contact_id", "tag_id"} },
    ["salescaptain.call_analytics"] = { method = "POST", url = "https://api.salescaptain.com/v1/call-analytics", body = {"company_ids", "start_time", "end_time"} },
    ["salescaptain.create_contact"] = { method = "POST", url = "https://api.salescaptain.com/v1/create-contact", body = {"company_id", "contact_name", "contact_phone", "contact_email", "custom_fields"} },
    ["salescaptain.create_tag"] = { method = "POST", url = "https://api.salescaptain.com/v1/create-tag", body = {"company_id", "tag_name", "status"} },
    ["salescaptain.delete_contact"] = { method = "DELETE", url = "https://api.salescaptain.com/v1/delete-contact/{company_id}/{contact_id}", path = {"company_id", "contact_id"} },
    ["salescaptain.delete_tag"] = { method = "DELETE", url = "https://api.salescaptain.com/v1/delete-tag/{company_id}/{tag_id}", path = {"company_id", "tag_id"} },
    ["salescaptain.fetch_account_by_id"] = { method = "GET", url = "https://api.salescaptain.com/v1/fetch-account/{account_id}", path = {"account_id"} },
    ["salescaptain.fetch_all_accounts"] = { method = "GET", url = "https://api.salescaptain.com/v1/fetch-all-accounts/{company_id}", path = {"company_id"} },
    ["salescaptain.fetch_companies"] = { method = "GET", url = "https://api.salescaptain.com/v1/fetch-companies" },
    ["salescaptain.fetch_company_by_id"] = { method = "GET", url = "https://api.salescaptain.com/v1/fetch-company/{company_id}", path = {"company_id"} },
    ["salescaptain.fetch_contact"] = { method = "GET", url = "https://api.salescaptain.com/v1/fetch-contact/{contact_id}", path = {"contact_id"} },
    ["salescaptain.fetch_conversation"] = { method = "GET", url = "https://api.salescaptain.com/v1/fetch-conversation/{conversation_id}", path = {"conversation_id"} },
    ["salescaptain.fetch_message"] = { method = "GET", url = "https://api.salescaptain.com/v1/fetch-message/{message_id}", path = {"message_id"} },
    ["salescaptain.fetch_messages"] = { method = "GET", url = "https://api.salescaptain.com/v1/fetch-messages/{company_id}/{conversation_id}", path = {"company_id", "conversation_id"}, query = {"page_number", "items_per_page", "sort_by", "sort_dir", "created_before", "created_after"} },
    ["salescaptain.health_check"] = { method = "GET", url = "https://api.salescaptain.com/v1" },
    ["salescaptain.list_contacts"] = { method = "GET", url = "https://api.salescaptain.com/v1/list-contacts/{company_id}", path = {"company_id"}, query = {"page_number", "items_per_page", "sort_by", "sort_dir", "filter", "search_key"} },
    ["salescaptain.list_conversation_profile"] = { method = "GET", url = "https://api.salescaptain.com/v1/list-conversation-profile/{conversation_profile_id}", path = {"conversation_profile_id"} },
    ["salescaptain.list_conversation_profiles"] = { method = "GET", url = "https://api.salescaptain.com/v1/list-conversation-profiles/{company_id}", path = {"company_id"} },
    ["salescaptain.list_conversations"] = { method = "GET", url = "https://api.salescaptain.com/v1/list-conversations/{company_id}", path = {"company_id"}, query = {"page_number", "items_per_page", "sort_by", "sort_dir", "number", "email", "conversation_profile_id", "chat_status", "awaiting_reply"} },
    ["salescaptain.list_custom_field"] = { method = "GET", url = "https://api.salescaptain.com/v1/list-custom-field/{custom_field_id}", path = {"custom_field_id"} },
    ["salescaptain.list_custom_fields"] = { method = "GET", url = "https://api.salescaptain.com/v1/list-custom-fields/{company_id}", path = {"company_id"} },
    ["salescaptain.list_sms_templates"] = { method = "GET", url = "https://api.salescaptain.com/v1/sms/list-templates/{company_id}", path = {"company_id"} },
    ["salescaptain.list_tags"] = { method = "GET", url = "https://api.salescaptain.com/v1/list-tags/{company_id}", path = {"company_id"}, query = {"search_key", "tag_name"} },
    ["salescaptain.remove_tag_from_contact"] = { method = "DELETE", url = "https://api.salescaptain.com/v1/remove-tag-from-contact/{company_id}", path = {"company_id"}, body = {"contact_id", "tag_id"} },
    ["salescaptain.send_message"] = { method = "POST", url = "https://api.salescaptain.com/v1/send-message/{company_id}/{conversation_id}", path = {"company_id", "conversation_id"}, body = {"message_body", "template_id"} },
    ["salescaptain.update_contact"] = { method = "PUT", url = "https://api.salescaptain.com/v1/update-contact/{contact_id}", path = {"contact_id"}, body = {"company_id", "name", "phone", "email", "custom_fields"} },
  },
}
