-- Due to TDR having a different test DB to the real DB, we have had to convert the sequence name
-- This means that the API will work in production, whilst allowing us to test the consignment API with a different test DB.
ALTER SEQUENCE "ConsignmentSequenceID" RENAME TO consignment_sequence_id;