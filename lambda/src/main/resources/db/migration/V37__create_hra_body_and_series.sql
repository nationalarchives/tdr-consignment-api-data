DO $$ 
DECLARE
    bodyUuid "Body"."BodyId"%TYPE;
BEGIN
    -- Insert HRA body into the  Body Table
    INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
      (uuid_generate_v4(), 'Health Research Authority', 'Health Research Authority', 'TDR-HRA') RETURNING "BodyId" INTO bodyUuid;
      
    -- Use the returned bodyUuid value for the series insert
    INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
      (uuid_generate_v4(), bodyUuid, 'JA 899', 'JA 899', 'JA 899');

END $$;

--commit changes
COMMIT; 
