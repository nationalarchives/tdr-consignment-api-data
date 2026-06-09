DO $$
    DECLARE
        -- Retrieve EC body uuid
       EcBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-EC');
    BEGIN
         -- Use the returned EcBodyUuid value to insert new series
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), EcBodyUuid, 'EC 14', 'EC 14', 'EC 14');
    END $$;

--commit changes
COMMIT;
