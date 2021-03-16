CREATE TABLE "ConsignmentStatus"
(
    "ConsignmentStatusId" uuid NOT NULL,
    "ConsignmentId" uuid NOT NULL,
    "StatusType" text NOT NULL,
    "Value" text NOT NULL,
    "CreatedDatetime" timestamp with time zone not null,
    CONSTRAINT "ConsignmentStatus_pkey" PRIMARY KEY ("ConsignmentStatusId"),
    CONSTRAINT "ConsignmentStatus_Consignment_fkey" FOREIGN KEY ("ConsignmentId")
    REFERENCES "Consignment" ("ConsignmentId") MATCH SIMPLE
)
