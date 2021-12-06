-- Add index to 'File' table to support call to retrieving consignment info for individual files
CREATE INDEX File_ConsignmentId_FileId_Index ON "File" ("ConsignmentId", "FileId" ) ;