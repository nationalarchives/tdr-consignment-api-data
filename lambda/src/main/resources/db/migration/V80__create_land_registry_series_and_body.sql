DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert Land Registry body into the  Body Table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
            (uuid_generate_v4(), 'Land Registry', 'Land Registry', 'TDR-LAR') RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), bodyUuid, 'LAR 1', 'LAR 1', 'LAR 1');

    END $$;

--commit changes
COMMIT;
