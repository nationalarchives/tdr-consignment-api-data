-- Add 'UUID' to FileProperty table

INSERT INTO "FileProperty" ("Name", "Description", "FullName", "PropertyType", "Datatype", "Editable", "MultiValue",
                            "PropertyGroup", "AllowExport", "ExportOrdinal")
VALUES ('UUID', 'FiledID value for the record', 'UUID', 'System', 'text', false, false, 'System', true, 150);

COMMIT;
