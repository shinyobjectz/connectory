-- Personio — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/personio.de/personnel/1.0/openapi.json
-- APIs.guru's mirror, matched on personio.de. A mirror lags the vendor.
-- 13 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "personio",
  name = "Personio",
  base = "https://api.personio.de/v1",
  docs = "https://nango.dev/docs/integrations/all/personio",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "PERSONIO_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["personio.delete_company_attendances_id"] = { method = "DELETE", url = "https://api.personio.de/v1/company/attendances/{id}", path = {"id"} },
    ["personio.delete_company_time_offs_id"] = { method = "DELETE", url = "https://api.personio.de/v1/company/time-offs/{id}", path = {"id"} },
    ["personio.get_company_attendances"] = { method = "GET", url = "https://api.personio.de/v1/company/attendances", query = {"start_date", "end_date", "updated_from", "updated_to", "employees", "limit", "offset"} },
    ["personio.get_company_employees"] = { method = "GET", url = "https://api.personio.de/v1/company/employees" },
    ["personio.get_company_employees_employee_id"] = { method = "GET", url = "https://api.personio.de/v1/company/employees/{employee_id}", path = {"employee_id"} },
    ["personio.get_company_employees_employee_id_profile_picture_width"] = { method = "GET", url = "https://api.personio.de/v1/company/employees/{employee_id}/profile-picture/{width}", path = {"employee_id", "width"} },
    ["personio.get_company_time_off_types"] = { method = "GET", url = "https://api.personio.de/v1/company/time-off-types", query = {"limit", "offset"} },
    ["personio.get_company_time_offs"] = { method = "GET", url = "https://api.personio.de/v1/company/time-offs", query = {"start_date", "end_date", "updated_from", "updated_to", "employees", "limit", "offset"} },
    ["personio.get_company_time_offs_id"] = { method = "GET", url = "https://api.personio.de/v1/company/time-offs/{id}", path = {"id"} },
    ["personio.patch_company_attendances_id"] = { method = "PATCH", url = "https://api.personio.de/v1/company/attendances/{id}", path = {"id"}, body = {"break", "comment", "date", "end_time", "start_time"} },
    ["personio.post_company_attendances"] = { method = "POST", url = "https://api.personio.de/v1/company/attendances", body = {"attendances"} },
    ["personio.post_company_employees"] = { method = "POST", url = "https://api.personio.de/v1/company/employees", body = {"employee[department]", "employee[email]", "employee[first_name]", "employee[gender]", "employee[hire_date]", "employee[last_name]", "employee[position]", "employee[weekly_hours]"} },
    ["personio.post_company_time_offs"] = { method = "POST", url = "https://api.personio.de/v1/company/time-offs", body = {"comment", "employee_id", "end_date", "half_day_end", "half_day_start", "start_date", "time_off_type_id"} },
  },
}
