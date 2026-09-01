-- Set the bodyId column in the consignment table to nullable.
-- This is required for the new consignment creation flow, where the body is not known
-- at the time of consignment creation because the user may be assigned to multiple bodies.
-- The body will be assigned later, when a series is assigned to the consignment.

ALTER TABLE "Consignment"
ALTER COLUMN "BodyId" DROP NOT NULL;
