DO $$
    DECLARE
        bodyUuid "Body"."BodyId"%TYPE;
    BEGIN
        -- Insert Parliamentary Knowledge & Information and related bodies body into the  Body Table
        INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
        (uuid_generate_v4(), 'Parliamentary Knowledge & Information', 'Parliamentary Knowledge & Information', 'TDR-PKI') RETURNING "BodyId" INTO bodyUuid;

        -- Use the returned bodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
        (uuid_generate_v4(), bodyUuid, 'YHL 1', 'YHL 1', 'YHL 1'),
        (uuid_generate_v4(), bodyUuid, 'YHC 1', 'YHC 1', 'YHC 1'),
        (uuid_generate_v4(), bodyUuid, 'YUKP 1', 'YUKP 1', 'YUKP 1');

    END $$;

--commit changes
COMMIT;
