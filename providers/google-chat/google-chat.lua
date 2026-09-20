-- Google Chat — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/googleapis.com/chat/v1/openapi.json
-- APIs.guru's mirror of googleapis.com:chat, matched on googleapis.com. A mirror lags the vendor.
-- 8 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "google-chat",
  name = "Google Chat",
  base = "https://chat.googleapis.com",
  docs = "https://nango.dev/docs/api-integrations/google-chat",
  auth = {
    kind = "manual",
    header = "authorization",
    format = "Bearer {token}",
    env = "GOOGLE_CHAT_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["google-chat.chat_media_download"] = { method = "GET", url = "https://chat.googleapis.com/v1/media/{resourceName}", path = {"resourceName"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-chat.chat_spaces_list"] = { method = "GET", url = "https://chat.googleapis.com/v1/spaces", query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "pageSize", "pageToken"} },
    ["google-chat.chat_spaces_members_list"] = { method = "GET", url = "https://chat.googleapis.com/v1/{parent}/members", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "pageSize", "pageToken"} },
    ["google-chat.chat_spaces_messages_attachments_get"] = { method = "GET", url = "https://chat.googleapis.com/v1/{name}", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-chat.chat_spaces_messages_create"] = { method = "POST", url = "https://chat.googleapis.com/v1/{parent}/messages", path = {"parent"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "messageId", "messageReplyOption", "requestId", "threadKey"}, body = {"actionResponse", "annotations", "argumentText", "attachment", "cards", "cardsV2", "clientAssignedMessageId", "createTime", "fallbackText", "lastUpdateTime", "matchedUrl", "name", "sender", "slashCommand", "space", "text", "thread", "threadReply"} },
    ["google-chat.chat_spaces_messages_delete"] = { method = "DELETE", url = "https://chat.googleapis.com/v1/{name}", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType"} },
    ["google-chat.chat_spaces_messages_patch"] = { method = "PATCH", url = "https://chat.googleapis.com/v1/{name}", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "allowMissing", "updateMask"}, body = {"actionResponse", "annotations", "argumentText", "attachment", "cards", "cardsV2", "clientAssignedMessageId", "createTime", "fallbackText", "lastUpdateTime", "matchedUrl", "name", "sender", "slashCommand", "space", "text", "thread", "threadReply"} },
    ["google-chat.chat_spaces_messages_update"] = { method = "PUT", url = "https://chat.googleapis.com/v1/{name}", path = {"name"}, query = {"$.xgafv", "alt", "callback", "fields", "oauth_token", "prettyPrint", "quotaUser", "upload_protocol", "uploadType", "allowMissing", "updateMask"}, body = {"actionResponse", "annotations", "argumentText", "attachment", "cards", "cardsV2", "clientAssignedMessageId", "createTime", "fallbackText", "lastUpdateTime", "matchedUrl", "name", "sender", "slashCommand", "space", "text", "thread", "threadReply"} },
  },
}
