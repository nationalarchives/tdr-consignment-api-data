-- Backfill new columns of the Consignment table ("SeriesName" and "TransferringBodyName")

UPDATE "Consignment" c
SET "SeriesName" =  s."Name", "TransferringBodyName" = b."Name"
FROM "Series" s, "Body" b
WHERE coalesce(c."SeriesName", '') = '' and coalesce(c."TransferringBodyName", '') = '' and c."SeriesId" = s."SeriesId" and c."BodyId" = b."BodyId";

COMMIT;
