-- Paypal — every call this API accepts, as data.
--
-- GENERATED from https://raw.githubusercontent.com/paypal/paypal-rest-api-specifications/main/openapi/checkout_orders_v2.json
-- Published by paypal, the vendor's own GitHub organisation.
-- 9 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "paypal",
  name = "Paypal",
  base = "https://api-m.paypal.com",
  docs = "https://nango.dev/docs/integrations/all/paypal",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "PAYPAL_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["paypal.orders_authorize"] = { method = "POST", url = "https://api-m.paypal.com/v2/checkout/orders/{id}/authorize", path = {"id"}, header = {"PayPal-Request-Id", "Prefer", "PayPal-Client-Metadata-Id", "PayPal-Auth-Assertion"}, body = {"payment_source"} },
    ["paypal.orders_capture"] = { method = "POST", url = "https://api-m.paypal.com/v2/checkout/orders/{id}/capture", path = {"id"}, header = {"PayPal-Request-Id", "Prefer", "PayPal-Client-Metadata-Id", "PayPal-Auth-Assertion"}, body = {"payment_source"} },
    ["paypal.orders_confirm"] = { method = "POST", url = "https://api-m.paypal.com/v2/checkout/orders/{id}/confirm-payment-source", path = {"id"}, header = {"PayPal-Client-Metadata-Id", "PayPal-Auth-Assertion", "Prefer"}, body = {"payment_source", "application_context"} },
    ["paypal.orders_create"] = { method = "POST", url = "https://api-m.paypal.com/v2/checkout/orders", header = {"PayPal-Request-Id", "PayPal-Partner-Attribution-Id", "PayPal-Client-Metadata-Id", "Prefer", "PayPal-Auth-Assertion"}, body = {"intent", "payer", "purchase_units", "payment_source", "application_context"} },
    ["paypal.orders_get"] = { method = "GET", url = "https://api-m.paypal.com/v2/checkout/orders/{id}", path = {"id"}, query = {"fields"}, header = {"PayPal-Auth-Assertion"} },
    ["paypal.orders_patch"] = { method = "PATCH", url = "https://api-m.paypal.com/v2/checkout/orders/{id}", path = {"id"}, header = {"PayPal-Auth-Assertion"} },
    ["paypal.orders_track_create"] = { method = "POST", url = "https://api-m.paypal.com/v2/checkout/orders/{id}/track", path = {"id"}, header = {"PayPal-Auth-Assertion"}, body = {"tracking_number", "carrier", "carrier_name_other"} },
    ["paypal.orders_trackers_patch"] = { method = "PATCH", url = "https://api-m.paypal.com/v2/checkout/orders/{id}/trackers/{tracker_id}", path = {"id", "tracker_id"}, header = {"PayPal-Auth-Assertion"} },
    ["paypal.server_callback"] = { method = "POST", url = "https://api-m.paypal.com/v2/checkout/orders/order-update-callback", body = {"id", "shipping_address", "shipping_option", "purchase_units"} },
  },
}
