DO $$
    DECLARE
        -- Retrieve HMT body uuid
       HmtBodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-T');
    BEGIN
         -- Use the returned HmtBodyUuid value to insert new series
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), HmtBodyUuid, 'T 732', 'T 732', 'T 732'),
            (uuid_generate_v4(), HmtBodyUuid, 'T 734', 'T 734', 'T 734'),
            (uuid_generate_v4(), HmtBodyUuid, 'T 735', 'T 735', 'T 735');
    END $$;

--commit changes
COMMIT;
