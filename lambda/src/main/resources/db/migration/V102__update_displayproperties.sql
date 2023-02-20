-- Update descriptions for 'end_date' & 'ClosureStartDate'

UPDATE "DisplayProperties"
SET "Value" = 'The date that the most recent change was made to this record.'
WHERE "PropertyName" = 'end_date' AND "Attribute" = 'Description';

UPDATE "DisplayProperties"
SET "Value" = 'This is the date the closure period begins.'
WHERE "PropertyName" = 'ClosureStartDate' AND "Attribute" = 'Description';

COMMIT;
