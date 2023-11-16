-- Drop the existing primary key constraint
ALTER TABLE "FileMetadata" DROP CONSTRAINT "FileMetadata_pkey";

-- Alter the column definition for "MetadataId" to include the default value
ALTER TABLE "FileMetadata" ALTER COLUMN "MetadataId" SET DEFAULT uuid_generate_v4();

-- Add a new primary key constraint using the altered column
ALTER TABLE "FileMetadata" ADD CONSTRAINT "FileMetadata_pkey" PRIMARY KEY ("MetadataId");
