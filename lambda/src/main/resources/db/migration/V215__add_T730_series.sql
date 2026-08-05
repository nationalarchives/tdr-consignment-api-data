DO $$
    DECLARE
        -- Retrieve HMT body uuid
       HmtBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-T');
    BEGIN
         -- Use the returned HmtBodyUuid value to insert new series
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), HmtBodyUuid, 'T 730', 'T 730', 'T 730');
    END $$;

--commit changes
COMMIT;
