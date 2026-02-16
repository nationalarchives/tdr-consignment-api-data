DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert Dawn Sturgess Inquiry body into the  Body Table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
            (uuid_generate_v4(), 'Dawn Sturgess Inquiry', 'Dawn Sturgess Inquiry', 'TDR-STUR') RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), bodyUuid, 'STUR 1', 'STUR 1', 'STUR 1'),
            (uuid_generate_v4(), bodyUuid, 'STUR 2', 'STUR 2', 'STUR 2'),;
    END $$;

--commit changes
COMMIT;
