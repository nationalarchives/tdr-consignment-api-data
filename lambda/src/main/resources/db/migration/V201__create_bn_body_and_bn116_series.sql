DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert Department of Health and Social Security and related bodies body into the  Body Table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
            (uuid_generate_v4(), 'Department of Health and Social Security and related bodies', 'Department of Health and Social Security and related bodies', 'TDR-BN') RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), bodyUuid, 'BN 116', 'BN 116', 'BN 116');

    END $$;

--commit changes
COMMIT;
