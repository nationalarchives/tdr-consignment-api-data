-- Alter the tabel and add the column 
ALTER TABLE Consignment ADD COLUMN "ConsignmentType" text;

-- Set all the ConsignmentType data to standard for existing consignments
UPDATE "Consignment" SET "ConsignmentType" = 'standard';

-- save the changes
COMMIT ;
