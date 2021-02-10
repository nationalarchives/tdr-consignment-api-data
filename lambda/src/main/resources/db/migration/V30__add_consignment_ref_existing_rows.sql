-- Update consignment table to create reference for existing Consignment rows
-- For this we are not using the encoded consignment reference as it was too difficult to encode the reference within a database migration.
-- This change will only affect existing data in intg and staging (all test data since TDR has not been released).
-- New consignments will have the properly encoded consignment reference format agreed upon by TDR developers.
UPDATE "Consignment"
SET "ConsignmentReference"=CONCAT('TDR-2020-OLD-', "ConsignmentSequence");

-- Alter table to make consignment reference not nullable
ALTER TABLE "Consignment"
ALTER COLUMN "ConsignmentReference" SET NOT NULL;