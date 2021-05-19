ALTER TABLE "Body" ADD COLUMN "TdrCode" text;
UPDATE "Body" SET "TdrCode" = "Code";
