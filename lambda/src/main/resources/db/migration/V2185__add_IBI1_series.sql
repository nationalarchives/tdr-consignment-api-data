DO $$
    DECLARE
        -- Retrieve IBI body uuid
        IBIBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-IBI');
    BEGIN
        -- Use the returned IBIBodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), IBIBodyUuid, 'IBI 1', 'IBI 1', 'IBI 1');
    END $$;

--commit changes
COMMIT;
