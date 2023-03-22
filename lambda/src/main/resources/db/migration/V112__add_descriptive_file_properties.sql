-- Add former_reference_department and creating_body properties
-- Add or update display properties for file_name_translation, former_reference_department and creating_body properties

INSERT INTO "FileProperty" ("Name", "Description", "FullName", "PropertyType", "Datatype", "Editable", "MultiValue",
                            "PropertyGroup", "AllowExport", "ExportOrdinal")
VALUES ('former_reference_department', NULL, 'Former reference', 'Supplied', 'text', true, false, 'OptionalMetadata', true, 140),
       ('creating_body', NULL, 'Creating body', 'Defined', 'text', true, false, 'OptionalMetadata', true, 145);


UPDATE "DisplayProperties"
SET "Value" = 'true'
WHERE "PropertyName" = 'file_name_translation'
  AND "Attribute" = 'Active';

UPDATE "DisplayProperties"
SET "Value" = 'Translated title of record'
WHERE "PropertyName" = 'file_name_translation'
  AND "Attribute" = 'Name';

UPDATE "DisplayProperties"
SET "Value" = 'small text'
WHERE "PropertyName" = 'file_name_translation'
  AND "Attribute" = 'ComponentType';

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES ('file_name_translation', 'Ordinal', '25', 'integer'),
       ('former_reference_department', 'Name', 'Former reference', 'text'),
       ('former_reference_department', 'Description',
        'Add the reference provided by the department for when it was holding the record.', 'text'),
       ('former_reference_department', 'ComponentType', 'small text', 'text'),
       ('former_reference_department', 'PropertyType', 'Descriptive', 'text'),
       ('former_reference_department', 'Active', 'true', 'boolean'),
       ('former_reference_department', 'Datatype', 'text', 'text'),
       ('former_reference_department', 'Editable', 'true', 'boolean'),
       ('former_reference_department', 'MultiValue', 'false', 'boolean'),
       ('former_reference_department', 'Ordinal', '30', 'integer'),
       ('former_reference_department', 'Summary', 'Former reference', 'text'),
       ('creating_body', 'Name', 'Creating body', 'text'),
       ('creating_body', 'Description',
        'Add where the record is inherited from if it is different to the transferring body.', 'text'),
       ('creating_body', 'ComponentType', 'select', 'text'),
       ('creating_body', 'PropertyType', 'Descriptive', 'text'),
       ('creating_body', 'Active', 'false', 'boolean'),
       ('creating_body', 'Datatype', 'text', 'text'),
       ('creating_body', 'Editable', 'true', 'boolean'),
       ('creating_body', 'MultiValue', 'false', 'boolean'),
       ('creating_body', 'Ordinal', '35', 'integer'),
       ('creating_body', 'Summary', 'Creating body', 'text'),
       ('end_date', 'Summary', 'Date of the record', 'text');

COMMIT;
