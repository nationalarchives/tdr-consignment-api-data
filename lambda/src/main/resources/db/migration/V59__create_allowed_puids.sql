CREATE TABLE IF NOT EXISTS public."AllowedPuids"
(
    "PUID" text NOT NULL,
    "PUID Description" text NULL,
    "Created Date" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "Modified Date" timestamp with time zone,
    "ConsignmentType" text NOT NULL
);

INSERT INTO "AllowedPuids" ("PUID","PUID Description","ConsignmentType")
VALUES
    ('fmt/412','Microsoft Word for Windows','judgment');

COMMIT;
