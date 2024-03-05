DO $$
    DECLARE
        -- Retrieve Welsh Government body uuid
        OnsBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-WA');
    BEGIN
        -- Use the returned WaBodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), OnsBodyUuid, 'WA 22', 'WA 22', 'WA 22');
    END $$;

--commit changes
COMMIT;
