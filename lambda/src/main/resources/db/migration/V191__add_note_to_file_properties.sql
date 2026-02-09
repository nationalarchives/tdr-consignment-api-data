-- Add restrictions_on_use property

INSERT INTO "FileProperty" ("Name", "Description", "FullName", "PropertyType", "Datatype", "Editable", "MultiValue",
                            "PropertyGroup", "AllowExport", "ExportOrdinal")
VALUES ('Note', NULL, 'note', 'Supplied', 'text', true, false, 'OptionalMetadata', false, 170);

COMMIT;
