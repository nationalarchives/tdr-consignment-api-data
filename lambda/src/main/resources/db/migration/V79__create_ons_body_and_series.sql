DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert 'Office of National Statistics' body into the  Body Table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
        (uuid_generate_v4(), 'Office of National Statistics', 'Office of National Statistics', 'TDR-ONS') RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
        (uuid_generate_v4(), bodyUuid, 'RG 140', 'RG 140', 'RG 140');

    END $$;

--commit changes
COMMIT;
