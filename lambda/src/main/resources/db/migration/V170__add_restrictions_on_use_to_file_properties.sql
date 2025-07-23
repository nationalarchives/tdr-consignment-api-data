-- Add restrictions_on_use property

INSERT INTO "FileProperty" ("Name", "Description", "FullName", "PropertyType", "Datatype", "Editable", "MultiValue",
                            "PropertyGroup", "AllowExport", "ExportOrdinal")
VALUES ('RestrictionsOnUse', NULL, 'restrictions_on_use', 'Supplied', 'text', true, false, 'OptionalMetadata', false, 155);

COMMIT;
