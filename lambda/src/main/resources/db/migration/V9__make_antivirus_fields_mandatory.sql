ALTER TABLE "AVMetadata"
  ALTER COLUMN "Software" SET NOT NULL,
  ALTER COLUMN "SoftwareVersion" SET NOT NULL,
  ALTER COLUMN "DatabaseVersion" SET NOT NULL,
  ALTER COLUMN "Result" SET NOT NULL;