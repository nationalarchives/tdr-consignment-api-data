-- Update the 'DescriptionAlternate' attribute to large text

UPDATE "DisplayProperties"
SET "Value" = 'large text'
WHERE "PropertyName" = 'DescriptionAlternate' AND "Attribute" = 'ComponentType';

COMMIT;
