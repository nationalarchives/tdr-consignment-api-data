DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert Pension Protection Fund into the Body Table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
            (uuid_generate_v4(), 'Pension Protection Fund', 'Pension Protection Fund', 'TDR-PPF') RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), bodyUuid, 'JB 140', 'JB 140', 'JB 140'),
            (uuid_generate_v4(), bodyUuid, 'JB 141', 'JB 141', 'JB 141'),
            (uuid_generate_v4(), bodyUuid, 'JB 142', 'JB 142', 'JB 142'),
            (uuid_generate_v4(), bodyUuid, 'JB 143', 'JB 143', 'JB 143'),
            (uuid_generate_v4(), bodyUuid, 'JB 144', 'JB 144', 'JB 144'),
            (uuid_generate_v4(), bodyUuid, 'JB 145', 'JB 145', 'JB 145'),
            (uuid_generate_v4(), bodyUuid, 'JB 146', 'JB 146', 'JB 146'),
            (uuid_generate_v4(), bodyUuid, 'JB 147', 'JB 147', 'JB 147');
    END $$;
    
COMMIT;
