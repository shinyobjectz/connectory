-- Attention — every call this API accepts, as data.
--
-- GENERATED from https://api.attention.tech/swagger.json
-- Published on the vendor's own documentation site (https://api.attention.tech).
-- 34 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "attention",
  name = "Attention",
  base = "https://api.attention.tech",
  docs = "https://nango.dev/docs/api-integrations/attention",
  auth = {
    kind = "key",
    header = "authorization",
    format = "Bearer {token}",
    env = "ATTENTION_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["attention.aircall_link_account_callback"] = { method = "GET", url = "https://api.attention.tech//install/aircall/callback", query = {"code", "state", "error"} },
    ["attention.aircall_webhook"] = { method = "POST", url = "https://api.attention.tech//aircall/webhook" },
    ["attention.ameyo_webhook_object_type"] = { method = "POST", url = "https://api.attention.tech//ameyo/webhook/{objectTypeCode}", path = {"objectTypeCode"}, query = {"organizationID"} },
    ["attention.deauth_zoom_integration"] = { method = "POST", url = "https://api.attention.tech//zoom/deauth", body = {"event", "payload", "body"} },
    ["attention.deepgram_callback"] = { method = "POST", url = "https://api.attention.tech//deepgram/callback" },
    ["attention.delete_zoom_integration"] = { method = "DELETE", url = "https://api.attention.tech//zoom/status" },
    ["attention.elevenlabs_callback"] = { method = "POST", url = "https://api.attention.tech//elevenlabs/callback" },
    ["attention.generate_zoom_link_account"] = { method = "GET", url = "https://api.attention.tech//zoom/account-links" },
    ["attention.get_login_events"] = { method = "GET", url = "https://api.attention.tech//login-events", query = {"start_date", "end_date"} },
    ["attention.gladia_callback"] = { method = "POST", url = "https://api.attention.tech//gladia/callback" },
    ["attention.google_link_account_callback"] = { method = "GET", url = "https://api.attention.tech//google/callback", query = {"code", "state", "error"} },
    ["attention.home"] = { method = "GET", url = "https://api.attention.tech//" },
    ["attention.hubspot_webhook_object_type"] = { method = "POST", url = "https://api.attention.tech//hubspot/webhook/crmrecord" },
    ["attention.login"] = { method = "POST", url = "https://api.attention.tech//login", body = {"email", "password", "credentials"} },
    ["attention.logout"] = { method = "POST", url = "https://api.attention.tech//logout" },
    ["attention.me"] = { method = "GET", url = "https://api.attention.tech//me" },
    ["attention.microsoft_link_account_callback"] = { method = "GET", url = "https://api.attention.tech//microsoft/callback", query = {"code", "state", "error"} },
    ["attention.petromin_recordings_callback"] = { method = "POST", url = "https://api.attention.tech//webhook/recordings/petromin", body = {"callDirection", "callStartTime", "callType", "customerCRTId", "dispositionClass", "dstPhone", "recordingFileUrl", "srcPhone", "userId", "body"} },
    ["attention.playback_notifications"] = { method = "POST", url = "https://api.attention.tech//playback/notifications" },
    ["attention.rc_desktop_realtime"] = { method = "POST", url = "https://api.attention.tech//recall/desktop-realtime", query = {"w"} },
    ["attention.rc_status_webhook"] = { method = "POST", url = "https://api.attention.tech//bot/rc-status-webhook" },
    ["attention.rc_webhook"] = { method = "POST", url = "https://api.attention.tech//bot/rc-webhook" },
    ["attention.recall_zoom_access_token"] = { method = "GET", url = "https://api.attention.tech//recall/zoom_access_token", query = {"user_id", "auth_token"} },
    ["attention.retrieve_zoom_integration_status"] = { method = "GET", url = "https://api.attention.tech//zoom/status" },
    ["attention.revai_callback"] = { method = "POST", url = "https://api.attention.tech//revai/callback" },
    ["attention.ring_over_callback"] = { method = "POST", url = "https://api.attention.tech//ringover/callback" },
    ["attention.salesforce_link_account_callback"] = { method = "POST", url = "https://api.attention.tech//salesforce/callback", body = {"code", "isSandbox", "organizationUUID", "state", "body"} },
    ["attention.salesforce_webhook_event"] = { method = "POST", url = "https://api.attention.tech//salesforce/webhook/event" },
    ["attention.salesforce_webhook_object_type"] = { method = "POST", url = "https://api.attention.tech//salesforce/webhook/{objectTypeCode}", path = {"objectTypeCode"} },
    ["attention.signup_auth_provider"] = { method = "POST", url = "https://api.attention.tech//signup-auth-provider" },
    ["attention.slack_link_account_callback"] = { method = "GET", url = "https://api.attention.tech//slack/callback", query = {"code", "state", "error"} },
    ["attention.ubity_callback"] = { method = "GET", url = "https://api.attention.tech//ubity/callback" },
    ["attention.zoom_link_account_callback"] = { method = "GET", url = "https://api.attention.tech//zoom/callback", query = {"code", "state", "error"} },
    ["attention.zoom_webhook"] = { method = "POST", url = "https://api.attention.tech//zoom/webhook" },
  },
}
