DO $$
    DECLARE
        -- Retrieve MOJ body uuid
        MojBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-MOJ');
    BEGIN
        -- Use the returned MojBodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), MojBodyUuid, 'RJ 1', 'RJ 1', 'RJ 1'),
            (uuid_generate_v4(), MojBodyUuid, 'RJ 4', 'RJ 4', 'RJ 4');
    END $$;

--commit changes
COMMIT;
