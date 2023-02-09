-- Insert data into the DisplayProperties table

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES
    ('FoiExemptionAsserted', 'AlternativeName', 'Advisory Council Approval', 'text'),
    ('TitleAlternate', 'AlternativeName', 'alternative title', 'text');

COMMIT;
