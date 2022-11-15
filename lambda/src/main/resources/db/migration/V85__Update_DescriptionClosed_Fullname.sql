-- Update the FullName of the DescriptionClosed property

UPDATE "FileProperty"
SET "FullName" = 'Description Closed'
WHERE "Name" = 'DescriptionClosed';

COMMIT;
