-- Drop the existing primary key constraint
ALTER TABLE "FileStatus" DROP CONSTRAINT "FileStatus_pkey";

-- Alter the column definition for "FileStatusId" to include the default value
ALTER TABLE "FileStatus" ALTER COLUMN "FileStatusId" SET DEFAULT uuid_generate_v4();

-- Add a new primary key constraint using the altered column
ALTER TABLE "FileStatus" ADD CONSTRAINT "FileStatus_pkey" PRIMARY KEY ("FileStatusId");
