UPDATE "FileMetadata" fm SET "PropertyName" = fp."Name" FROM "FileProperty" fp WHERE fm."PropertyId" = fp."PropertyId";
ALTER TABLE "FileMetadata" DROP COLUMN "PropertyId";
ALTER TABLE "FileProperty" DROP COLUMN "PropertyId";
ALTER TABLE "FileMetadata" ALTER COLUMN "PropertyName" SET NOT NULL;

INSERT INTO "FileMetadata"
SELECT uuid_generate_v4(), f."FileId", "OriginalPath", cfm."Datetime", "UserId", 'ClientSideOriginalFilepath' 
FROM "ClientFileMetadata" cfm JOIN "File" f on f."FileId" = cfm."FileId";

INSERT INTO "FileMetadata"
SELECT uuid_generate_v4(), f."FileId", "LastModified", cfm."Datetime", "UserId", 'ClientSideFileLastModifiedDate' 
FROM "ClientFileMetadata" cfm JOIN "File" f on f."FileId" = cfm."FileId";

INSERT INTO "FileMetadata"
SELECT uuid_generate_v4(), f."FileId", "Filesize", cfm."Datetime", "UserId", 'ClientSideFileSize' 
FROM "ClientFileMetadata" cfm JOIN "File" f on f."FileId" = cfm."FileId";

INSERT INTO "FileMetadata"
SELECT uuid_generate_v4(), f."FileId", "Checksum", cfm."Datetime", "UserId", 'SHA256ClientSideChecksum' 
FROM "ClientFileMetadata" cfm JOIN "File" f on f."FileId" = cfm."FileId";

DROP TABLE "ClientFileMetadata";

