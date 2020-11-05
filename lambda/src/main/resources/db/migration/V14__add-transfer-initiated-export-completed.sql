ALTER TABLE "Consignment"
ADD COLUMN "TransferInitiatedDatetime" timestamp with time zone,
ADD COLUMN "TransferInitiatedBy" uuid,
ADD COLUMN "ExportDatetime" timestamp with time zone,
ADD COLUMN "ExportLocation" text
