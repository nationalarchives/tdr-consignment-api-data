-- Add related_material property

INSERT INTO "FileProperty" ("Name", "Description", "FullName", "PropertyType", "Datatype", "Editable", "MultiValue",
                            "PropertyGroup", "AllowExport", "ExportOrdinal")
VALUES ('RelatedMaterial', NULL, 'related_material', 'Supplied', 'text', true, false, 'OptionalMetadata', true, 160);

COMMIT;
