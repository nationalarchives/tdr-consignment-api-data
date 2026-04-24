-- Remove BN 116 series and TDR-BN body as BN 116 series is now being added to TDR-MHRA body instead of TDR-BN body.
DELETE from "Series"
WHERE "BodyId" IN (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-BN');
DELETE from "Body" where "TdrCode" = 'TDR-BN';

-- Add BN 116 series for TDR-MHRA
DO $$
    DECLARE
        -- Retrieve MHRA body uuid
        MHRABodyUuid "Body"."BodyId"%TYPE := (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-MHRA');
    BEGIN
        -- Use the returned MHRABodyUuid value for the series insert
        INSERT INTO "Series" ("SeriesId", "BodyId", "Code", "Name", "Description") VALUES
            (uuid_generate_v4(), MHRABodyUuid, 'BN 116', 'BN 116', 'BN 116');
    END $$;

--commit changes
COMMIT;