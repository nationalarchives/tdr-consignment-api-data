-- Backfill TransferringBodyTdrCode column of the Consignment table from Body table

UPDATE "Consignment" c
SET "TransferringBodyTdrCode" = b."TdrCode"
FROM "Body" b
WHERE coalesce(c."TransferringBodyTdrCode", '') = '' and c."BodyId" = b."BodyId";

COMMIT;
