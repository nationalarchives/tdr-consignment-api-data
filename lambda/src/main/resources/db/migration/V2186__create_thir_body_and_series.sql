DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
            (uuid_generate_v4(), 'Thirlwall Inquiry', 'Thirlwall Inquiry', 'TDR-THIR')
        RETURNING "BodyId" INTO bodyUuid;

        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), bodyUuid, 'THIR 1', 'THIR 1', 'THIR 1'),
            (uuid_generate_v4(), bodyUuid, 'THIR 2', 'THIR 2', 'THIR 2'),
            (uuid_generate_v4(), bodyUuid, 'THIR 3', 'THIR 3', 'THIR 3');
    END $$;

-- commit changes
COMMIT;
