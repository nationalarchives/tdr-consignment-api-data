-- Add restrictions_on_use property

INSERT INTO "FileProperty" ("Name", "Description", "FullName", "PropertyType", "Datatype", "Editable", "MultiValue",
                            "PropertyGroup", "AllowExport", "ExportOrdinal")
VALUES ('EvidenceProvidedBy', NULL, 'evidence_provided_by', 'Supplied', 'text', true, false, 'OptionalMetadata', false, 165);

COMMIT;
