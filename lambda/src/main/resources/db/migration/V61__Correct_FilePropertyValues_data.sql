-- First correct the mistake in the data 
UPDATE "FilePropertyValues" SET "Dependencies" = null  WHERE "PropertyName" = 'TitlePublic' and "PropertyValue" = 'True';
-- Add the correct value for the correct property
UPDATE "FilePropertyValues" SET "Dependencies" = '4'  WHERE "PropertyName" = 'ClosureType' and "PropertyValue" = 'open_on_transfer';

Commit;
