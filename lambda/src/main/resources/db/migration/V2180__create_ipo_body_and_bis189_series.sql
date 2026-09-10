DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert Intellectual Property Office into the Body table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
            (uuid_generate_v4(), 'Intellectual Property Office', 'Intellectual Property Office', 'TDR-IPO')
        RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), bodyUuid, 'BIS 189', 'BIS 189', 'BIS 189');
    END $$;

-- commit changes
COMMIT;
