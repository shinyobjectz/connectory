-- Rock Gym Pro — every call this API accepts, as data.
--
-- GENERATED from https://api.rockgympro.com/openapi.yaml
-- Published on the vendor's own documentation site (https://api.rockgympro.com).
-- 26 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "rock-gym-pro",
  name = "Rock Gym Pro",
  base = "https://api.rockgympro.com",
  docs = "https://nango.dev/docs/integrations/all/rock-gym-pro",
  auth = {
    kind = "basic",
    header = "authorization",
    format = "Bearer {token}",
    env = nil,
    user_env = "ROCK_GYM_PRO_USER",
    pass_env = "ROCK_GYM_PRO_PASS",
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["rock-gym-pro.05a2e418f7144f0e209fe32872af856d"] = { method = "GET", url = "https://api.rockgympro.com/v1/customers/facility/{facilityCode}", path = {"facilityCode"}, query = {"type", "status", "waiverSigned", "birthdayMonth", "birthdayUpcoming", "firstContactDateEnding", "firstContactDateStarting", "lastVisitDateEnding", "lastVisitDateStarting", "lastEditDateEnding", "lastEditDateStarting", "firstName", "middleName", "lastName", "city", "state", "postalCode", "country", "ageGreaterThan", "ageLessThan", "onlineAccountLinked", "emailAddressPopulated", "emailAllowMarketing", "emailTouchDateEnding", "emailTouchDateStarting", "emailAddress", "customText1", "customText2", "limit", "page"} },
    ["rock-gym-pro.0c8e8234fdd1b7cda6333329c1bb96f7"] = { method = "GET", url = "https://api.rockgympro.com/v1/bookings/facility/{facilityCode}/{bookingId}", path = {"facilityCode", "bookingId"} },
    ["rock-gym-pro.0cd31fd97d0f629bf0bc7c38c1f879d8"] = { method = "GET", url = "https://api.rockgympro.com/v1/checkins/facility/{facilityCode}", path = {"facilityCode"}, query = {"startId", "customerGuid", "customerDetails", "remoteOnly", "startDateTime", "endDateTime", "limit", "page"} },
    ["rock-gym-pro.14b4e6a6230d3a40df9f375e3cb5eefd"] = { method = "GET", url = "https://api.rockgympro.com/v1/facilities" },
    ["rock-gym-pro.1545b5cae92c6931064c8e98089fb5fb"] = { method = "GET", url = "https://api.rockgympro.com/v1/checkins/active/facility/{facilityCode}", path = {"facilityCode"} },
    ["rock-gym-pro.29eb61f184278d1fd12d33e9bdfb9d0a"] = { method = "GET", url = "https://api.rockgympro.com/v1/me" },
    ["rock-gym-pro.322bcadbe5c9432df9d38c735f25ff33"] = { method = "GET", url = "https://api.rockgympro.com/v1/widgets/events/{eventWidgetGuid}", path = {"eventWidgetGuid"}, query = {"startDateTime", "endDateTime"} },
    ["rock-gym-pro.3460a296316272b8b3c301484de44fe7"] = { method = "GET", url = "https://api.rockgympro.com/v1/widgets/events/facility/{facilityCode}", path = {"facilityCode"}, query = {"includeInactiveWidgets", "limit", "page"} },
    ["rock-gym-pro.3d27e47fbf631103c480951153130977"] = { method = "GET", url = "https://api.rockgympro.com/v1/customers/{customerGuid}", path = {"customerGuid"} },
    ["rock-gym-pro.4654f2844ef99fa834a040b35ca5cdb3"] = { method = "GET", url = "https://api.rockgympro.com/v1/bookings/facility/{facilityCode}", path = {"facilityCode"}, query = {"startId", "customerGuid", "startDateTime", "endDateTime", "limit", "page"} },
    ["rock-gym-pro.4aaef484a0c178df63c809bd06396e2d"] = { method = "GET", url = "https://api.rockgympro.com/v1/versions/facility/{facilityCode}", path = {"facilityCode"} },
    ["rock-gym-pro.6423cd99a296b47d6914c94a6515cd48"] = { method = "GET", url = "https://api.rockgympro.com/ping" },
    ["rock-gym-pro.6c1ba1010457e99f3a86092035599f85"] = { method = "GET", url = "https://api.rockgympro.com/v1/settings", query = {"facility", "name"} },
    ["rock-gym-pro.77fdfec22118a392c0b1b74d7ce37dd9"] = { method = "GET", url = "https://api.rockgympro.com/v1/invoices/facility/{facilityCode}/{invoiceId}", path = {"facilityCode", "invoiceId"} },
    ["rock-gym-pro.8f54d1229b32cc98fc82bf1c38817915"] = { method = "GET", url = "https://api.rockgympro.com/v1/sales/facility/{facilityCode}", path = {"facilityCode"}, query = {"startId", "productId", "startDateTime", "endDateTime", "limit", "page"} },
    ["rock-gym-pro.9b82dfdd34becd82fdb2026c23d55acd"] = { method = "GET", url = "https://api.rockgympro.com/v1/checkins/facility/{facilityCode}/{checkinId}", path = {"facilityCode", "checkinId"} },
    ["rock-gym-pro.a22e34bffcc70422d9cd9da9915b6190"] = { method = "GET", url = "https://api.rockgympro.com/v1/versions", query = {"facility"} },
    ["rock-gym-pro.ad33857bb9d7bb801d2f33bddf6968c6"] = { method = "GET", url = "https://api.rockgympro.com/v1/widgets/events/facility/{facilityCode}/{eventWidgetGuid}", path = {"facilityCode", "eventWidgetGuid"}, query = {"startDateTime", "endDateTime"} },
    ["rock-gym-pro.afa6537669afe89daa9e6a77e2fc5699"] = { method = "GET", url = "https://api.rockgympro.com/v1/timeclocks/facility/{facilityCode}", path = {"facilityCode"}, query = {"startId", "customerGuid", "startDateTime", "endDateTime", "limit", "page"} },
    ["rock-gym-pro.b26c4b866845047e6e45202286a2fa42"] = { method = "GET", url = "https://api.rockgympro.com/v1/customers", query = {"customerGuid"} },
    ["rock-gym-pro.be70bffbe9fcd0fe1bbb4a69c9e17514"] = { method = "GET", url = "https://api.rockgympro.com/v1/ping" },
    ["rock-gym-pro.d6c08b0d5f0ed910bce351f6b79cb27d"] = { method = "GET", url = "https://api.rockgympro.com/v1/invoices/facility/{facilityCode}", path = {"facilityCode"}, query = {"startId", "customerGuid", "startDateTime", "endDateTime", "includeVoidInvoices", "limit", "page"} },
    ["rock-gym-pro.dcce50d062ebd2185cbae0ff38534360"] = { method = "GET", url = "https://api.rockgympro.com/v1/settings/facility/{facilityCode}", path = {"facilityCode"} },
    ["rock-gym-pro.ec2432936e5623629eb408f2ffbee3f7"] = { method = "GET", url = "https://api.rockgympro.com/v1/dailynumbers/facility/{facilityCode}", path = {"facilityCode"}, query = {"startDate", "endDate", "tag", "limit", "page"} },
    ["rock-gym-pro.f4ec437dbda8816166950c0ec7764a96"] = { method = "GET", url = "https://api.rockgympro.com/v1/staff", query = {"startId", "limit", "page"} },
    ["rock-gym-pro.fe21994c95f659b3f83e49915826cdf5"] = { method = "GET", url = "https://api.rockgympro.com/v1/timeclocks/facility/{facilityCode}/{timeclockId}", path = {"facilityCode", "timeclockId"} },
  },
}
