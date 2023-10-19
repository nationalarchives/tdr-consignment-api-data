-- Backfill new columns of the Consignment table ("TransferringBodyName") for Judgment

UPDATE "Consignment" c
SET "TransferringBodyName" = b."Name"
FROM "Body" b
WHERE coalesce(c."TransferringBodyName", '') = '' and c."BodyId" = b."BodyId";

COMMIT;
