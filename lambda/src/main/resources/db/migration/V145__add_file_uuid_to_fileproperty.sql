-- Add 'UUID' to FileProperty table
-- 'UUID' refers to the 'FileID'

INSERT INTO "FileProperty" ("Name", "Description", "FullName", "PropertyType", "Datatype", "Editable", "MultiValue",
                            "PropertyGroup", "AllowExport", "ExportOrdinal")
VALUES ('UUID', NULL, 'UUID', 'System', 'text', false, false, 'System', true, 150);

COMMIT;
