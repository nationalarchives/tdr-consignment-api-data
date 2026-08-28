DO $$
    DECLARE
        -- Retrieve CMA body uuid
       HmtBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-CMA');
    BEGIN
         -- Use the returned HmtBodyUuid value to insert new series
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), HmtBodyUuid, 'JD 2', 'JD 2', 'JD 2');
    END $$;

--commit changes
COMMIT;
