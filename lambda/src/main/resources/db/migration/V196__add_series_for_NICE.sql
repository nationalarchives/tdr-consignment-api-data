DO $$
    DECLARE
        -- Retrieve NICE body uuid
        NiceBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-NICE');
    BEGIN
        -- Use the returned NiceBodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
        (uuid_generate_v4(), NiceBodyUuid, 'FP 3', 'FP 3', 'FP 3'),
        (uuid_generate_v4(), NiceBodyUuid, 'FP 8', 'FP 8', 'FP 8'),
        (uuid_generate_v4(), NiceBodyUuid, 'FP 10', 'FP 10', 'FP 10'),
        (uuid_generate_v4(), NiceBodyUuid, 'FP 11', 'FP 11', 'FP 11');
    END $$;

--commit changes
COMMIT;
