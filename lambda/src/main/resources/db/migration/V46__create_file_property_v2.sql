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

COMMIT;
