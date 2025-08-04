CREATE TABLE "MetadataReviewLog"
(
    "MetadataReviewLogId" uuid NOT NULL,
    "ConsignmentId" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "Action" text NOT NULL,
    "EventTime" timestamp with time zone NOT NULL DEFAULT NOW(),
    CONSTRAINT "MetadataReviewLog_pkey" PRIMARY KEY ("MetadataReviewLogId"),
    CONSTRAINT "MetadataReviewLog_Consignment_fkey" FOREIGN KEY ("ConsignmentId")
        REFERENCES "Consignment" ("ConsignmentId") MATCH SIMPLE
);
