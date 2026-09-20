-- Dynamic Mockups — every call this API accepts, as data.
--
-- GENERATED from https://dynamicmockups.com/openapi.json
-- Published on the vendor's own documentation site (https://dynamicmockups.com).
-- 20 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "dynamic-mockups",
  name = "Dynamic Mockups",
  base = "https://app.dynamicmockups.com/api",
  docs = "https://nango.dev/docs/api-integrations/dynamic-mockups",
  auth = {
    kind = "key",
    header = "x-api-key",
    format = "{token}",
    env = "DYNAMIC_MOCKUPS_API_KEY",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["dynamic-mockups.apply_embroidery_effect"] = { method = "POST", url = "https://app.dynamicmockups.com/api/v1/tools/embroidery" },
    ["dynamic-mockups.create_batch_render"] = { method = "POST", url = "https://app.dynamicmockups.com/api/v1/renders/batch", body = {"export_options", "renders"} },
    ["dynamic-mockups.create_bulk_render"] = { method = "POST", url = "https://app.dynamicmockups.com/api/v1/renders/bulk", body = {"export_options"} },
    ["dynamic-mockups.create_catalog"] = { method = "POST", url = "https://app.dynamicmockups.com/api/v1/catalogs" },
    ["dynamic-mockups.create_mock_anything"] = { method = "POST", url = "https://app.dynamicmockups.com/api/v1/mock-anything/create" },
    ["dynamic-mockups.create_print_files"] = { method = "POST", url = "https://app.dynamicmockups.com/api/v1/renders/print-files", body = {"mockup_uuid", "export_options", "smart_objects"} },
    ["dynamic-mockups.create_render"] = { method = "POST", url = "https://app.dynamicmockups.com/api/v1/renders", body = {"mockup_uuid", "export_label", "export_options", "smart_objects"} },
    ["dynamic-mockups.get_mock_anything_status"] = { method = "GET", url = "https://app.dynamicmockups.com/api/v1/mock-anything/status/{taskId}", path = {"taskId"} },
    ["dynamic-mockups.get_mockup"] = { method = "GET", url = "https://app.dynamicmockups.com/api/v1/mockup/{mockup_uuid}", path = {"mockup_uuid"} },
    ["dynamic-mockups.get_motion_mockup_status"] = { method = "GET", url = "https://app.dynamicmockups.com/api/v1/motion-mockups/status/{requestId}", path = {"requestId"} },
    ["dynamic-mockups.list_catalogs"] = { method = "GET", url = "https://app.dynamicmockups.com/api/v1/catalogs" },
    ["dynamic-mockups.list_collections"] = { method = "GET", url = "https://app.dynamicmockups.com/api/v1/collections" },
    ["dynamic-mockups.list_mock_anything_products"] = { method = "GET", url = "https://app.dynamicmockups.com/api/v1/mock-anything/products" },
    ["dynamic-mockups.list_mock_anything_styles"] = { method = "GET", url = "https://app.dynamicmockups.com/api/v1/mock-anything/styles" },
    ["dynamic-mockups.list_mockup_smart_objects"] = { method = "GET", url = "https://app.dynamicmockups.com/api/v1/mockups/{mockup_uuid}/smartObjects", path = {"mockup_uuid"} },
    ["dynamic-mockups.list_mockups"] = { method = "GET", url = "https://app.dynamicmockups.com/api/v1/mockups" },
    ["dynamic-mockups.list_mockups_extended"] = { method = "GET", url = "https://app.dynamicmockups.com/api/v1/mockups/extended" },
    ["dynamic-mockups.list_motion_mockup_models"] = { method = "GET", url = "https://app.dynamicmockups.com/api/v1/motion-mockups/models" },
    ["dynamic-mockups.submit_motion_mockup"] = { method = "POST", url = "https://app.dynamicmockups.com/api/v1/motion-mockups/submit" },
    ["dynamic-mockups.upload_psd"] = { method = "POST", url = "https://app.dynamicmockups.com/api/v1/psd/upload", body = {"file"} },
  },
}
