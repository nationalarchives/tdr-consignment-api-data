-- Insert data into the DisplayProperties table

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES
    ('FoiExemptionAsserted', 'AlternativeName', 'Advisory Council approval', 'text'),
    ('TitleAlternate', 'AlternativeName', 'Alternative title', 'text');

COMMIT;
