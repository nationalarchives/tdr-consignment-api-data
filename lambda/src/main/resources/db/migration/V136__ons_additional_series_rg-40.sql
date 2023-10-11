DO $$
    DECLARE
        -- Retrieve ONS body uuid
        OnsBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-ONS');
    BEGIN
        -- Use the returned OnsBodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), OnsBodyUuid, 'RG 40', 'RG 40', 'RG 40');
    END $$;

--commit changes
COMMIT;
