-- migration script to correct issues and update items for latest UI work regarding closure and metadata 
-- First update the FileProperty table

UPDATE "FileProperty" SET "PropertyGroup" = 'MandatoryMetadata' WHERE "Name" = 'ClientSideFileLastModifiedDate';
UPDATE "FileProperty" SET "PropertyGroup" = 'MandatoryMetadata'  WHERE "Name" = 'Filename';
UPDATE "FileProperty" SET "PropertyGroup" = 'MandatoryMetadata'  WHERE "Name" = 'ClientSideOriginalFilepath';
UPDATE "FileProperty" SET "PropertyGroup" = 'MandatoryClosure'  WHERE "Name" = 'ClosureType';
UPDATE "FileProperty" SET "PropertyGroup" = 'MandatoryClosure'  WHERE "Name" = 'ClosurePeriod';
UPDATE "FileProperty" SET "PropertyGroup" = 'MandatoryClosure', "Datatype" = 'boolean'  WHERE "Name" = 'DescriptionPublic';
UPDATE "FileProperty" SET "PropertyGroup" = 'MandatoryClosure', "Datatype" = 'boolean'  WHERE "Name" = 'TitlePublic';
UPDATE "FileProperty" SET "PropertyGroup" = 'OptionalClosure'  WHERE "Name" = 'ClosureStartDate';
UPDATE "FileProperty" SET "PropertyGroup" = 'OptionalClosure'  WHERE "Name" = 'DescriptionAlternate';
UPDATE "FileProperty" SET "PropertyGroup" = 'OptionalClosure'  WHERE "Name" = 'TitleAlternate';
UPDATE "FileProperty" SET "PropertyGroup" = 'MandatoryClosure'  WHERE "Name" = 'FoiExemptionAsserted';
UPDATE "FileProperty" SET "PropertyGroup" = 'MandatoryClosure'  WHERE "Name" = 'FoiExemptionCode';

-- update the filepropertyvalues tables adding new group for when TitlePublic is true
UPDATE "FilePropertyValues" SET "Dependencies" = '4'  WHERE "PropertyName" = 'TitlePublic' and "PropertyValue" = 'True';

-- add additonal properties to the dependencies
INSERT INTO "FilePropertyDependencies" ("GroupId", "PropertyName", "Default" )  VALUES 
  ('3','TitlePublic',null),
  ('3','DescriptionPublic',null),
  ('4','TitlePublic',null),
  ('4','DescriptionPublic',null);
  
COMMIT;
