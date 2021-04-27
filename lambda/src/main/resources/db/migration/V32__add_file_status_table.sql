CREATE TABLE "FileStatus"
(
    "FileStatusId" uuid NOT NULL,
    "FileId" uuid NOT NULL,
    "StatusType" text NOT NULL,
    "Value" text NOT NULL,
    "CreatedDatetime"  timestamp with time zone not null,
    CONSTRAINT "FileStatus_pkey" PRIMARY KEY ("FileStatusId"),
    CONSTRAINT "FileStatus_File_fkey" FOREIGN KEY ("FileId")
    REFERENCES "File" ("FileId") MATCH SIMPLE
);
