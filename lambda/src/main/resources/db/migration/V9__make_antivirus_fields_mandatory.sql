-- Add placeholders for missing data. This is safe because values should only
-- be null for test data that was added manually.
UPDATE "AVMetadata"
  SET "Software" = 'PLACEHOLDER_SOFTWARE'
  WHERE "Software" IS NULL;
UPDATE "AVMetadata"
  SET "SoftwareVersion" = 'PLACEHOLDER_SOFTWARE_VERSION'
  WHERE "SoftwareVersion" IS NULL;
UPDATE "AVMetadata"
  SET "DatabaseVersion" = 'PLACEHOLDER_DATABASE_VERSION'
  WHERE "DatabaseVersion" IS NULL;
UPDATE "AVMetadata"
  SET "Result" = 'PLACEHOLDER_RESULT'
  WHERE "Result" IS NULL;

-- Make fields non-null
ALTER TABLE "AVMetadata"
  ALTER COLUMN "Software" SET NOT NULL,
  ALTER COLUMN "SoftwareVersion" SET NOT NULL,
  ALTER COLUMN "DatabaseVersion" SET NOT NULL,
  ALTER COLUMN "Result" SET NOT NULL;
