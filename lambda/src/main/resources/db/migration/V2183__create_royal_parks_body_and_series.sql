DO $$
    DECLARE
bodyUuid "Body"."BodyId"%TYPE;
BEGIN
        -- Insert Royal Parks Agency into the Body table
INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
    (uuid_generate_v4(), 'Royal Parks Agency', 'Royal Parks Agency', 'TDR-RPA')
    RETURNING "BodyId" INTO bodyUuid;

-- Use the returned bodyUuid value for the series insert
INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
    (uuid_generate_v4(), bodyUuid, 'KW 3', 'KW 3', 'KW 3');
END $$;

-- commit changes
COMMIT;
