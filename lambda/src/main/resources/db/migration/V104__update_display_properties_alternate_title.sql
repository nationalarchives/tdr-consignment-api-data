UPDATE "DisplayProperties"
SET "Value" = 'This title will be visible to the public during the closure period.'
WHERE "PropertyName" = 'TitleAlternate'
  AND "Attribute" = 'Description';

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES
    ('DescriptionAlternate', 'Description', 'This description will be visible to the public during the closure period.', 'text');

COMMIT;
