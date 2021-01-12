UPDATE "ConsignmentMetadata"
    SET "Value" = 'false'
    WHERE "Value" IS NULL;

ALTER TABLE "ConsignmentMetadata"
    ALTER COLUMN "ConsignmentId" SET NOT NULL,
    ALTER COLUMN "PropertyName" SET NOT NULL,
    ALTER COLUMN "Value" SET NOT NULL;
