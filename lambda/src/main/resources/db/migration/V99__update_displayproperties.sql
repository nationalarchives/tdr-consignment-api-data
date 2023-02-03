-- Update the 'DescriptionAlternate' attribute to large text
-- Delete 'date_created' from displayProperties

UPDATE "DisplayProperties"
SET "Value" = 'large text'
WHERE "PropertyName" = 'DescriptionAlternate' AND "Attribute" = 'ComponentType';

DELETE FROM "DisplayProperties" WHERE "PropertyName" = 'date_created';

COMMIT;
