DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert Cabinet Office into the Body table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
            (uuid_generate_v4(), 'Cabinet Office', 'Cabinet Office', 'TDR-CO')
        RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), bodyUuid, 'GTI 2', 'GTI 2', 'GTI 2'),
            (uuid_generate_v4(), bodyUuid, 'GTI 3', 'GTI 3', 'GTI 3');

        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
            (uuid_generate_v4(), 'Ministry of Defence', 'Ministry of Defence', 'TDR-MOD');
    END $$;

-- commit changes
COMMIT;
