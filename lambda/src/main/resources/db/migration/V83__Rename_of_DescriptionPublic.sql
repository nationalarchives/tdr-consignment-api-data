-- Script to update DescriptionPublic nomenclature to DescriptionClosed within the Propertyxx Group of tables
-- First we have to drop constraints as Update cascade has not been set on them

ALTER TABLE "FileMetadata" DROP CONSTRAINT "FileMetadata_Consignment_fkey";
ALTER TABLE "FileMetadata" DROP CONSTRAINT "FileMetadata_PropertyName";
ALTER TABLE "FilePropertyValues" DROP CONSTRAINT "FilePropertyValues_FileProperty_PropertyName_fkey";
ALTER TABLE "FilePropertyDependencies" DROP CONSTRAINT "FilePropertyDependencies_PropertyName_FileProperty_fkey";

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

-- Create all the constraints once again
-- Whilst tidying up naming conventions

ALTER TABLE "FileMetadata"
  ADD CONSTRAINT "FileMetadata_File_FileId_fkey" FOREIGN KEY ("FileId")
  REFERENCES "File" ("FileId")
  ON UPDATE NO ACTION
  ON DELETE NO ACTION;


ALTER TABLE "FileMetadata"
  ADD CONSTRAINT "FileMetadata_FileProperty_PropertyName_fkey" FOREIGN KEY ("PropertyName")
  REFERENCES "FileProperty" ("Name")
  ON UPDATE NO ACTION
  ON DELETE NO ACTION;

ALTER TABLE "FilePropertyValues"
  ADD CONSTRAINT "FilePropertyValues_FileProperty_PropertyName_fkey" FOREIGN KEY ("PropertyName")
  REFERENCES "FileProperty" ("Name")
  ON UPDATE NO ACTION
  ON DELETE NO ACTION;

ALTER TABLE "FilePropertyDependencies"
  ADD CONSTRAINT "FilePropertyDependencies_FileProperty_PropertyName_fkey" FOREIGN KEY ("PropertyName")
  REFERENCES "FileProperty" ("Name")
  ON UPDATE NO ACTION
  ON DELETE NO ACTION;

COMMIT;
