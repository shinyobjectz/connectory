-- Xero — every call this API accepts, as data.
--
-- GENERATED from https://api.apis.guru/v2/specs/xero.com/xero_files/2.9.4/openapi.json
-- APIs.guru's mirror of xero.com:xero_files, matched on xero.com. A mirror lags the vendor.
-- 16 operations · do not edit
--
-- The credential is never in here. `auth.env` names an environment variable; the value
-- stays in the environment, which is what makes this file safe to publish.
return {
  provider = "xero",
  name = "Xero",
  base = "https://api.xero.com",
  docs = "https://nango.dev/docs/api-integrations/xero",
  auth = {
    kind = "oauth",
    header = "authorization",
    format = "Bearer {token}",
    env = "XERO_TOKEN",
    user_env = nil,
    pass_env = nil,
    param = nil,
  },
  config = {},
  headers = {},
  operations = {
    ["xero.create_file_association"] = { method = "POST", url = "https://api.xero.com/files.xro/1.0/Files/{FileId}/Associations", path = {"FileId"}, header = {"xero-tenant-id"}, body = {"FileId", "ObjectGroup", "ObjectId", "ObjectType"} },
    ["xero.create_folder"] = { method = "POST", url = "https://api.xero.com/files.xro/1.0/Folders", header = {"xero-tenant-id"}, body = {"Email", "FileCount", "Id", "IsInbox", "Name"} },
    ["xero.delete_file"] = { method = "DELETE", url = "https://api.xero.com/files.xro/1.0/Files/{FileId}", path = {"FileId"}, header = {"xero-tenant-id"} },
    ["xero.delete_file_association"] = { method = "DELETE", url = "https://api.xero.com/files.xro/1.0/Files/{FileId}/Associations/{ObjectId}", path = {"FileId", "ObjectId"}, header = {"xero-tenant-id"} },
    ["xero.delete_folder"] = { method = "DELETE", url = "https://api.xero.com/files.xro/1.0/Folders/{FolderId}", path = {"FolderId"}, header = {"xero-tenant-id"} },
    ["xero.get_associations_by_object"] = { method = "GET", url = "https://api.xero.com/files.xro/1.0/Associations/{ObjectId}", path = {"ObjectId"}, header = {"xero-tenant-id"} },
    ["xero.get_file"] = { method = "GET", url = "https://api.xero.com/files.xro/1.0/Files/{FileId}", path = {"FileId"}, header = {"xero-tenant-id"} },
    ["xero.get_file_associations"] = { method = "GET", url = "https://api.xero.com/files.xro/1.0/Files/{FileId}/Associations", path = {"FileId"}, header = {"xero-tenant-id"} },
    ["xero.get_file_content"] = { method = "GET", url = "https://api.xero.com/files.xro/1.0/Files/{FileId}/Content", path = {"FileId"}, header = {"xero-tenant-id"} },
    ["xero.get_files"] = { method = "GET", url = "https://api.xero.com/files.xro/1.0/Files", query = {"pagesize", "page", "sort"}, header = {"xero-tenant-id"} },
    ["xero.get_folder"] = { method = "GET", url = "https://api.xero.com/files.xro/1.0/Folders/{FolderId}", path = {"FolderId"}, header = {"xero-tenant-id"} },
    ["xero.get_folders"] = { method = "GET", url = "https://api.xero.com/files.xro/1.0/Folders", query = {"sort"}, header = {"xero-tenant-id"} },
    ["xero.get_inbox"] = { method = "GET", url = "https://api.xero.com/files.xro/1.0/Inbox", header = {"xero-tenant-id"} },
    ["xero.update_file"] = { method = "PUT", url = "https://api.xero.com/files.xro/1.0/Files/{FileId}", path = {"FileId"}, header = {"xero-tenant-id"}, body = {"CreatedDateUtc", "FolderId", "Id", "MimeType", "Name", "Size", "UpdatedDateUtc", "User"} },
    ["xero.update_folder"] = { method = "PUT", url = "https://api.xero.com/files.xro/1.0/Folders/{FolderId}", path = {"FolderId"}, header = {"xero-tenant-id"}, body = {"Email", "FileCount", "Id", "IsInbox", "Name"} },
    ["xero.upload_file"] = { method = "POST", url = "https://api.xero.com/files.xro/1.0/Files", query = {"FolderId"}, header = {"xero-tenant-id"}, body = {"body", "filename", "mimeType", "name"} },
  },
}
