-- Add 'ParentReference' property to File table
ALTER TABLE "File"
    ADD COLUMN "ParentReference" text;

-- Move order of 'FileReference' in the fileProperty table

UPDATE "FileProperty"
SET "ExportOrdinal" = 1
WHERE "Name" = 'FileReference';

-- Add 'ParentReference' to FileProperty table

INSERT INTO "FileProperty" ("Name", "Description", "FullName", "PropertyType", "Datatype", "Editable", "MultiValue",
                            "PropertyGroup", "AllowExport", "ExportOrdinal")
VALUES ('ParentReference', NULL, 'parent_reference', 'System', 'text', false, false, 'System', true, 137);

COMMIT;
