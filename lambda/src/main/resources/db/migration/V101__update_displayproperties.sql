-- Update the 'Active' attribute to true for 'end_date'
-- Update the 'Name' attribute for 'end_date'
-- Insert 'Group' & 'Ordinal' attribute for 'end_date'

UPDATE "DisplayProperties"
SET "Value" = 'true'
WHERE "PropertyName" = 'end_date' AND "Attribute" = 'Active';

UPDATE "DisplayProperties"
SET "Value" = 'Date of the record'
WHERE "PropertyName" = 'end_date' AND "Attribute" = 'Name';

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES
    ('end_date', 'Group', '1', 'text'),
    ('end_date', 'Ordinal', 15, 'integer');

COMMIT;
