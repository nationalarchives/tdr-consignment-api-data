-- UPDATE Ordinal for 'DescriptionClosed'
-- INSERT Ordinal for 'DescriptionAlternate' & 'TitleAlternate'

UPDATE "DisplayProperties"
SET "Value" = 35
WHERE "PropertyName" = 'DescriptionClosed' AND "Attribute" = 'Ordinal';

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES
    ('DescriptionAlternate', 'Ordinal', 40, 'integer'),
    ('TitleAlternate', 'Ordinal', 30, 'integer');

COMMIT;
