DO $$
    DECLARE
        -- Retrieve HM Courts and Tribunals Service body uuid
        HmctsBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-HMCTS');
    BEGIN
        -- Use the returned HmctsBodyUuid value to insert new series
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), EcBodyUuid, 'LE 11', 'LE 11', 'LE 11');
    END $$;

--commit changes
COMMIT;
