-- Update the description value of the DisplayProperties

UPDATE "DisplayProperties"
SET "Value" = 'The description will be visible to the public to help explain the content of your file.'
WHERE "PropertyName" = 'description' AND "Attribute" = 'Description';

COMMIT;
