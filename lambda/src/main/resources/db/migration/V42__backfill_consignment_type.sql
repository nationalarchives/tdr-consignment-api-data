-- Update old rows with ConsignmentType 'standard' to ensure no gaps in the data
-- All old rows relate to consignments which are not 'judgments' as no judgments have been uploaded previously
UPDATE "Consignment" SET "ConsignmentType" = 'standard' WHERE "ConsignmentType" IS NULL;

COMMIT;

-- Ensure ConsignmentType always added for future rows
ALTER TABLE "Consignment" ALTER COLUMN "ConsignmentType" SET NOT NULL;

COMMIT;
