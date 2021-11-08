-- Alter the table to make column nullable
ALTER TABLE "Consignment"
    ALTER COLUMN "SeriesId" DROP NOT NULL;

COMMIT;

-- Add the BodyId column into the consignment table, to allow link between consignment and body when no series
-- Will be made non null once all rows have been back filled as separate migration
ALTER TABLE "Consignment"
    ADD COLUMN "BodyId" uuid;

COMMIT;

-- Add constraint so that BodyId must exist in Body table
ALTER TABLE "Consignment" ADD CONSTRAINT
    "Consignment_Body_fkey" FOREIGN KEY ("BodyId") REFERENCES "Body" ("BodyId")
        MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

COMMIT;
