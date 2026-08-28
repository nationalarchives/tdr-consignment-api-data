DO $$
    DECLARE
        -- Retrieve CMA body uuid
       CmaBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-CMA');
    BEGIN
         -- Use the returned CmaBodyUuid value to insert new series
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), CmaBodyUuid, 'JD 2', 'JD 2', 'JD 2');
    END $$;

--commit changes
COMMIT;
