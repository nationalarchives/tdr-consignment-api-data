DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert Department for Environment, Food & Rural Affairs into the Body table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
            (uuid_generate_v4(), 'Department for Environment, Food & Rural Affairs', 'Department for Environment, Food & Rural Affairs', 'TDR-DEFRA')
        RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), bodyUuid, 'MAF 888', 'MAF 888', 'MAF 888');
    END $$;

-- commit changes
COMMIT;
