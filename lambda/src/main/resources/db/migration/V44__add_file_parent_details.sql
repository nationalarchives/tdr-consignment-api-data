-- Alter the table and add the columns to support storing folder structure
-- Subsequent migration will make make the information required once it is being added by the API
ALTER TABLE "File" ADD COLUMN "FileType" text,
    ADD COLUMN "FileName" text,
    ADD COLUMN "ParentId" uuid
;

-- save the changes
COMMIT ;

-- Only two types of file
ALTER TABLE "File" ADD CONSTRAINT
    "chk_FileType" CHECK ("FileType" IN ('File', 'Folder'));

-- save the changes
COMMIT ;
