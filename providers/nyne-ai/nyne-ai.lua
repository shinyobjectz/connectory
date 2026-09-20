-- Nyne AI — every call this API accepts, as data.
--
-- GENERATED from https://nyne.ai/.well-known/openapi.json
-- Published on the vendor's own documentation site (https://nyne.ai).
-- 1 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "nyne-ai",
  name = "Nyne AI",
  base = "https://api.nyne.ai",
  docs = "https://nango.dev/docs/api-integrations/nyne-ai",
  auth = {
    kind = "key",
    header = "x-api-key",
    format = "{token}",
    env = "NYNE_AI_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["nyne-ai.mcp_message"] = { method = "POST", url = "https://api.nyne.ai/mcp/message", body = {"jsonrpc", "id", "method", "params"} },
  },
}
