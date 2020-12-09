-- Create sequence that will be the consignment sequence ID used to encode b25 section of consignment reference
CREATE SEQUENCE "ConsignmentSequence"
NO CYCLE
START WITH 1
INCREMENT BY 1;

-- Alter Consignment table to add column to store sequence ID and another for full consignment reference
ALTER TABLE "Consignment"
ADD COLUMN "ConsignmentSequence" bigint,
ADD COLUMN "ConsignmentReference" text
