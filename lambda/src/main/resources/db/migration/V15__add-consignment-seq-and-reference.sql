-- Create sequence that will be the consignment sequence ID used to encode b25 section of consignment reference
CREATE SEQUENCE "ConsignmentSequenceID"
NO CYCLE
START WITH 1
INCREMENT BY 1;

-- Alter Consignment table to add column to store sequence ID and another for full consignment reference
ALTER TABLE "Consignment"
ADD COLUMN "ConsignmentSequence" bigint DEFAULT nextval('"ConsignmentSequenceID"'),
ADD COLUMN "ConsignmentReference" text,
ADD UNIQUE ("ConsignmentSequence", "ConsignmentReference");

-- Alter consignment table to create consignment reference for existing Consignment rows
UPDATE "Consignment"
SET "ConsignmentReference"='TDR-2020-OLD-' || "ConsignmentSequence";
