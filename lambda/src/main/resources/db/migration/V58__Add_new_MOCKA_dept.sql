DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert MockA body into the  Body Table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
        (uuid_generate_v4(), 'MOCKA', 'MockA', 'TDR-MOCKA') RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
        (uuid_generate_v4(), bodyUuid, 'MOCKA 101', 'MOCKA 101', 'MOCKA 101');

    END $$;

--commit changes
COMMIT;
