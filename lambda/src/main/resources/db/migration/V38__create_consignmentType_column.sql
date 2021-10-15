-- Alter the table and add the column 
ALTER TABLE "Consignment" ADD COLUMN "ConsignmentType" text;

-- save the changes
COMMIT ;
