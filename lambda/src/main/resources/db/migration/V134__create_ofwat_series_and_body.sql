DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert OFWAT body into the  Body Table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
            (uuid_generate_v4(), 'Water Services Regulation Authority (Ofwat)', 'Water Services Regulation Authority (Ofwat)', 'TDR-OFWAT') RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), bodyUuid, 'JC 16', 'JC 16', 'JC 16'),
            (uuid_generate_v4(), bodyUuid, 'JC 17', 'JC 17', 'JC 17');

    END $$;

--commit changes
COMMIT;
