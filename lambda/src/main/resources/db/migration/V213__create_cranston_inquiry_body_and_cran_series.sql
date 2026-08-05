DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert Cranston Inquiry into the Body table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
            (uuid_generate_v4(), 'Cranston Inquiry', 'Cranston Inquiry', 'TDR-CRAN')
        RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), bodyUuid, 'CRAN 1', 'CRAN 1', 'CRAN 1'),
            (uuid_generate_v4(), bodyUuid, 'CRAN 2', 'CRAN 2', 'CRAN 2'),
            (uuid_generate_v4(), bodyUuid, 'CRAN 3', 'CRAN 3', 'CRAN 3');
    END $$;

-- commit changes
COMMIT;
