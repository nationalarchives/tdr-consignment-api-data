-- Update old rows with BodyId to ensure no gaps in the data
UPDATE "Consignment" c
SET "BodyId" = s."BodyId"
FROM
    "Series" s
WHERE
    c."SeriesId" = s."SeriesId";

COMMIT;

-- Ensure BodyId always added for future rows
ALTER TABLE "Consignment" ALTER COLUMN "BodyId" SET NOT NULL;

COMMIT;