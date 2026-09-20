-- Finta — every call this API accepts, as data.
--
-- GENERATED from https://api.finta.io/v1/openapi.json
-- Published on the vendor's own documentation site (https://api.finta.io).
-- 6 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "finta",
  name = "Finta",
  base = "https://api.finta.io",
  docs = "https://nango.dev/docs/api-integrations/finta",
  auth = {
    kind = "key",
    header = "authorization",
    format = "Bearer {token}",
    env = "FINTA_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["finta.get_health"] = { method = "GET", url = "https://api.finta.io/v1/health" },
    ["finta.list_accounts"] = { method = "GET", url = "https://api.finta.io/v1/accounts", query = {"connectionId"} },
    ["finta.list_bank_connections"] = { method = "GET", url = "https://api.finta.io/v1/bank-connections" },
    ["finta.list_holdings"] = { method = "GET", url = "https://api.finta.io/v1/holdings", query = {"bankConnectionId", "accountIds", "limit", "cursor"} },
    ["finta.list_investment_transactions"] = { method = "GET", url = "https://api.finta.io/v1/investment-transactions", query = {"bankConnectionId", "accountIds", "startDate", "endDate", "limit", "cursor"} },
    ["finta.list_transactions"] = { method = "GET", url = "https://api.finta.io/v1/transactions", query = {"bankConnectionId", "accountIds", "startDate", "endDate", "limit", "cursor"} },
  },
}
