-- Insert default 'NotEntered' value for 'ClosureMetadata' and 'DescriptiveMetadata' file statuses

DO $$

    DECLARE
        closureMetadataFileIds uuid[] = ARRAY(
            SELECT DISTINCT "FileId" FROM "FileStatus" WHERE NOT EXISTS (SELECT * FROM "FileStatus" WHERE "StatusType" = 'ClosureMetadata')
        );
        descriptiveMetadataFileIds uuid[] = ARRAY(
            SELECT DISTINCT "FileId" FROM "FileStatus" WHERE NOT EXISTS (SELECT * FROM "FileStatus" WHERE "StatusType" = 'DescriptiveMetadata')
        );

        fileId uuid;

    BEGIN
        FOREACH fileId IN ARRAY closureMetadataFileIds
            LOOP
                -- insert default 'ClosureMetadata' status 'NotEntered'
                INSERT INTO "FileStatus" ("FileStatusId", "FileId", "StatusType", "Value", "CreatedDatetime") VALUES
                    (uuid_generate_v4(), fileId, 'ClosureMetadata', 'NotEntered', LOCALTIMESTAMP);
            END LOOP;

        FOREACH fileId IN ARRAY descriptiveMetadataFileIds
            LOOP
                -- insert default 'DescriptiveMetadata' status 'NotEntered'
                INSERT INTO "FileStatus" ("FileStatusId", "FileId", "StatusType", "Value", "CreatedDatetime") VALUES
                    (uuid_generate_v4(), fileId, 'DescriptiveMetadata', 'NotEntered', LOCALTIMESTAMP);
            END LOOP;

END; $$;
