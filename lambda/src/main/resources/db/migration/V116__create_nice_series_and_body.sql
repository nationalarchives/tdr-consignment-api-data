DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert NICE body into the  Body Table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
            (uuid_generate_v4(), 'National Institute for Health and Care Excellence (NICE)', 'National Institute for Health and Care Excellence (NICE)', 'TDR-NICE') RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), bodyUuid, 'JA 1282', 'JA 1282', 'JA 1282');

    END $$;

--commit changes
COMMIT;
