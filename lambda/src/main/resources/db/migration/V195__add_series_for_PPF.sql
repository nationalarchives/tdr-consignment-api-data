DO $$
    DECLARE
        -- Retrieve PPF body uuid
        PPFBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-PPF');
    BEGIN
        -- Use the returned PPFBodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
        (uuid_generate_v4(), PPFBodyUuid, 'JB 151', 'JB 151', 'JB 151'),
        (uuid_generate_v4(), PPFBodyUuid, 'JB 152', 'JB 152', 'JB 152'),
        (uuid_generate_v4(), PPFBodyUuid, 'JB 153', 'JB 153', 'JB 153'),
        (uuid_generate_v4(), PPFBodyUuid, 'JB 139', 'JB 139', 'JB 139');

    END $$;

--commit changes
COMMIT;
