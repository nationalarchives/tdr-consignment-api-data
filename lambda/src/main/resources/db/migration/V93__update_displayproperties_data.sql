-- Update the FullName of the DescriptionClosed property

UPDATE "DisplayProperties"
SET "Value" = 'The description will be visible to the public to help explain the content of your file.'
WHERE "PropertyName" = 'description' AND "Attribute" = 'Description';

COMMIT;
