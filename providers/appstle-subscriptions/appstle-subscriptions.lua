-- Appstle Subscriptions — every call this API accepts, as data.
--
-- GENERATED from https://developers.appstle.com/api-reference/openapi.json
-- Published on the vendor's own documentation site (https://developers.appstle.com).
-- 3 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "appstle-subscriptions",
  name = "Appstle Subscriptions",
  base = "https://subscription-admin.appstle.com",
  docs = "https://nango.dev/docs/integrations/all/appstle-subscriptions",
  auth = {
    kind = "key",
    header = "x-api-key",
    format = "{token}",
    env = "APPSTLE_SUBSCRIPTIONS_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["appstle-subscriptions.delete_plants_id"] = { method = "DELETE", url = "https://subscription-admin.appstle.com/plants/{id}", path = {"id"} },
    ["appstle-subscriptions.get_plants"] = { method = "GET", url = "https://subscription-admin.appstle.com/plants", query = {"limit"} },
    ["appstle-subscriptions.post_plants"] = { method = "POST", url = "https://subscription-admin.appstle.com/plants", body = {"name", "tag"} },
  },
}
