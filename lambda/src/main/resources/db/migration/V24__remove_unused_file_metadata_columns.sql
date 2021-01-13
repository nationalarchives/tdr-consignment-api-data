UPDATE "FileMetadata" fm SET "PropertyName" = fp."Name" FROM "FileProperty" fp WHERE fm."PropertyId" = fp."PropertyId";
ALTER TABLE "FileMetadata" DROP COLUMN "PropertyId";
ALTER TABLE "FileProperty" DROP COLUMN "PropertyId";