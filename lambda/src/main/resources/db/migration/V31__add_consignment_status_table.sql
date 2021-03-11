CREATE TABLE "ConsignmentStatus"
(
    "ConsignmentStatusId" uuid NOT NULL,
    "ConsignmentId" uuid NOT NULL,
    "StatusType" text NOT NULL,
    "Value" text NOT NULL,
    "DateTime" timestamp with time zone not null,
    CONSTRAINT "ConsignmentStatus_pkey" PRIMARY KEY ("ConsignmentStatusId"),
    CONSTRAINT "ConsignmentStatus_Consignment_fkey" FOREIGN KEY ("ConsignmentId")
    REFERENCES "Consignment" ("ConsignmentId") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID
)
