DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert HRA body into the  Body Table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
        (uuid_generate_v4(), 'Royal Mint', 'Royal Mint', 'TDR-RMNT') RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
        (uuid_generate_v4(), bodyUuid, 'MINT 25', 'MINT 25', 'MINT 25');

    END $$;

--commit changes
COMMIT; 