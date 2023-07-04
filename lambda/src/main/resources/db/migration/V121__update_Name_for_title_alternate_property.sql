-- Update the displayProperties


UPDATE "DisplayProperties"
SET "Value" = 'Add alternative title without the file extension'
WHERE "PropertyName" = 'TitleAlternate' AND "Attribute" = 'Name';


COMMIT;
