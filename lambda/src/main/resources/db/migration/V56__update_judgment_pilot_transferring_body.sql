-- Initial pilot judgment transfers were set against the incorrect transferring body.
-- HM Courts and Tribunals Service is the correct body
DO $$
DECLARE
    hmctsBodyId "Body"."BodyId"%TYPE;
    mojBodyId "Body"."BodyId"%TYPE;
    sctBodyId "Body"."BodyId"%TYPE;
BEGIN

    SELECT "BodyId" INTO hmctsBodyId FROM "Body" WHERE "TdrCode" = 'TDR-HMCTS';
    SELECT "BodyId" INTO mojBodyId FROM "Body" WHERE "TdrCode" = 'TDR-MOJ';
    SELECT "BodyId" INTO sctBodyId FROM "Body" WHERE "TdrCode" = 'TDR-SC';

    -- Update 'Ministry of Justice' transferring body to HMCTS for judgment transfers
    UPDATE "Consignment" SET "BodyId" = hmctsBodyId WHERE "BodyId" = mojBodyId AND "ConsignmentType" = 'judgment';

    -- Update 'Supreme Court' transferring body to HMCTS for judgment transfers
    UPDATE "Consignment" SET "BodyId" = hmctsBodyId WHERE "BodyId" = sctBodyId AND "ConsignmentType" = 'judgment';
END $$;

--commit changes
COMMIT;
