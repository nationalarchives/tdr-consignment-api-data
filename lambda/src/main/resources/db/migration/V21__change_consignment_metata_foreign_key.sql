ALTER TABLE "ConsignmentMetadata" DROP CONSTRAINT "ConMetadata_Property_fkey";
ALTER TABLE "ConsignmentMetadata" ALTER COLUMN "PropertyId" TYPE text;
ALTER TABLE "ConsignmentMetadata" RENAME COLUMN "PropertyId" TO "PropertyName";
ALTER TABLE "ConsignmentMetadata" ADD CONSTRAINT
    "ConMetadata_PropertyName_fkey" FOREIGN KEY ("PropertyName") REFERENCES "ConsignmentProperty" ("Name")
        MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

ALTER TABLE "ConsignmentProperty" DROP CONSTRAINT "ConProperty_pkey";
ALTER TABLE "ConsignmentProperty" ADD CONSTRAINT "ConProperty_pkey" PRIMARY KEY ("Name");
ALTER TABLE "ConsignmentProperty" DROP COLUMN "PropertyId";
