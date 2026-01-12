-- ensure 'ClientChecks' status value reflects the 'ServerRedaction' status

DO $$

    DECLARE
        -- select consignments with ServerRedaction failures
        failedRedactionConsignmentIds uuid[] = ARRAY(
            SELECT "ConsignmentId" FROM "ConsignmentStatus" WHERE "StatusType" = 'ServerRedaction' AND "Value" = 'CompletedWithIssues'
        );

        consignmentId uuid;

    BEGIN
        FOREACH consignmentId IN ARRAY failedRedactionConsignmentIds
            LOOP
                -- update 'ClientChecks' status value to reflect 'ServerRedaction' failure
                UPDATE "ConsignmentStatus" SET "Value" = 'CompletedWithIssues', "ModifiedDatetime" = LOCALTIMESTAMP WHERE "ConsignmentId" = consignmentId AND "StatusType" = 'ClientChecks';
            END LOOP;

END; $$;
