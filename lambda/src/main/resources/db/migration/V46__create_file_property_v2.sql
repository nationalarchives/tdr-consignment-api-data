CREATE TABLE IF NOT EXISTS public."FilePropertyV2"
(
    "Name"              text          NOT NULL,
    "Description"       text,
    "Fullname"          text,
    "CreatedDatetime"   timestamptz,
    "ModifiedDatetime"  timestamptz,
    "UserId"            uuid,
    "PropertyType"      text,
    "Datatype"          text,
    "Editable"          boolean,
    "MutliValue"        boolean,
    "PropertyGroup"     text
);

ALTER TABLE public."FilePropertyV2"
    ADD CONSTRAINT "FilePropertyV2_pkey"
        PRIMARY KEY ("Name");

INSERT INTO "FilePropertyV2" ("Name","Description","Fullname","CreatedDatetime","ModifiedDatetime","UserId","PropertyType","Datatype","Editable","MutliValue","PropertyGroup")
VALUES
    ('ClientSideOriginalFilepath','The original filepath','Filepath','2021-02-11 08:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'System','text',false,false,NULL),
    ('HeldBy',NULL,'Held By','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Defined','text',false,false,'MandatoryMetadata'),
    ('LegalStatus',NULL,'Legal Status','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Defined','text',true,false,'MandatoryMetadata'),
    ('FoiExemptionCode',NULL,'Foi Exemption Code','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Defined','text',true,true,'Closure'),
    ('ClosureType',NULL,'Closure Type','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Defined','text',true,false,'Closure'),
    ('ClosurePeriod',NULL,'Closure Period','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Supplied','integer',true,false,'Closure'),
    ('ClosureStartDate',NULL,'Closure Start Date','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Supplied','datetime',true,false,'Closure'),
    ('DescriptionAlternate',NULL,'Description Alternate','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Supplied','text',true,false,'Closure'),
    ('DescriptionPublic',NULL,'Description Public','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Supplied','text',true,false,'Closure'),
    ('TitleAlternate',NULL,'Title Alternate','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Supplied','text',true,false,'Closure'),
    ('TitlePublic',NULL,'Title Public','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Supplied','text',true,false,'Closure'),
    ('RightsCopyright',NULL,'Rights Copyright','2021-02-11 08:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Defined','text',true,false,'MandatoryMetadata'),
    ('Language',NULL,'Language','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Defined','text',true,false,'OptionalMetadata'),
    ('FoiExemptionAsserted',NULL,'Foi Exemption Asserted','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Supplied','datetime',true,false,'Closure'),
    ('ClientSideFileLastModifiedDate','The last modified date of the file','Last Modified Date','2021-02-11 08:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'System','datetime',false,false,NULL),
    ('ClientSideFileSize','The size of the file','File Size','2021-02-11 08:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'System','decimal',false,false,NULL),
    ('SHA256ClientSideChecksum','The sha256 checksum, generated on the client side','Checksum','2021-02-11 08:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'System','text',false,false,'MandatoryMetadata'),
    ('SHA256ServerSideChecksum','The SHA-256 checksum calculated after upload','Server Checksum','2021-02-11 08:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'System','text',false,false,'System'),
    ('date_created',NULL,'Date Created','2021-02-11 08:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Supplied','datetime',true,false,'OptionalMetadata'),
    ('Filename',NULL,'Filename','2021-02-11 08:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'System','text',false,false,NULL),
    ('date_range',NULL,'Date range','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Supplied','text',true,false,'OptionalMetadata'),
    ('description',NULL,'Description','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Supplied','text',true,false,'OptionalMetadata'),
    ('end_date',NULL,'End date','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Supplied','datetime',true,false,'OptionalMetadata'),
    ('start_date',NULL,'Start date','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Supplied','datetime',true,false,'OptionalMetadata'),
    ('file_name_language',NULL,'File name language','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Supplied','text',true,false,'OptionalMetadata'),
    ('file_name_translation',NULL,'File name translation','2021-02-11 09:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Supplied','text',true,false,'OptionalMetadata'),
    ('file_name_translation_language',NULL,'File name translation language','2021-02-11 08:07:18.000 +0000',NULL,cast('eed88948-daf0-49c6-b511-c61dc6930433' as uuid),'Supplied','text',true,false,'OptionalMetadata');

COMMIT;
