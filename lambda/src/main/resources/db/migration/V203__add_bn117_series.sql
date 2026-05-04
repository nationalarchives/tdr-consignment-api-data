DO $$
    DECLARE
        -- Retrieve MHRA body uuid
        MHRABodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-MHRA');
    BEGIN
        -- Use the returned MHRABodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
        (uuid_generate_v4(), MHRABodyUuid, 'BN 117', 'BN 117', 'BN 117');

    END $$;

--commit changes
COMMIT;
