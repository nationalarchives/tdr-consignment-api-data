-- Add index in tables File FileMetadata and FileStatus to improve getConsignment query 

CREATE INDEX IF NOT EXISTS file_allfields_idx 
ON public."File" 
USING btree ("ConsignmentId", "FileId", "FileType", "FileName", "ParentId", "UserId", "Datetime", "ChecksumMatches");

CREATE INDEX IF NOT EXISTS filemetadata_allfields_idx 
ON public."FileMetadata" 
USING btree ("FileId", "PropertyName", "Value", "MetadataId", "Datetime", "UserId");

CREATE INDEX IF NOT EXISTS filestatus_allfields_idx 
ON public."FileStatus" 
USING btree ("FileId", "StatusType", "Value", "FileStatusId", "CreatedDatetime");

COMMIT;
