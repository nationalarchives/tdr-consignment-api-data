ALTER TABLE "ConsignmentStatus"
ADD "ModifiedDatetime" timestamp with time zone,
ADD CONSTRAINT consignment_status UNIQUE ("ConsignmentId", "StatusType");