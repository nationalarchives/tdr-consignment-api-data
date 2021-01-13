ALTER TABLE "FileMetadata" DROP CONSTRAINT "FileMetadata_Property_fkey";
ALTER TABLE "FileMetadata" ADD COLUMN "PropertyName" text;

ALTER TABLE "FileProperty" DROP CONSTRAINT "FileProperty_pkey";
ALTER TABLE "FileProperty" ALTER COLUMN "PropertyId" DROP NOT NULL;
ALTER TABLE "FileProperty" DROP CONSTRAINT "FileProperty_Name";
ALTER TABLE "FileProperty" ADD PRIMARY KEY ("Name");
ALTER TABLE "FileMetadata" ADD CONSTRAINT "FileMetadata_PropertyName"
    FOREIGN KEY ("PropertyName") REFERENCES "FileProperty" ("Name")
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;
ALTER TABLE "FileMetadata" ALTER COLUMN "PropertyId" DROP NOT NULL;
