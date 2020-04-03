CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- Table: "Body"
-- DROP TABLE "Body";

CREATE TABLE "Body"
(
    "BodyId" uuid NOT NULL,
    "Name" text COLLATE pg_catalog."default",
    "Code" text COLLATE pg_catalog."default",
    "Description" text COLLATE pg_catalog."default",
    CONSTRAINT "Body_pkey" PRIMARY KEY ("BodyId")
)
WITH (
    OIDS = FALSE
);

-- Table: "Series"

-- DROP TABLE "Series";
	
CREATE TABLE "Series"
(
    "SeriesId" uuid NOT NULL,
    "BodyId" uuid NOT NULL,
    "Name" text COLLATE pg_catalog."default",
    "Code" text COLLATE pg_catalog."default",
    "Description" text COLLATE pg_catalog."default",
    CONSTRAINT "Series_pkey" PRIMARY KEY ("SeriesId"),
    CONSTRAINT "Series_Body_fkey" FOREIGN KEY ("BodyId")
        REFERENCES "Body" ("BodyId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

WITH (
    OIDS = FALSE
);

-- Table: "ConsignmentProperty"

-- DROP TABLE "ConsignmentProperty";

CREATE TABLE "ConsignmentProperty"
(
    "PropertyId" uuid NOT NULL,
    "Name" text COLLATE pg_catalog."default",
    "Description" text COLLATE pg_catalog."default",
    "Shortname" text COLLATE pg_catalog."default",
    CONSTRAINT "ConProperty_pkey" PRIMARY KEY ("PropertyId")
)
WITH (
    OIDS = FALSE
);


-- Table: "FileProperty"

-- DROP TABLE "FileProperty";

CREATE TABLE "FileProperty"
(
    "PropertyId" uuid,
    "Name" text COLLATE pg_catalog."default",
    "Description" text COLLATE pg_catalog."default",
    "Shortname" text COLLATE pg_catalog."default",
    CONSTRAINT "FileProperty_pkey" PRIMARY KEY ("PropertyId")
)
WITH (
    OIDS = FALSE
);

-- Table: "Consignment"

-- DROP TABLE "Consignment";

CREATE TABLE "Consignment"
(
    "ConsignmentId" uuid NOT NULL,
    "SeriesId" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "Datetime" timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Consignment_pkey" PRIMARY KEY ("ConsignmentId"),
    CONSTRAINT "Consignment_Series_fkey" FOREIGN KEY ("SeriesId")
        REFERENCES "Series" ("SeriesId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
);

-- Table: "ConsignmentMetadata"

-- DROP TABLE "ConsignmentMetadata";

CREATE TABLE "ConsignmentMetadata"
(
    "MetadataId" uuid,
    "ConsignmentId" uuid,
    "PropertyId" uuid,
    "Value" text COLLATE pg_catalog."default",
    "Datetime" timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP,
    "UserId" uuid NOT NULL,
    CONSTRAINT "ConMetadataId_pkey" PRIMARY KEY ("MetadataId"),
    CONSTRAINT "ConMetadata_Consignment_fkey" FOREIGN KEY ("ConsignmentId")
        REFERENCES "Consignment" ("ConsignmentId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "ConMetadata_Property_fkey" FOREIGN KEY ("PropertyId")
        REFERENCES "ConsignmentProperty" ("PropertyId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
);

-- Table: "File"

-- DROP TABLE "File";

CREATE TABLE "File"
(
    "FileId" uuid NOT NULL,
    "ConsignmentId" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "Datetime" timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "File_pkey" PRIMARY KEY ("FileId"),
    CONSTRAINT "File_Consignment_fkey" FOREIGN KEY ("ConsignmentId")
        REFERENCES "Consignment" ("ConsignmentId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
);

-- Table: "FileMetadata"

-- DROP TABLE "FileMetadata";

CREATE TABLE "FileMetadata"
(
    "MetadataId" uuid,
    "FileId" uuid,
    "PropertyId" uuid,
    "Value" text COLLATE pg_catalog."default",
    "Datetime" timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP,
    "UserId" uuid NOT NULL,
    CONSTRAINT "FileMetadata_pkey" PRIMARY KEY ("MetadataId"),
    CONSTRAINT "FileMetadata_Consignment_fkey" FOREIGN KEY ("FileId")
        REFERENCES "File" ("FileId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FileMetadata_Property_fkey" FOREIGN KEY ("PropertyId")
        REFERENCES "FileProperty" ("PropertyId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
);

-- Table: "AVMetadata"

-- DROP TABLE "AVMetadata";

CREATE TABLE "AVMetadata"
(
    "FileId" uuid,
    "Software" text COLLATE pg_catalog."default",
    "Value" text COLLATE pg_catalog."default",
    "SoftwareVersion" text COLLATE pg_catalog."default",
    "DatabaseVersion" text COLLATE pg_catalog."default",
    "Result" text COLLATE pg_catalog."default",
    "Datetime" timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "AVMetadata_Consignment_fkey" FOREIGN KEY ("FileId")
        REFERENCES "File" ("FileId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
);

-- Table: "FFIDMetadata"

-- DROP TABLE "FFIDMetadata";

CREATE TABLE "FFIDMetadata"
(
    "FileId" uuid NOT NULL,
    "Software" text COLLATE pg_catalog."default",
    "SoftwareVersion" text COLLATE pg_catalog."default",
    "DefinitionsVersion" text COLLATE pg_catalog."default",
    "Method" text COLLATE pg_catalog."default",
    "Extension" text COLLATE pg_catalog."default",
    "ExtensionMismatch" text COLLATE pg_catalog."default",
    "FormatCount" text COLLATE pg_catalog."default",
    "PUID" text COLLATE pg_catalog."default",
    "Datetime" timestamp with time zone not null DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "FFIDMetadata_Consignment_fkey" FOREIGN KEY ("FileId")
        REFERENCES "File" ("FileId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
);

-- Table: "ClientFileMetadata"

-- DROP TABLE "ClientFileMetadata";

CREATE TABLE "ClientFileMetadata"
(
    "ClientFileMetadataId" uuid not null,
    "FileId" uuid not null,
    "OriginalPath" text COLLATE pg_catalog."default",
    "Checksum" text COLLATE pg_catalog."default",
    "ChecksumType" text COLLATE pg_catalog."default",
    "LastModified" timestamp with time zone not null,
    "CreatedDate" timestamp with time zone not null,
    "Filesize" bigint,
	"Datetime" timestamp with time zone not null,
    CONSTRAINT "ClientFileMetadata_pkey" PRIMARY KEY ("ClientFileMetadataId"),
    CONSTRAINT "ClientFileMetadata_Consignment_fkey" FOREIGN KEY ("FileId")
        REFERENCES "File" ("FileId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
);
