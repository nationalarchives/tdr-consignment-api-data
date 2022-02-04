ALTER TABLE "FileProperty"
    ADD COLUMN "FullName"          text,
    ADD COLUMN "CreatedDatetime"   timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP,
    ADD COLUMN "ModifiedDatetime"  timestamptz,
    ADD COLUMN "PropertyType"      text,
    ADD COLUMN "Datatype"          text,
    ADD COLUMN "Editable"          boolean,
    ADD COLUMN "MutliValue"        boolean,
    ADD COLUMN "PropertyGroup"     text,
    DROP COLUMN "Shortname";

    UPDATE "FileProperty" SET "FullName" = 'Filepath', "PropertyType" = 'System', "Datatype" = 'text', "Editable" = false, "MutliValue" = false, "PropertyGroup" = Null
    WHERE "Name" = 'ClientSideOriginalFilepath';
    UPDATE "FileProperty" SET "FullName" = 'Foi Exemption Code', "PropertyType" = 'Defined', "Datatype" = 'text', "Editable" = true, "MutliValue" = true, "PropertyGroup" = 'Closure'
    WHERE "Name" = 'FoiExemptionCode';
    UPDATE "FileProperty" SET "FullName" = 'Language', "PropertyType" = 'Defined', "Datatype" = 'text', "Editable" = true, "MutliValue" = false, "PropertyGroup" = 'OptionalMetadata'
    WHERE "Name" = 'Language';
    UPDATE "FileProperty" SET "FullName" = 'Held By', "PropertyType" = 'Defined', "Datatype" = 'text', "Editable" = false, "MutliValue" = false, "PropertyGroup" = 'MandatoryMetadata'
    WHERE "Name" = 'HeldBy';
    UPDATE "FileProperty" SET "FullName" = 'Legal Status', "PropertyType" = 'Defined', "Datatype" = 'text', "Editable" = true, "MutliValue" = false, "PropertyGroup" = 'MandatoryMetadata'
    WHERE "Name" = 'LegalStatus';
    UPDATE "FileProperty" SET "FullName" = 'Rights Copyright', "PropertyType" = 'Defined', "Datatype" = 'text', "Editable" = true, "MutliValue" = false, "PropertyGroup" = 'MandatoryMetadata'
    WHERE "Name" = 'RightsCopyright';
    UPDATE "FileProperty" SET "FullName" = 'Checksum', "PropertyType" = 'System', "Datatype" = 'text', "Editable" = false, "MutliValue" = false, "PropertyGroup" = 'MandatoryMetadata'
    WHERE "Name" = 'SHA256ClientSideChecksum';
    UPDATE "FileProperty" SET "FullName" = 'File Size', "PropertyType" = 'System', "Datatype" = 'decimal', "Editable" = false, "MutliValue" = false, "PropertyGroup" = NULL
    WHERE "Name" = 'ClientSideFileSize';
    UPDATE "FileProperty" SET "FullName" = 'Last Modified Date', "PropertyType" = 'System', "Datatype" = 'datetime', "Editable" = false, "MutliValue" = false, "PropertyGroup" = NULL
    WHERE "Name" = 'ClientSideFileLastModifiedDate';
    UPDATE "FileProperty" SET "FullName" = 'Server Checksum', "PropertyType" = 'System', "Datatype" = 'text', "Editable" = false, "MutliValue" = false, "PropertyGroup" = 'System'
    WHERE "Name" = 'SHA256ServerSideChecksum';

INSERT INTO "FileProperty" ("Name","Description","FullName","PropertyType","Datatype","Editable","MutliValue","PropertyGroup")
VALUES
    ('ClosureType',NULL,'Closure Type','Defined','text',true,false,'Closure'),
    ('ClosurePeriod',NULL,'Closure Period','Supplied','integer',true,false,'Closure'),
    ('ClosureStartDate',NULL,'Closure Start Date','Supplied','datetime',true,false,'Closure'),
    ('DescriptionAlternate',NULL,'Description Alternate','Supplied','text',true,false,'Closure'),
    ('DescriptionPublic',NULL,'Description Public','Supplied','text',true,false,'Closure'),
    ('TitleAlternate',NULL,'Title Alternate','Supplied','text',true,false,'Closure'),
    ('TitlePublic',NULL,'Title Public','Supplied','text',true,false,'Closure'),
    ('FoiExemptionAsserted',NULL,'Foi Exemption Asserted','Supplied','datetime',true,false,'Closure'),
    ('date_created',NULL,'Date Created','Supplied','datetime',true,false,'OptionalMetadata'),
    ('Filename',NULL,'Filename','System','text',false,false,NULL),
    ('date_range',NULL,'Date range','Supplied','text',true,false,'OptionalMetadata'),
    ('description',NULL,'Description','Supplied','text',true,false,'OptionalMetadata'),
    ('end_date',NULL,'End date','Supplied','datetime',true,false,'OptionalMetadata'),
    ('start_date',NULL,'Start date','Supplied','datetime',true,false,'OptionalMetadata'),
    ('file_name_language',NULL,'File name language','Supplied','text',true,false,'OptionalMetadata'),
    ('file_name_translation',NULL,'File name translation','Supplied','text',true,false,'OptionalMetadata'),
    ('file_name_translation_language',NULL,'File name translation language','Supplied','text',true,false,'OptionalMetadata');

COMMIT;
