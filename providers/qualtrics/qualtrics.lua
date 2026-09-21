-- Qualtrics — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/qualtrics.com/0.2/openapi.json
-- APIs.guru's mirror of qualtrics.com, matched on qualtrics.com. A mirror lags the vendor.
-- 8 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "qualtrics",
  name = "Qualtrics",
  base = "https://{subdomain}.qualtrics.com",
  docs = "https://nango.dev/docs/integrations/all/qualtrics",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "QUALTRICS_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = { ["subdomain"] = "QUALTRICS_SUBDOMAIN" },
  headers = {},
  operations = {
    ["qualtrics.create_contact_in_mailinglist"] = { method = "POST", url = "https://{subdomain}.qualtrics.com/API/v3/directories/{DirectoryId}/mailinglists/{MailingListId}/contacts", path = {"DirectoryId", "MailingListId"}, body = {"email", "firstName", "lastName", "unsubscribed"} },
    ["qualtrics.generate_distribution_links"] = { method = "POST", url = "https://{subdomain}.qualtrics.com/API/v3/distributions", body = {"action", "description", "expirationDate", "linkType", "mailingListId", "surveyId"} },
    ["qualtrics.get_distributions"] = { method = "GET", url = "https://{subdomain}.qualtrics.com/API/v3/distributions", query = {"surveyId"} },
    ["qualtrics.get_event_subscriptions"] = { method = "GET", url = "https://{subdomain}.qualtrics.com/API/v3/eventsubscriptions/{SubscriptionId}", path = {"SubscriptionId"} },
    ["qualtrics.get_survey"] = { method = "GET", url = "https://{subdomain}.qualtrics.com/API/v3/survey-definitions/{SurveyId}", path = {"SurveyId"} },
    ["qualtrics.retrievedistributionlinks"] = { method = "GET", url = "https://{subdomain}.qualtrics.com/API/v3/distributions/{DistributionId}/links", path = {"DistributionId"}, query = {"surveyId"} },
    ["qualtrics.webhook_delete"] = { method = "DELETE", url = "https://{subdomain}.qualtrics.com/API/v3/eventsubscriptions/" },
    ["qualtrics.when_aresponse_is_received"] = { method = "POST", url = "https://{subdomain}.qualtrics.com/API/v3/eventsubscriptions/" },
  },
}
