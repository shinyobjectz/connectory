-- Eleven Labs — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/elevenlabs.io/1.0/openapi.json
-- APIs.guru's mirror of elevenlabs.io, matched on elevenlabs.io. A mirror lags the vendor.
-- 18 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "elevenlabs",
  name = "Eleven Labs",
  base = "https://api.elevenlabs.io",
  docs = "https://nango.dev/docs/integrations/all/elevenlabs",
  auth = {
    kind = "key",
    header = "xi-api-key",
    format = "{token}",
    env = "ELEVENLABS_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["elevenlabs.add_voice_v1_voices_add_post"] = { method = "POST", url = "https://api.elevenlabs.io/v1/voices/add", header = {"xi-api-key"}, body = {"description", "files", "labels", "name"} },
    ["elevenlabs.delete_history_item_v1_history_history_item_id_delete"] = { method = "DELETE", url = "https://api.elevenlabs.io/v1/history/{history_item_id}", path = {"history_item_id"}, header = {"xi-api-key"} },
    ["elevenlabs.delete_sample_v1_voices_voice_id_samples_sample_id_delete"] = { method = "DELETE", url = "https://api.elevenlabs.io/v1/voices/{voice_id}/samples/{sample_id}", path = {"voice_id", "sample_id"}, header = {"xi-api-key"} },
    ["elevenlabs.delete_voice_v1_voices_voice_id_delete"] = { method = "DELETE", url = "https://api.elevenlabs.io/v1/voices/{voice_id}", path = {"voice_id"}, header = {"xi-api-key"} },
    ["elevenlabs.download_history_items_v1_history_download_post"] = { method = "POST", url = "https://api.elevenlabs.io/v1/history/download", header = {"xi-api-key"}, body = {"history_item_ids"} },
    ["elevenlabs.edit_voice_settings_v1_voices_voice_id_settings_edit_post"] = { method = "POST", url = "https://api.elevenlabs.io/v1/voices/{voice_id}/settings/edit", path = {"voice_id"}, header = {"xi-api-key"}, body = {"similarity_boost", "stability"} },
    ["elevenlabs.edit_voice_v1_voices_voice_id_edit_post"] = { method = "POST", url = "https://api.elevenlabs.io/v1/voices/{voice_id}/edit", path = {"voice_id"}, header = {"xi-api-key"}, body = {"description", "files", "labels", "name"} },
    ["elevenlabs.get_audio_from_history_item_v1_history_history_item_id_audio_get"] = { method = "GET", url = "https://api.elevenlabs.io/v1/history/{history_item_id}/audio", path = {"history_item_id"}, header = {"xi-api-key"} },
    ["elevenlabs.get_audio_from_sample_v1_voices_voice_id_samples_sample_id_audio_get"] = { method = "GET", url = "https://api.elevenlabs.io/v1/voices/{voice_id}/samples/{sample_id}/audio", path = {"voice_id", "sample_id"}, header = {"xi-api-key"} },
    ["elevenlabs.get_default_voice_settings_v1_voices_settings_default_get"] = { method = "GET", url = "https://api.elevenlabs.io/v1/voices/settings/default" },
    ["elevenlabs.get_generated_items_v1_history_get"] = { method = "GET", url = "https://api.elevenlabs.io/v1/history", header = {"xi-api-key"} },
    ["elevenlabs.get_user_info_v1_user_get"] = { method = "GET", url = "https://api.elevenlabs.io/v1/user", header = {"xi-api-key"} },
    ["elevenlabs.get_user_subscription_info_v1_user_subscription_get"] = { method = "GET", url = "https://api.elevenlabs.io/v1/user/subscription", header = {"xi-api-key"} },
    ["elevenlabs.get_voice_settings_v1_voices_voice_id_settings_get"] = { method = "GET", url = "https://api.elevenlabs.io/v1/voices/{voice_id}/settings", path = {"voice_id"}, header = {"xi-api-key"} },
    ["elevenlabs.get_voice_v1_voices_voice_id_get"] = { method = "GET", url = "https://api.elevenlabs.io/v1/voices/{voice_id}", path = {"voice_id"}, query = {"with_settings"}, header = {"xi-api-key"} },
    ["elevenlabs.get_voices_v1_voices_get"] = { method = "GET", url = "https://api.elevenlabs.io/v1/voices", header = {"xi-api-key"} },
    ["elevenlabs.text_to_speech_v1_text_to_speech_voice_id_post"] = { method = "POST", url = "https://api.elevenlabs.io/v1/text-to-speech/{voice_id}", path = {"voice_id"}, header = {"xi-api-key"}, body = {"text", "voice_settings"} },
    ["elevenlabs.text_to_speech_v1_text_to_speech_voice_id_stream_post"] = { method = "POST", url = "https://api.elevenlabs.io/v1/text-to-speech/{voice_id}/stream", path = {"voice_id"}, header = {"xi-api-key"}, body = {"text", "voice_settings"} },
  },
}
