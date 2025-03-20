DO $$
    DECLARE
        -- Retrieve ICO body uuid
        icoBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-ICO');
    BEGIN
        -- Use the returned icoBodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), icoBodyUuid, 'JX 11', 'JX 11', 'JX 11');
    END $$;

--commit changes
COMMIT;
