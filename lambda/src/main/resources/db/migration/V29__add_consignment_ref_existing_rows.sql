-- Update consignment table to create consignment reference for existing Consignment rows
UPDATE "Consignment"
SET "ConsignmentReference"=CONCAT('TDR-2020-OLD-', "ConsignmentSequence");

-- Alter table to make consignment reference not nullable
ALTER TABLE "Consignment"
ALTER COLUMN "ConsignmentReference" SET NOT NULL;