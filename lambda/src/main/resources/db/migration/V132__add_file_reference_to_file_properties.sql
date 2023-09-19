-- Add file reference property

INSERT INTO "FileProperty" ("Name", "Description", "FullName", "PropertyType", "Datatype", "Editable", "MultiValue",
                            "PropertyGroup", "AllowExport", "ExportOrdinal")
VALUES ('FileReference', NULL, 'file_reference', 'System', 'text', false, false, 'System', true, 137);

COMMIT;
