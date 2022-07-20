-- Add 'active' column to allow additional disallowed PUIDs, but ignore them until need to filter on them

ALTER TABLE "DisallowedPuids" ADD COLUMN "Active" BOOLEAN NOT NULL DEFAULT TRUE;

COMMIT;
