-- Update Name for the 'TitleAlternate' property

UPDATE "DisplayProperties"
SET "Value" = 'Add alternative title without the file extension'
WHERE "PropertyName" = 'TitleAlternate' AND "Attribute" = 'Name';

COMMIT;
