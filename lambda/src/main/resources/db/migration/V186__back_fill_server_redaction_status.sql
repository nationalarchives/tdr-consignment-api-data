-- backfill 'ServerRedaction' consignment status
-- use entries in 'FileStatus' table to determine the 'ServerRedaction' consignment status where redaction errors
-- all other consignments where client checks have been completed should use default 'ServerRedaction' status of 'Completed'
-- NOTE: only files which have redacted version(s) have a status of 'Redaction'

DO $$

    DECLARE
        -- select consignments where file(s) have redaction errors
        failedRedactionConsignmentIds uuid[] = ARRAY(
            SELECT DISTINCT ON (f."ConsignmentId") f."ConsignmentId" FROM "FileStatus" fs JOIN "File" f on f."FileId" = fs."FileId" WHERE fs."StatusType" = 'Redaction' AND fs."Value" != 'Success'
        );

        -- select all consignments where client checks completed
        clientChecksCompletedConsignmentIds uuid[] = Array(
            SELECT DISTINCT ON (c."ConsignmentId") c."ConsignmentId" FROM "ConsignmentStatus" cs JOIN "Consignment" c on c."ConsignmentId" = cs."ConsignmentId" WHERE cs."StatusType" = 'ClientChecks' AND cs."Value" != 'InProgress'
        );

        consignmentId uuid;

    BEGIN
        FOREACH consignmentId IN ARRAY failedRedactionConsignmentIds
            LOOP
                -- upsert 'ServerRedaction' status 'CompletedWithIssues'
                INSERT INTO "ConsignmentStatus" ("ConsignmentStatusId", "ConsignmentId", "StatusType", "Value", "CreatedDatetime") VALUES
                    (uuid_generate_v4(), consignmentId, 'ServerRedaction', 'CompletedWithIssues', LOCALTIMESTAMP) ON CONFLICT DO NOTHING;
            END LOOP;
        -- add default 'ServerRedaction' status 'Completed' for all consignments without ServerRedaction status and where client checks have completed
        -- failed redaction consignments already have status set from previous loop use ON CONFLICT to prevent overwriting of previous set status
        FOREACH consignmentId IN ARRAY clientChecksCompletedConsignmentIds
            LOOP
                -- upsert ServerRedaction status Completed
                INSERT INTO "ConsignmentStatus" ("ConsignmentStatusId", "ConsignmentId", "StatusType", "Value", "CreatedDatetime") VALUES
                    (uuid_generate_v4(), consignmentId, 'ServerRedaction', 'Completed', LOCALTIMESTAMP) ON CONFLICT DO NOTHING;
            END LOOP;

END; $$;
