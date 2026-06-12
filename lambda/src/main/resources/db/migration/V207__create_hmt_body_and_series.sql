DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert HM Treasury Body into Table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
            (uuid_generate_v4(), 'HM Treasury', 'HM Treasury', 'TDR-T') RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), bodyUuid, 'T725', 'T725', 'T725'),
            (uuid_generate_v4(), bodyUuid, 'T729', 'T729', 'T729'),
            (uuid_generate_v4(), bodyUuid, 'T733', 'T733', 'T733'),
            (uuid_generate_v4(), bodyUuid, 'T731', 'T731', 'T731'),
            (uuid_generate_v4(), bodyUuid, 'T733', 'T733', 'T733'),
            (uuid_generate_v4(), bodyUuid, 'T728', 'T728', 'T728');

    END $$;

--commit changes
COMMIT;
