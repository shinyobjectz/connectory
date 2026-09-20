-- Paylocity — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/paylocity.com/2/openapi.json
-- APIs.guru's mirror, matched on paylocity.com. A mirror lags the vendor.
-- 30 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "paylocity",
  name = "Paylocity",
  base = "https://{environment}.paylocity.com",
  docs = "https://nango.dev/docs/api-integrations/paylocity",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "PAYLOCITY_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = { ["environment"] = "PAYLOCITY_ENVIRONMENT" },
  headers = {},
  operations = {
    ["paylocity.add_client_secret"] = { method = "POST", url = "https://{environment}.paylocity.com/api/v2/credentials/secrets", body = {"code"} },
    ["paylocity.add_employee"] = { method = "POST", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees", path = {"companyId"} },
    ["paylocity.add_local_tax"] = { method = "POST", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/localTaxes", path = {"companyId", "employeeId"}, body = {"exemptions", "exemptions2", "filingStatus", "residentPSD", "taxCode", "workPSD"} },
    ["paylocity.add_new_employee_to_web_link"] = { method = "POST", url = "https://{environment}.paylocity.com/api/v2/weblinkstaging/companies/{companyId}/employees/newemployees", path = {"companyId"}, body = {"additionalDirectDeposit", "benefitSetup", "birthDate", "customBooleanFields", "customDateFields", "customDropDownFields", "customNumberFields", "customTextFields", "departmentPosition", "disabilityDescription", "employeeId", "ethnicity", "federalTax", "firstName", "fitwExemptReason", "futaExemptReason", "gender", "homeAddress", "isEmployee943", "isSmoker", "lastName", "localTax", "mainDirectDeposit", "maritalStatus", "medExemptReason", "middleName", "nonPrimaryStateTax", "preferredName", "primaryPayRate", "primaryStateTax", "priorLastName", "salutation", "sitwExemptReason", "ssExemptReason", "ssn", "status", "suffix", "suiExemptReason", "suiState", "taxDistributionCode1099R", "taxForm", "veteranDescription", "webTime", "workAddress", "workEligibility"} },
    ["paylocity.add_or_update_additional_rates"] = { method = "PUT", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/additionalRates", path = {"companyId", "employeeId"}, body = {"changeReason", "costCenter1", "costCenter2", "costCenter3", "effectiveDate", "endCheckDate", "job", "rate", "rateCode", "rateNotes", "ratePer", "shift"} },
    ["paylocity.add_or_update_an_employee_earning"] = { method = "PUT", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/earnings", path = {"companyId", "employeeId"}, body = {"agency", "amount", "annualMaximum", "calculationCode", "costCenter1", "costCenter2", "costCenter3", "earningCode", "effectiveDate", "endDate", "frequency", "goal", "hoursOrUnits", "isSelfInsured", "jobCode", "miscellaneousInfo", "paidTowardsGoal", "payPeriodMaximum", "payPeriodMinimum", "rate", "rateCode", "startDate"} },
    ["paylocity.add_or_update_emergency_contacts"] = { method = "PUT", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/emergencyContacts", path = {"companyId", "employeeId"}, body = {"address1", "address2", "city", "country", "county", "email", "firstName", "homePhone", "lastName", "mobilePhone", "notes", "pager", "primaryPhone", "priority", "relationship", "state", "syncEmployeeInfo", "workExtension", "workPhone", "zip"} },
    ["paylocity.add_or_update_non_primary_state_tax"] = { method = "PUT", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/nonprimaryStateTax", path = {"companyId", "employeeId"}, body = {"amount", "deductionsAmount", "dependentsAmount", "exemptions", "exemptions2", "filingStatus", "higherRate", "otherIncomeAmount", "percentage", "reciprocityCode", "specialCheckCalc", "taxCalculationCode", "taxCode", "w4FormYear"} },
    ["paylocity.add_or_update_primary_state_tax"] = { method = "PUT", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/primaryStateTax", path = {"companyId", "employeeId"}, body = {"amount", "deductionsAmount", "dependentsAmount", "exemptions", "exemptions2", "filingStatus", "higherRate", "otherIncomeAmount", "percentage", "specialCheckCalc", "taxCalculationCode", "taxCode", "w4FormYear"} },
    ["paylocity.add_or_update_sensitive_data"] = { method = "PUT", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/sensitivedata", path = {"companyId", "employeeId"}, body = {"disability", "ethnicity", "gender", "veteran"} },
    ["paylocity.delete_earning_by_earning_code_and_start_date"] = { method = "DELETE", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/earnings/{earningCode}/{startDate}", path = {"companyId", "employeeId", "earningCode", "startDate"} },
    ["paylocity.delete_local_tax_by_tax_code"] = { method = "DELETE", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/localTaxes/{taxCode}", path = {"companyId", "employeeId", "taxCode"} },
    ["paylocity.get_all_company_codes_and_descriptions_by_resource"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/codes/{codeResource}", path = {"companyId", "codeResource"} },
    ["paylocity.get_all_custom_fields_by_category"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/customfields/{category}", path = {"companyId", "category"} },
    ["paylocity.get_all_direct_deposit"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/directDeposit", path = {"companyId", "employeeId"} },
    ["paylocity.get_all_earnings"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/earnings", path = {"companyId", "employeeId"} },
    ["paylocity.get_all_employees"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/", path = {"companyId"}, query = {"pagesize", "pagenumber", "includetotalcount"} },
    ["paylocity.get_all_local_taxes"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/localTaxes", path = {"companyId", "employeeId"} },
    ["paylocity.get_company_specific_open_api_documentation"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/openapi", path = {"companyId"} },
    ["paylocity.get_earning_by_earning_code_and_start_date"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/earnings/{earningCode}/{startDate}", path = {"companyId", "employeeId", "earningCode", "startDate"} },
    ["paylocity.get_earnings_by_earning_code"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/earnings/{earningCode}", path = {"companyId", "employeeId", "earningCode"} },
    ["paylocity.get_employee"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}", path = {"companyId", "employeeId"} },
    ["paylocity.get_local_tax_by_tax_code"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/localTaxes/{taxCode}", path = {"companyId", "employeeId", "taxCode"} },
    ["paylocity.get_sensitive_data"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/sensitivedata", path = {"companyId", "employeeId"} },
    ["paylocity.gets_employee_pay_statement_detail_data_based_on_the_specified_year"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/paystatement/details/{year}", path = {"companyId", "employeeId", "year"}, query = {"pagesize", "pagenumber", "includetotalcount", "codegroup"} },
    ["paylocity.gets_employee_pay_statement_detail_data_based_on_the_specified_year_and_check_date"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/paystatement/details/{year}/{checkDate}", path = {"companyId", "employeeId", "year", "checkDate"}, query = {"pagesize", "pagenumber", "includetotalcount", "codegroup"} },
    ["paylocity.gets_employee_pay_statement_summary_data_based_on_the_specified_year"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/paystatement/summary/{year}", path = {"companyId", "employeeId", "year"}, query = {"pagesize", "pagenumber", "includetotalcount", "codegroup"} },
    ["paylocity.gets_employee_pay_statement_summary_data_based_on_the_specified_year_and_check_date"] = { method = "GET", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/paystatement/summary/{year}/{checkDate}", path = {"companyId", "employeeId", "year", "checkDate"}, query = {"pagesize", "pagenumber", "includetotalcount", "codegroup"} },
    ["paylocity.update_employee"] = { method = "PATCH", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}", path = {"companyId", "employeeId"} },
    ["paylocity.update_or_add_employee_benefit_setup"] = { method = "PUT", url = "https://{environment}.paylocity.com/api/v2/companies/{companyId}/employees/{employeeId}/benefitSetup", path = {"companyId", "employeeId"}, body = {"benefitClass", "benefitClassEffectiveDate", "benefitSalary", "benefitSalaryEffectiveDate", "doNotApplyAdministrativePeriod", "isMeasureAcaEligibility"} },
  },
}
