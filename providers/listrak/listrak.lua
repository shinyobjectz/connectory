-- Listrak — every call this API accepts, as data.
--
-- GENERATED from https://api.listrak.com/v1/openapi.json
-- Published on the vendor's own documentation site (https://api.listrak.com).
-- 3 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "listrak",
  name = "Listrak",
  base = "https://api.listrak.com/email",
  docs = "https://nango.dev/docs/api-integrations/listrak",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "LISTRAK_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["listrak.get_event_configurations"] = { method = "GET", url = "https://api.listrak.com/crosschannel/v1/eventConfigurations" },
    ["listrak.get_schema_by_event_uid"] = { method = "GET", url = "https://api.listrak.com/crosschannel/v1/eventConfigurations/{eventUID}", path = {"eventUID"} },
    ["listrak.post_events"] = { method = "POST", url = "https://api.listrak.com/crosschannel/v1/eventConfigurations/{eventUID}/events", path = {"eventUID"}, body = {"events"} },
  },
}
