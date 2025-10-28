DO $$
    DECLARE
        -- Retrieve NICE body uuid
        NiceBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-NICE');
    BEGIN
        -- Use the returned NiceBodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), NiceBodyUuid, 'JA 1418', 'JA 1418', 'JA 1418');

    END $$;
    
--commit changes
COMMIT;
