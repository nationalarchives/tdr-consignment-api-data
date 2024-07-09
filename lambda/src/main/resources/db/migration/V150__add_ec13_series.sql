DO $$
    DECLARE
        -- Retrieve Electoral body uuid
        EcBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-EC');
    BEGIN
        -- Use the returned EcBodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), EcBodyUuid, 'EC 13', 'EC 13', 'EC 13');
    END $$;

--commit changes
COMMIT;
