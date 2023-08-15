DO $$
    DECLARE
        -- Retrieve ONS body uuid
        OnsBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-ONS');
    BEGIN
        -- Use the returned OnsBodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), OnsBodyUuid, 'RG 53', 'RG 53', 'RG 53'),
            (uuid_generate_v4(), OnsBodyUuid, 'RG 75', 'RG 75', 'RG 75'),
            (uuid_generate_v4(), OnsBodyUuid, 'RG 121', 'RG 121', 'RG 121'),
            (uuid_generate_v4(), OnsBodyUuid, 'LAB 17', 'LAB 17', 'LAB 17');

    END $$;

--commit changes
COMMIT;
