-- Add 'AssetId' property to File table
ALTER TABLE "File" ADD COLUMN "AssetId" uuid;

-- Add 'AssetId' field to the FileProperty table
INSERT INTO "FileProperty" ("Name", "Description", "FullName", "Datatype")
    VALUES ('AssetId', 'Asset Id for the record', 'asset_id', 'text');

COMMIT;
