-- Copper — every call this API accepts, as data.
--
-- GENERATED from https://developer.copper.com/v1/openapi.json
-- Published on the vendor's own documentation site (https://developer.copper.com).
-- 27 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "copper",
  name = "Copper",
  base = "https://api.copper.com/developer_api",
  docs = "https://nango.dev/docs/integrations/all/copper",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "COPPER_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["copper.get_company_activities"] = { method = "POST", url = "https://api.copper.com/developer_api/v1/companies/{id}/activities", path = {"id"}, body = {"page_number", "page_size"} },
    ["copper.get_lead_activities"] = { method = "POST", url = "https://api.copper.com/developer_api/v1/leads/{id}/activities", path = {"id"}, body = {"page_number", "page_size"} },
    ["copper.get_opportunity"] = { method = "GET", url = "https://api.copper.com/developer_api/v1/opportunities/{id}", path = {"id"}, query = {"custom_field_computed_values"} },
    ["copper.get_opportunity_activities"] = { method = "POST", url = "https://api.copper.com/developer_api/v1/opportunities/{id}/activities", path = {"id"}, body = {"page_number", "page_size"} },
    ["copper.get_person_activities"] = { method = "POST", url = "https://api.copper.com/developer_api/v1/people/{id}/activities", path = {"id"}, body = {"page_number", "page_size"} },
    ["copper.get_person_by_email"] = { method = "POST", url = "https://api.copper.com/developer_api/v1/people/fetch_by_email", query = {"custom_field_computed_values"}, body = {"email"} },
    ["copper.get_related_items"] = { method = "GET", url = "https://api.copper.com/developer_api/v1/{entity_type}/{entity_id}/related", path = {"entity_type", "entity_id"} },
    ["copper.get_related_items_by_type"] = { method = "GET", url = "https://api.copper.com/developer_api/v1/{entity_type}/{entity_id}/related/{related_entity_type}", path = {"entity_type", "entity_id", "related_entity_type"} },
    ["copper.get_user"] = { method = "GET", url = "https://api.copper.com/developer_api/v1/users/{id}", path = {"id"} },
    ["copper.list_activity_types"] = { method = "GET", url = "https://api.copper.com/developer_api/v1/activity_types" },
    ["copper.list_contact_types"] = { method = "GET", url = "https://api.copper.com/developer_api/v1/contact_types" },
    ["copper.list_custom_activity_types"] = { method = "GET", url = "https://api.copper.com/developer_api/v1/custom_activity_types" },
    ["copper.list_custom_field_definitions"] = { method = "GET", url = "https://api.copper.com/developer_api/v1/custom_field_definitions" },
    ["copper.list_customer_sources"] = { method = "GET", url = "https://api.copper.com/developer_api/v1/customer_sources" },
    ["copper.list_field_layout_by_entity_type"] = { method = "GET", url = "https://api.copper.com/developer_api/v1/field_layouts/by_entity/{entity_type}", path = {"entity_type"}, query = {"pipeline_id"} },
    ["copper.list_lead_statuses"] = { method = "GET", url = "https://api.copper.com/developer_api/v1/lead_statuses" },
    ["copper.list_loss_reasons"] = { method = "GET", url = "https://api.copper.com/developer_api/v1/loss_reasons" },
    ["copper.list_pipeline_stages"] = { method = "GET", url = "https://api.copper.com/developer_api/v1/pipeline_stages" },
    ["copper.list_pipelines"] = { method = "GET", url = "https://api.copper.com/developer_api/v1/pipelines" },
    ["copper.list_tags"] = { method = "GET", url = "https://api.copper.com/developer_api/v1/tags", query = {"sort_by", "tag_names_only", "last_tag_value"} },
    ["copper.list_users"] = { method = "POST", url = "https://api.copper.com/developer_api/v1/users/search", body = {"page_number", "page_size"} },
    ["copper.search_activities"] = { method = "POST", url = "https://api.copper.com/developer_api/v1/activities/search", body = {"parent", "activity_types", "user_ids", "minimum_activity_date", "maximum_activity_date", "full_result", "sort_by", "sort_direction", "page_number", "page_size"} },
    ["copper.search_companies"] = { method = "POST", url = "https://api.copper.com/developer_api/v1/companies/search", query = {"custom_field_computed_values"}, body = {"ids", "name", "email_domain", "email_domains", "phone_number", "city", "state", "postal_code", "country", "primary_contact_ids", "tags", "assignee_ids", "contact_type_ids", "socials", "followed", "age", "minimum_interaction_count", "maximum_interaction_count", "minimum_interaction_date", "maximum_interaction_date", "minimum_created_date", "maximum_created_date", "minimum_modified_date", "maximum_modified_date", "custom_fields", "sort_by", "sort_direction", "page_number", "page_size", "fields"} },
    ["copper.search_leads"] = { method = "POST", url = "https://api.copper.com/developer_api/v1/leads/search", query = {"custom_field_computed_values"}, body = {"ids", "name", "first_name", "last_name", "middle_name", "emails", "phone_number", "company_name", "title", "city", "state", "postal_code", "country", "tags", "assignee_ids", "status_ids", "customer_source_ids", "socials", "followed", "age", "minimum_monetary_value", "maximum_monetary_value", "minimum_interaction_count", "maximum_interaction_count", "minimum_interaction_date", "maximum_interaction_date", "minimum_created_date", "maximum_created_date", "minimum_modified_date", "maximum_modified_date", "include_converted_leads", "custom_fields", "sort_by", "sort_direction", "page_number", "page_size", "fields"} },
    ["copper.search_opportunities"] = { method = "POST", url = "https://api.copper.com/developer_api/v1/opportunities/search", query = {"custom_field_computed_values"}, body = {"ids", "name", "company_name", "company_ids", "primary_contact_ids", "close_date", "minimum_close_date", "maximum_close_date", "minimum_monetary_value", "maximum_monetary_value", "minimum_win_probability", "maximum_win_probability", "tags", "assignee_ids", "pipeline_ids", "pipeline_stage_ids", "statuses", "priorities", "loss_reason_ids", "customer_source_ids", "followed", "age", "minimum_interaction_count", "maximum_interaction_count", "minimum_interaction_date", "maximum_interaction_date", "minimum_date_stage_changed", "maximum_date_stage_changed", "minimum_created_date", "maximum_created_date", "minimum_modified_date", "maximum_modified_date", "custom_fields", "sort_by", "sort_direction", "page_number", "page_size", "fields"} },
    ["copper.search_people"] = { method = "POST", url = "https://api.copper.com/developer_api/v1/people/search", query = {"custom_field_computed_values"}, body = {"ids", "name", "emails", "phone_numbers", "title", "city", "state", "postal_code", "country", "tags", "assignee_ids", "contact_type_ids", "company_ids", "opportunity_ids", "socials", "followed", "age", "minimum_interaction_count", "maximum_interaction_count", "minimum_interaction_date", "maximum_interaction_date", "minimum_created_date", "maximum_created_date", "minimum_modified_date", "maximum_modified_date", "custom_fields", "sort_by", "sort_direction", "page_number", "page_size", "fields"} },
    ["copper.search_tasks"] = { method = "POST", url = "https://api.copper.com/developer_api/v1/tasks/search", query = {"custom_field_computed_values"}, body = {"name", "phrase", "related_resource", "tags", "assignee_ids", "statuses", "priorities", "minimum_due_date", "maximum_due_date", "minimum_reminder_date", "maximum_reminder_date", "minimum_completed_date", "maximum_completed_date", "minimum_close_date", "maximum_close_date", "minimum_modified_date", "maximum_modified_date", "custom_fields", "sort_by", "sort_direction", "page_number", "page_size"} },
  },
}
