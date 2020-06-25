DROP TABLE "FFIDMetadata";
CREATE TABLE "FFIDMetadata"
(
    "FileId" uuid NOT NULL,
    "Software" text COLLATE pg_catalog."default" NOT NULL,
    "SoftwareVersion" text COLLATE pg_catalog."default" NOT NULL,
    "BinarySignatureFileVersion" text COLLATE pg_catalog."default" NOT NULL,
    "ContainerSignatureFileVersion" text COLLATE pg_catalog."default" NOT NULL,
    "Method" text COLLATE pg_catalog."default" NOT NULL,
    "Extension" text COLLATE pg_catalog."default",
    "IdentificationBasis" text COLLATE pg_catalog."default" NOT NULL,
    "PUID" text COLLATE pg_catalog."default",
    "Datetime" timestamp with time zone not null,
    CONSTRAINT "FFIDMetadata_Consignment_fkey" FOREIGN KEY ("FileId")
        REFERENCES "File" ("FileId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
);
