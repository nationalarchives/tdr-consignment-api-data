DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert The Electoral Commission body into the  Body Table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
            (uuid_generate_v4(), 'The Electoral Commission', 'The Electoral Commission', 'TDR-EC') RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), bodyUuid, 'EC 9', 'EC 9', 'EC 9'),
            (uuid_generate_v4(), bodyUuid, 'EC 10', 'EC 10', 'EC 10');

    END $$;

--commit changes
COMMIT;
