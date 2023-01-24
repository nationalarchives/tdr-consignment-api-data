-- Update the name for the ClosureType property

UPDATE "DisplayProperties"
SET "Value" = 'Closure status'
WHERE "PropertyName" = 'ClosureType' AND "Attribute" = 'Name';

COMMIT;
