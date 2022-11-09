-- Create a Body and Series and that can be used for automation testing where series is 4 letters max.

DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
            (uuid_generate_v4(), 'Testing A', 'Testing A', 'TDR-TSTA') RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), bodyUuid, 'TSTA 1', 'TSTA 1', 'TSTA 1');

    END $$;

--commit changes
COMMIT;
