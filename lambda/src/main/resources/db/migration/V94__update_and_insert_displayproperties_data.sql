-- Update DisplayProperties table

UPDATE "DisplayProperties" SET "Value" = '3' WHERE "PropertyName" = 'DescriptionAlternate' and "Attribute" = 'Group';
UPDATE "DisplayProperties" SET "Value" = '3' WHERE "PropertyName" = 'TitleAlternate' and "Attribute" = 'Group';
UPDATE "DisplayProperties" SET "Value" = 'small text' WHERE "PropertyName" = 'DescriptionAlternate' and "Attribute" = 'ComponentType';

-- Insert new row to DisplayProperties table

INSERT INTO "DisplayProperties" ("PropertyName","Attribute","Value","AttributeType")
VALUES
    ('ClosurePeriod','ComponentType','small text','integer'),
    ('FoiExemptionCode','ComponentType','select','text');

COMMIT;