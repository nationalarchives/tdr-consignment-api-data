-- Script to update DescriptionPublic nomenclature to DescriptionClosed within the Propertyxx Group of tables
-- First we have to disable constraints as Update cascade has not been set on them

ALTER TABLE "FileMetadata" DISABLE TRIGGER ALL;
ALTER TABLE "FileProperty" DISABLE TRIGGER ALL;
ALTER TABLE "FilePropertyValues" DISABLE TRIGGER ALL;
ALTER TABLE "FilePropertyDependencies" DISABLE TRIGGER ALL;

COMMIT;

-- Next we have update the main FileProperty Table values
UPDATE public."FileProperty"
SET "Name" = 'DescriptionClosed'
WHERE "Name" = 'DescriptionPublic';

COMMIT;

-- Next we update FileMetadata PropertyName and Reverse the existing data value
-- Current only the default 'True' has been set so we only need to update all values to False
UPDATE public."FileMetadata"
SET "PropertyName" = 'DescriptionClosed', "Value" = 'False'
WHERE "PropertyName" = 'DescriptionPublic';

COMMIT;

-- Next we update and reverse the logic in FilePropertyValues
UPDATE public."FilePropertyValues"
SET "PropertyName" = 'DescriptionClosed', "PropertyValue" = 'True'
WHERE "PropertyName" = 'DescriptionPublic' and "PropertyValue" = 'False';

UPDATE public."FilePropertyValues"
SET "PropertyName" = 'DescriptionClosed', "PropertyValue" = 'False'
WHERE "PropertyName" = 'DescriptionPublic' and "PropertyValue" = 'True';

COMMIT;

-- Next we update FilePropertyDependencies
UPDATE public."FilePropertyDependencies"
SET "PropertyName" = 'DescriptionClosed'
WHERE "PropertyName" = 'DescriptionPublic' ;

-- Enable all the constraints once again
ALTER TABLE "FileMetadata" ENABLE TRIGGER ALL;
ALTER TABLE "FileProperty" ENABLE TRIGGER ALL;
ALTER TABLE "FilePropertyValues" ENABLE TRIGGER ALL;
ALTER TABLE "FilePropertyDependencies" ENABLE TRIGGER ALL;

COMMIT;
