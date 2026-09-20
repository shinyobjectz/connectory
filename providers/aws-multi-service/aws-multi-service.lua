-- AWS Multi-Service — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/amazonaws.com/service-quotas/2019-06-24/openapi.json
-- APIs.guru's mirror of amazonaws.com:service-quotas, matched on amazonaws.com. A mirror lags the vendor.
-- 19 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "aws-multi-service",
  name = "AWS Multi-Service",
  base = "https://{service}.{region}.amazonaws.com",
  docs = "https://nango.dev/docs/api-integrations/aws-multi-service",
  auth = {
    kind = "basic",
    header = "authorization",
    format = "Bearer {token}",
    env = nil,
    user_env = "AWS_MULTI_SERVICE_USER",
    pass_env = "AWS_MULTI_SERVICE_PASS",
    param = nil,
  },
  config = { ["service"] = "AWS_MULTI_SERVICE_SERVICE", ["region"] = "AWS_MULTI_SERVICE_REGION" },
  headers = {},
  operations = {
    ["aws-multi-service.associate_service_quota_template"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.AssociateServiceQuotaTemplate", header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"} },
    ["aws-multi-service.delete_service_quota_increase_request_from_template"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.DeleteServiceQuotaIncreaseRequestFromTemplate", header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"ServiceCode", "QuotaCode", "AwsRegion"} },
    ["aws-multi-service.disassociate_service_quota_template"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.DisassociateServiceQuotaTemplate", header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"} },
    ["aws-multi-service.get_association_for_service_quota_template"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.GetAssociationForServiceQuotaTemplate", header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"} },
    ["aws-multi-service.get_awsdefault_service_quota"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.GetAWSDefaultServiceQuota", header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"ServiceCode", "QuotaCode"} },
    ["aws-multi-service.get_requested_service_quota_change"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.GetRequestedServiceQuotaChange", header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"RequestId"} },
    ["aws-multi-service.get_service_quota"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.GetServiceQuota", header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"ServiceCode", "QuotaCode"} },
    ["aws-multi-service.get_service_quota_increase_request_from_template"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.GetServiceQuotaIncreaseRequestFromTemplate", header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"ServiceCode", "QuotaCode", "AwsRegion"} },
    ["aws-multi-service.list_awsdefault_service_quotas"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.ListAWSDefaultServiceQuotas", query = {"MaxResults", "NextToken"}, header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"ServiceCode", "NextToken", "MaxResults"} },
    ["aws-multi-service.list_requested_service_quota_change_history"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.ListRequestedServiceQuotaChangeHistory", query = {"MaxResults", "NextToken"}, header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"ServiceCode", "Status", "NextToken", "MaxResults"} },
    ["aws-multi-service.list_requested_service_quota_change_history_by_quota"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.ListRequestedServiceQuotaChangeHistoryByQuota", query = {"MaxResults", "NextToken"}, header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"ServiceCode", "QuotaCode", "Status", "NextToken", "MaxResults"} },
    ["aws-multi-service.list_service_quota_increase_requests_in_template"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.ListServiceQuotaIncreaseRequestsInTemplate", query = {"MaxResults", "NextToken"}, header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"ServiceCode", "AwsRegion", "NextToken", "MaxResults"} },
    ["aws-multi-service.list_service_quotas"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.ListServiceQuotas", query = {"MaxResults", "NextToken"}, header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"ServiceCode", "NextToken", "MaxResults"} },
    ["aws-multi-service.list_services"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.ListServices", query = {"MaxResults", "NextToken"}, header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"NextToken", "MaxResults"} },
    ["aws-multi-service.list_tags_for_resource"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.ListTagsForResource", header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"ResourceARN"} },
    ["aws-multi-service.put_service_quota_increase_request_into_template"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.PutServiceQuotaIncreaseRequestIntoTemplate", header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"QuotaCode", "ServiceCode", "AwsRegion", "DesiredValue"} },
    ["aws-multi-service.request_service_quota_increase"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.RequestServiceQuotaIncrease", header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"ServiceCode", "QuotaCode", "DesiredValue"} },
    ["aws-multi-service.tag_resource"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.TagResource", header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"ResourceARN", "Tags"} },
    ["aws-multi-service.untag_resource"] = { method = "POST", url = "https://{service}.{region}.amazonaws.com/#X-Amz-Target=ServiceQuotasV20190624.UntagResource", header = {"X-Amz-Content-Sha256", "X-Amz-Date", "X-Amz-Algorithm", "X-Amz-Credential", "X-Amz-Security-Token", "X-Amz-Signature", "X-Amz-SignedHeaders", "X-Amz-Target"}, body = {"ResourceARN", "TagKeys"} },
  },
}
