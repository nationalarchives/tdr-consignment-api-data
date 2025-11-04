-- Remove duplicate rows keeping the one with the latest DateTime
DELETE FROM "FileMetadata"
WHERE "MetadataId" IN (
    SELECT "MetadataId"
    FROM (
             SELECT "MetadataId",
                    ROW_NUMBER() OVER (
                        PARTITION BY "FileId", "PropertyName"
                        ORDER BY "Datetime" DESC
                        ) as rn
             FROM "FileMetadata"
         ) t
    WHERE t.rn > 1
);

-- Add unique constraint after removing duplicates
ALTER TABLE "FileMetadata" ADD CONSTRAINT "UniqueFileMetadataFileIdPropertyName" UNIQUE ("FileId", "PropertyName");
