-- IDS Fulfillment — every call this API accepts, as data.
--
-- GENERATED from https://api.idsfulfillment.com/swagger/v1/swagger.json
-- Published on the vendor's own documentation site (https://api.idsfulfillment.com).
-- 18 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "ids-fulfillment",
  name = "IDS Fulfillment",
  base = "https://api.idsfulfillment.com",
  docs = "https://nango.dev/docs/api-integrations/ids-fulfillment",
  auth = {
    kind = "key",
    header = "apikey",
    format = "{token}",
    env = "IDS_FULFILLMENT_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["ids-fulfillment.get_request_InventoryReceipt"] = { method = "GET", url = "https://api.idsfulfillment.com/request/InventoryReceipt", query = {"min_CreatedDateTime", "max_CreatedDateTime", "CustomerReferenceNumbers", "ReceiptTypes", "DefaultLimit", "MaxLimit", "Page", "Limit", "Offset"} },
    ["ids-fulfillment.get_request_InventoryReceipt_customerReferenceNumber"] = { method = "GET", url = "https://api.idsfulfillment.com/request/InventoryReceipt/{customerReferenceNumber}", path = {"customerReferenceNumber"} },
    ["ids-fulfillment.get_request_InventoryReceipt_preview"] = { method = "GET", url = "https://api.idsfulfillment.com/request/InventoryReceipt/preview", query = {"min_CreatedDateTime", "max_CreatedDateTime", "CustomerReferenceNumbers", "ReceiptTypes", "DefaultLimit", "MaxLimit", "Page", "Limit", "Offset"} },
    ["ids-fulfillment.get_request_Ship"] = { method = "GET", url = "https://api.idsfulfillment.com/request/Ship", query = {"min_ShipDate", "max_ShipDate", "OrderStatuses", "IncludeOrphans", "CustomerOrderReferenceNumbers", "DefaultLimit", "MaxLimit", "Page", "Limit", "Offset"} },
    ["ids-fulfillment.get_request_Ship_customerOrderReferenceNumber"] = { method = "GET", url = "https://api.idsfulfillment.com/request/Ship/{customerOrderReferenceNumber}", path = {"customerOrderReferenceNumber"} },
    ["ids-fulfillment.get_request_Ship_preview"] = { method = "GET", url = "https://api.idsfulfillment.com/request/Ship/preview", query = {"min_ShipDate", "max_ShipDate", "OrderStatuses", "IncludeOrphans", "CustomerOrderReferenceNumbers", "DefaultLimit", "MaxLimit", "Page", "Limit", "Offset"} },
    ["ids-fulfillment.get_request_StorerInventory"] = { method = "GET", url = "https://api.idsfulfillment.com/request/StorerInventory", query = {"IncludeDisabledZones", "PageSize", "PageNumber"} },
    ["ids-fulfillment.get_request_WmsOrderStatus"] = { method = "GET", url = "https://api.idsfulfillment.com/request/WmsOrderStatus", query = {"OrderCodes", "OrderStatuses", "MinCreatedAt", "MaxCreatedAt", "DefaultLimit", "MaxLimit", "Page", "Limit", "Offset"} },
    ["ids-fulfillment.get_request_adjustments"] = { method = "GET", url = "https://api.idsfulfillment.com/request/adjustments", query = {"StockAdjustmentIDs", "StatusCodeBlacklist", "Warehouse", "CustomerNumber"} },
    ["ids-fulfillment.get_request_adjustments_preview"] = { method = "GET", url = "https://api.idsfulfillment.com/request/adjustments/preview", query = {"StockAdjustmentIDs", "StatusCodeBlacklist", "Warehouse", "CustomerNumber"} },
    ["ids-fulfillment.get_request_adjustments_stockAdjustmentID"] = { method = "GET", url = "https://api.idsfulfillment.com/request/adjustments/{stockAdjustmentID}", path = {"stockAdjustmentID"} },
    ["ids-fulfillment.get_request_items"] = { method = "GET", url = "https://api.idsfulfillment.com/request/items", query = {"ItemCodes", "MinCreatedAt", "MaxCreatedAt", "SearchTerm", "SentToWms", "Limit", "PageSize", "PageNumber"} },
    ["ids-fulfillment.get_request_items_itemCode"] = { method = "GET", url = "https://api.idsfulfillment.com/request/items/{itemCode}", path = {"itemCode"} },
    ["ids-fulfillment.post_request_InventoryReceipt"] = { method = "POST", url = "https://api.idsfulfillment.com/request/InventoryReceipt", body = {"Tallies"} },
    ["ids-fulfillment.post_request_Ship"] = { method = "POST", url = "https://api.idsfulfillment.com/request/Ship", body = {"Orders"} },
    ["ids-fulfillment.post_request_Ship_reset"] = { method = "POST", url = "https://api.idsfulfillment.com/request/Ship/reset", query = {"CustomerOrderReferenceNumbers", "Start", "End"} },
    ["ids-fulfillment.post_request_adjustments"] = { method = "POST", url = "https://api.idsfulfillment.com/request/adjustments", body = {"ItemCode", "LotCode", "Status"} },
    ["ids-fulfillment.post_request_items"] = { method = "POST", url = "https://api.idsfulfillment.com/request/items", body = {"Items"} },
  },
}
