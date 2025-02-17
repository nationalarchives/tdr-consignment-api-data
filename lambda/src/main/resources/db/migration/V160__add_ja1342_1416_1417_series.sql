DO $$
    DECLARE
        -- Retrieve NICE body uuid
        NiceBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-NICE');
    BEGIN
        -- Use the returned NiceBodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), NiceBodyUuid, 'JA 1342', 'JA 1342', 'JA 1342');
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), NiceBodyUuid, 'JA 1416', 'JA 1416', 'JA 1416');
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), NiceBodyUuid, 'JA 1417', 'JA 1417', 'JA 1417');

    END $$;
    
--commit changes
COMMIT;
