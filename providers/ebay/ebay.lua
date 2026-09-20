-- eBay — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/api.ebay.com/sell-account/v1.9.0/openapi.json
-- APIs.guru's mirror, matched on api.ebay.com. A mirror lags the vendor.
-- 36 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "ebay",
  name = "eBay",
  base = "https://api.ebay.com",
  docs = "https://nango.dev/docs/integrations/all/ebay",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "EBAY_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["ebay.create_custom_policy"] = { method = "POST", url = "https://api.ebay.com/custom_policy/", header = {"X-EBAY-C-MARKETPLACE-ID"}, body = {"description", "label", "name", "policyType"} },
    ["ebay.create_fulfillment_policy"] = { method = "POST", url = "https://api.ebay.com/fulfillment_policy/", body = {"categoryTypes", "description", "freightShipping", "globalShipping", "handlingTime", "localPickup", "marketplaceId", "name", "pickupDropOff", "shipToLocations", "shippingOptions"} },
    ["ebay.create_or_replace_sales_tax"] = { method = "PUT", url = "https://api.ebay.com/sales_tax/{countryCode}/{jurisdictionId}", path = {"countryCode", "jurisdictionId"}, body = {"salesTaxPercentage", "shippingAndHandlingTaxed"} },
    ["ebay.create_payment_policy"] = { method = "POST", url = "https://api.ebay.com/payment_policy", body = {"categoryTypes", "deposit", "description", "fullPaymentDueIn", "immediatePay", "marketplaceId", "name", "paymentInstructions", "paymentMethods"} },
    ["ebay.create_return_policy"] = { method = "POST", url = "https://api.ebay.com/return_policy", body = {"categoryTypes", "description", "extendedHolidayReturnsOffered", "internationalOverride", "marketplaceId", "name", "refundMethod", "restockingFeePercentage", "returnInstructions", "returnMethod", "returnPeriod", "returnShippingCostPayer", "returnsAccepted"} },
    ["ebay.delete_fulfillment_policy"] = { method = "DELETE", url = "https://api.ebay.com/fulfillment_policy/{fulfillmentPolicyId}", path = {"fulfillmentPolicyId"} },
    ["ebay.delete_payment_policy"] = { method = "DELETE", url = "https://api.ebay.com/payment_policy/{payment_policy_id}", path = {"payment_policy_id"} },
    ["ebay.delete_return_policy"] = { method = "DELETE", url = "https://api.ebay.com/return_policy/{return_policy_id}", path = {"return_policy_id"} },
    ["ebay.delete_sales_tax"] = { method = "DELETE", url = "https://api.ebay.com/sales_tax/{countryCode}/{jurisdictionId}", path = {"countryCode", "jurisdictionId"} },
    ["ebay.get_advertising_eligibility"] = { method = "GET", url = "https://api.ebay.com/advertising_eligibility", query = {"program_types"}, header = {"X-EBAY-C-MARKETPLACE-ID"} },
    ["ebay.get_custom_policies"] = { method = "GET", url = "https://api.ebay.com/custom_policy/", query = {"policy_types"}, header = {"X-EBAY-C-MARKETPLACE-ID"} },
    ["ebay.get_custom_policy"] = { method = "GET", url = "https://api.ebay.com/custom_policy/{custom_policy_id}", path = {"custom_policy_id"}, header = {"X-EBAY-C-MARKETPLACE-ID"} },
    ["ebay.get_fulfillment_policies"] = { method = "GET", url = "https://api.ebay.com/fulfillment_policy", query = {"marketplace_id"} },
    ["ebay.get_fulfillment_policy"] = { method = "GET", url = "https://api.ebay.com/fulfillment_policy/{fulfillmentPolicyId}", path = {"fulfillmentPolicyId"} },
    ["ebay.get_fulfillment_policy_by_name"] = { method = "GET", url = "https://api.ebay.com/fulfillment_policy/get_by_policy_name", query = {"marketplace_id", "name"} },
    ["ebay.get_kyc"] = { method = "GET", url = "https://api.ebay.com/kyc" },
    ["ebay.get_opted_in_programs"] = { method = "GET", url = "https://api.ebay.com/program/get_opted_in_programs" },
    ["ebay.get_payment_policies"] = { method = "GET", url = "https://api.ebay.com/payment_policy", query = {"marketplace_id"} },
    ["ebay.get_payment_policy"] = { method = "GET", url = "https://api.ebay.com/payment_policy/{payment_policy_id}", path = {"payment_policy_id"} },
    ["ebay.get_payment_policy_by_name"] = { method = "GET", url = "https://api.ebay.com/payment_policy/get_by_policy_name", query = {"marketplace_id", "name"} },
    ["ebay.get_payments_program"] = { method = "GET", url = "https://api.ebay.com/payments_program/{marketplace_id}/{payments_program_type}", path = {"marketplace_id", "payments_program_type"} },
    ["ebay.get_payments_program_onboarding"] = { method = "GET", url = "https://api.ebay.com/payments_program/{marketplace_id}/{payments_program_type}/onboarding", path = {"marketplace_id", "payments_program_type"} },
    ["ebay.get_privileges"] = { method = "GET", url = "https://api.ebay.com/privilege" },
    ["ebay.get_rate_tables"] = { method = "GET", url = "https://api.ebay.com/rate_table", query = {"country_code"} },
    ["ebay.get_return_policies"] = { method = "GET", url = "https://api.ebay.com/return_policy", query = {"marketplace_id"} },
    ["ebay.get_return_policy"] = { method = "GET", url = "https://api.ebay.com/return_policy/{return_policy_id}", path = {"return_policy_id"} },
    ["ebay.get_return_policy_by_name"] = { method = "GET", url = "https://api.ebay.com/return_policy/get_by_policy_name", query = {"marketplace_id", "name"} },
    ["ebay.get_sales_tax"] = { method = "GET", url = "https://api.ebay.com/sales_tax/{countryCode}/{jurisdictionId}", path = {"countryCode", "jurisdictionId"} },
    ["ebay.get_sales_taxes"] = { method = "GET", url = "https://api.ebay.com/sales_tax", query = {"country_code"} },
    ["ebay.get_subscription"] = { method = "GET", url = "https://api.ebay.com/subscription", query = {"limit", "continuation_token"} },
    ["ebay.opt_in_to_program"] = { method = "POST", url = "https://api.ebay.com/program/opt_in", body = {"programType"} },
    ["ebay.opt_out_of_program"] = { method = "POST", url = "https://api.ebay.com/program/opt_out", body = {"programType"} },
    ["ebay.update_custom_policy"] = { method = "PUT", url = "https://api.ebay.com/custom_policy/{custom_policy_id}", path = {"custom_policy_id"}, header = {"X-EBAY-C-MARKETPLACE-ID"}, body = {"description", "label", "name"} },
    ["ebay.update_fulfillment_policy"] = { method = "PUT", url = "https://api.ebay.com/fulfillment_policy/{fulfillmentPolicyId}", path = {"fulfillmentPolicyId"}, body = {"categoryTypes", "description", "freightShipping", "globalShipping", "handlingTime", "localPickup", "marketplaceId", "name", "pickupDropOff", "shipToLocations", "shippingOptions"} },
    ["ebay.update_payment_policy"] = { method = "PUT", url = "https://api.ebay.com/payment_policy/{payment_policy_id}", path = {"payment_policy_id"}, body = {"categoryTypes", "deposit", "description", "fullPaymentDueIn", "immediatePay", "marketplaceId", "name", "paymentInstructions", "paymentMethods"} },
    ["ebay.update_return_policy"] = { method = "PUT", url = "https://api.ebay.com/return_policy/{return_policy_id}", path = {"return_policy_id"}, body = {"categoryTypes", "description", "extendedHolidayReturnsOffered", "internationalOverride", "marketplaceId", "name", "refundMethod", "restockingFeePercentage", "returnInstructions", "returnMethod", "returnPeriod", "returnShippingCostPayer", "returnsAccepted"} },
  },
}
