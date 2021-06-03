DO $$ 
DECLARE
    bodyUuid "Body"."BodyId"%TYPE;
BEGIN
    
    -- the Body Code column is no longer required
    --rectify this
    ALTER TABLE "Body" DROP COLUMN "Code";

    -- I noticed that columns in the body table were nullable
    --rectify this
    ALTER TABLE "Body" ALTER COLUMN "Name" SET NOT NULL;
    ALTER TABLE "Body" ALTER COLUMN "TdrCode" SET NOT NULL;

    -- I noticed that columns in the series table were nullable
    --rectify this
    ALTER TABLE "Series" ALTER COLUMN "Name" SET NOT NULL;
    ALTER TABLE "Series" ALTER COLUMN "Code" SET NOT NULL;

    -- Insert in first body into the  Body Table
    INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
      (uuid_generate_v4(), 'Welsh Government', 'Welsh Government', 'TDR-WA') RETURNING "BodyId" INTO bodyUuid;
      
    -- Use the returned bodyUuid value for the series insert
    INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
      (uuid_generate_v4(), bodyUuid, 'WA 20', 'WA 20', 'WA 20');
    
    -- Insert in second body into the  Body Table
    INSERT INTO "Body" ("BodyId", "Name", "Description", "TdrCode") VALUES
      (uuid_generate_v4(), 'Ministry of Justice', 'Ministry of Justice', 'TDR-MOJ') RETURNING "BodyId" INTO bodyUuid;
      
    -- Use the returned bodyUuid value for the series insert
    INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
      (uuid_generate_v4(), bodyUuid, 'LCO 72', 'LCO 72', 'LCO 72');


END $$;

--commit changes
COMMIT; 
