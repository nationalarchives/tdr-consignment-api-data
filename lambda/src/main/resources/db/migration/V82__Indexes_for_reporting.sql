-- Create Indexes to support reporting queries
CREATE INDEX AVMetadata_FileId_idx ON "AVMetadata" ("FileId" );
CREATE INDEX Filemetadata_FileId_PropertyName_idx ON "FileMetadata" ("FileId", "PropertyName");
CREATE INDEX FFIDMetadataMatches_FFIDMetadataId_idx ON "FFIDMetadataMatches" ("FFIDMetadataId");
CREATE INDEX FFIDMetadata_FileId_FFIDMetadataId_idx ON "FFIDMetadata" ("FileId","FFIDMetadataId");
CREATE INDEX FileStatus_FileId_StatusType_idx ON "FileStatus" ("FileId", "StatusType");
CREATE INDEX Consignment_ConsignmentId_ConsignmentReference_idx ON "Consignment" ("ConsignmentId", "ConsignmentReference");
CREATE INDEX File_ConsignmentId_FileType_FileId_idx ON "File" ("ConsignmentId","FileType","FileId");