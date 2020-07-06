ALTER TABLE "FFIDMetadata" RENAME TO "FFIDMetadataOld";
CREATE TABLE "FFIDMetadata"
(
    "FFIDMetadataId" uuid NOT NULL,
    "FileId" uuid NOT NULL,
    "Software" text COLLATE pg_catalog."default" NOT NULL,
    "SoftwareVersion" text COLLATE pg_catalog."default" NOT NULL,
    "Datetime" timestamp with time zone not null,
    "BinarySignatureFileVersion" text COLLATE pg_catalog."default" NOT NULL,
    "ContainerSignatureFileVersion" text COLLATE pg_catalog."default" NOT NULL,
    "Method" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "FFIDMetadata_pkey" PRIMARY KEY ("FFIDMetadataId"),
    CONSTRAINT "FFIDMetadata_Consignment_fkey" FOREIGN KEY ("FileId")
        REFERENCES "File" ("FileId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

INSERT INTO "FFIDMetadata" SELECT uuid_generate_v4(), "FileId", "Software", "SoftwareVersion", "Datetime", "BinarySignatureFileVersion", "ContainerSignatureFileVersion", "Method" FROM "FFIDMetadataOld";

CREATE TABLE "FFIDMetadataMatches"
(
    "FFIDMetadataId" uuid NOT NULL,
    "Extension" text COLLATE pg_catalog."default",
    "IdentificationBasis" text COLLATE pg_catalog."default" NOT NULL,
    "PUID" text COLLATE pg_catalog."default",
    CONSTRAINT "FFIDMetadataMatches_Metadata_fkey" FOREIGN KEY ("FFIDMetadataId")
        REFERENCES "FFIDMetadata" ("FFIDMetadataId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

INSERT INTO "FFIDMetadataMatches" SELECT fm."FFIDMetadataId", fmo."Extension", fmo."IdentificationBasis", fmo."PUID" FROM "FFIDMetadata" fm JOIN "FFIDMetadataOld" fmo on fmo."FileId" = fm."FileId";

DROP TABLE "FFIDMetadataOld";
