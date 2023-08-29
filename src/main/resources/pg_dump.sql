--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Debian 14.9-1.pgdg120+1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AVMetadata; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."AVMetadata" (
    "FileId" uuid NOT NULL,
    "Software" text NOT NULL,
    "SoftwareVersion" text NOT NULL,
    "DatabaseVersion" text NOT NULL,
    "Result" text NOT NULL,
    "Datetime" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."AVMetadata" OWNER TO tdr;

--
-- Name: AllowedPuids; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."AllowedPuids" (
    "PUID" text NOT NULL,
    "PUID Description" text NOT NULL,
    "Created Date" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "Modified Date" timestamp with time zone,
    "ConsignmentType" text NOT NULL
);


ALTER TABLE public."AllowedPuids" OWNER TO tdr;

--
-- Name: Body; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."Body" (
    "BodyId" uuid NOT NULL,
    "Name" text NOT NULL,
    "Description" text,
    "TdrCode" text NOT NULL
);


ALTER TABLE public."Body" OWNER TO tdr;

--
-- Name: Consignment; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."Consignment" (
    "ConsignmentId" uuid NOT NULL,
    "SeriesId" uuid,
    "UserId" uuid NOT NULL,
    "Datetime" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "ParentFolder" text,
    "TransferInitiatedDatetime" timestamp with time zone,
    "TransferInitiatedBy" uuid,
    "ExportDatetime" timestamp with time zone,
    "ExportLocation" text,
    "ConsignmentSequence" bigint NOT NULL,
    "ConsignmentReference" text NOT NULL,
    "ConsignmentType" text NOT NULL,
    "BodyId" uuid NOT NULL,
    "ExportVersion" text,
    "IncludeTopLevelFolder" boolean
);


ALTER TABLE public."Consignment" OWNER TO tdr;

--
-- Name: ConsignmentMetadata; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."ConsignmentMetadata" (
    "MetadataId" uuid NOT NULL,
    "ConsignmentId" uuid NOT NULL,
    "PropertyName" text NOT NULL,
    "Value" text NOT NULL,
    "Datetime" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UserId" uuid NOT NULL
);


ALTER TABLE public."ConsignmentMetadata" OWNER TO tdr;

--
-- Name: ConsignmentProperty; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."ConsignmentProperty" (
    "Name" text NOT NULL,
    "Description" text
);


ALTER TABLE public."ConsignmentProperty" OWNER TO tdr;

--
-- Name: ConsignmentStatus; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."ConsignmentStatus" (
    "ConsignmentStatusId" uuid NOT NULL,
    "ConsignmentId" uuid NOT NULL,
    "StatusType" text NOT NULL,
    "Value" text NOT NULL,
    "CreatedDatetime" timestamp with time zone NOT NULL,
    "ModifiedDatetime" timestamp with time zone
);


ALTER TABLE public."ConsignmentStatus" OWNER TO tdr;

--
-- Name: DisallowedPuids; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."DisallowedPuids" (
    "PUID" text NOT NULL,
    "PUID Description" text NOT NULL,
    "Created Date" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "Modified Date" timestamp with time zone,
    "Reason" text NOT NULL,
    "Active" boolean DEFAULT true NOT NULL
);


ALTER TABLE public."DisallowedPuids" OWNER TO tdr;

--
-- Name: DisplayProperties; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."DisplayProperties" (
    "PropertyName" text,
    "Attribute" text,
    "Value" text,
    "AttributeType" text
);


ALTER TABLE public."DisplayProperties" OWNER TO tdr;

--
-- Name: FFIDMetadata; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."FFIDMetadata" (
    "FFIDMetadataId" uuid NOT NULL,
    "FileId" uuid NOT NULL,
    "Software" text NOT NULL,
    "SoftwareVersion" text NOT NULL,
    "Datetime" timestamp with time zone NOT NULL,
    "BinarySignatureFileVersion" text NOT NULL,
    "ContainerSignatureFileVersion" text NOT NULL,
    "Method" text NOT NULL
);


ALTER TABLE public."FFIDMetadata" OWNER TO tdr;

--
-- Name: FFIDMetadataMatches; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."FFIDMetadataMatches" (
    "FFIDMetadataId" uuid NOT NULL,
    "Extension" text,
    "IdentificationBasis" text NOT NULL,
    "PUID" text,
    extensionmismatch boolean,
    formatname text
);


ALTER TABLE public."FFIDMetadataMatches" OWNER TO tdr;

--
-- Name: File; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."File" (
    "FileId" uuid NOT NULL,
    "ConsignmentId" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "Datetime" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "ChecksumMatches" boolean,
    "FileType" text,
    "FileName" text,
    "ParentId" uuid,
    CONSTRAINT "chk_FileType" CHECK (("FileType" = ANY (ARRAY['File'::text, 'Folder'::text])))
);


ALTER TABLE public."File" OWNER TO tdr;

--
-- Name: FileMetadata; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."FileMetadata" (
    "MetadataId" uuid NOT NULL,
    "FileId" uuid NOT NULL,
    "Value" text NOT NULL,
    "Datetime" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UserId" uuid NOT NULL,
    "PropertyName" text NOT NULL
);


ALTER TABLE public."FileMetadata" OWNER TO tdr;

--
-- Name: FileProperty; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."FileProperty" (
    "Name" text NOT NULL,
    "Description" text,
    "FullName" text,
    "CreatedDatetime" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "ModifiedDatetime" timestamp with time zone,
    "PropertyType" text,
    "Datatype" text,
    "Editable" boolean,
    "MultiValue" boolean,
    "PropertyGroup" text,
    "UIOrdinal" integer,
    "ExportOrdinal" smallint,
    "AllowExport" boolean DEFAULT false NOT NULL
);


ALTER TABLE public."FileProperty" OWNER TO tdr;

--
-- Name: FilePropertyDependencies; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."FilePropertyDependencies" (
    "GroupId" integer NOT NULL,
    "PropertyName" text NOT NULL,
    "Default" text
);


ALTER TABLE public."FilePropertyDependencies" OWNER TO tdr;

--
-- Name: FilePropertyValues; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."FilePropertyValues" (
    "PropertyName" text NOT NULL,
    "PropertyValue" text NOT NULL,
    "Default" boolean,
    "Dependencies" integer,
    "SecondaryValue" integer,
    "Ordinal" integer
);


ALTER TABLE public."FilePropertyValues" OWNER TO tdr;

--
-- Name: FileStatus; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."FileStatus" (
    "FileStatusId" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "FileId" uuid NOT NULL,
    "StatusType" text NOT NULL,
    "Value" text NOT NULL,
    "CreatedDatetime" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."FileStatus" OWNER TO tdr;

--
-- Name: Series; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."Series" (
    "SeriesId" uuid NOT NULL,
    "BodyId" uuid NOT NULL,
    "Name" text NOT NULL,
    "Code" text NOT NULL,
    "Description" text
);


ALTER TABLE public."Series" OWNER TO tdr;

--
-- Name: consignment_sequence_id; Type: SEQUENCE; Schema: public; Owner: tdr
--

CREATE SEQUENCE public.consignment_sequence_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consignment_sequence_id OWNER TO tdr;

--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO tdr;

--
-- Name: Body Body_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."Body"
    ADD CONSTRAINT "Body_pkey" PRIMARY KEY ("BodyId");


--
-- Name: ConsignmentMetadata ConMetadataId_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."ConsignmentMetadata"
    ADD CONSTRAINT "ConMetadataId_pkey" PRIMARY KEY ("MetadataId");


--
-- Name: ConsignmentProperty ConProperty_Name; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."ConsignmentProperty"
    ADD CONSTRAINT "ConProperty_Name" UNIQUE ("Name");


--
-- Name: ConsignmentProperty ConProperty_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."ConsignmentProperty"
    ADD CONSTRAINT "ConProperty_pkey" PRIMARY KEY ("Name");


--
-- Name: ConsignmentStatus ConsignmentStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."ConsignmentStatus"
    ADD CONSTRAINT "ConsignmentStatus_pkey" PRIMARY KEY ("ConsignmentStatusId");


--
-- Name: Consignment Consignment_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."Consignment"
    ADD CONSTRAINT "Consignment_pkey" PRIMARY KEY ("ConsignmentId");


--
-- Name: FFIDMetadata FFIDMetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."FFIDMetadata"
    ADD CONSTRAINT "FFIDMetadata_pkey" PRIMARY KEY ("FFIDMetadataId");


--
-- Name: FileMetadata FileMetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."FileMetadata"
    ADD CONSTRAINT "FileMetadata_pkey" PRIMARY KEY ("MetadataId");


--
-- Name: FileProperty FileProperty_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."FileProperty"
    ADD CONSTRAINT "FileProperty_pkey" PRIMARY KEY ("Name");


--
-- Name: FileStatus FileStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."FileStatus"
    ADD CONSTRAINT "FileStatus_pkey" PRIMARY KEY ("FileStatusId");


--
-- Name: File File_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."File"
    ADD CONSTRAINT "File_pkey" PRIMARY KEY ("FileId");


--
-- Name: Series Series_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."Series"
    ADD CONSTRAINT "Series_pkey" PRIMARY KEY ("SeriesId");


--
-- Name: Consignment UniqueConsignmentReference; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."Consignment"
    ADD CONSTRAINT "UniqueConsignmentReference" UNIQUE ("ConsignmentReference");


--
-- Name: Consignment UniqueConsignmentSequence; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."Consignment"
    ADD CONSTRAINT "UniqueConsignmentSequence" UNIQUE ("ConsignmentSequence");


--
-- Name: ConsignmentStatus consignment_status; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."ConsignmentStatus"
    ADD CONSTRAINT consignment_status UNIQUE ("ConsignmentId", "StatusType");


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: avmetadata_fileid_idx; Type: INDEX; Schema: public; Owner: tdr
--

CREATE INDEX avmetadata_fileid_idx ON public."AVMetadata" USING btree ("FileId");


--
-- Name: consignment_consignmentid_consignmentreference_idx; Type: INDEX; Schema: public; Owner: tdr
--

CREATE INDEX consignment_consignmentid_consignmentreference_idx ON public."Consignment" USING btree ("ConsignmentId", "ConsignmentReference");


--
-- Name: ffidmetadata_fileid_ffidmetadataid_idx; Type: INDEX; Schema: public; Owner: tdr
--

CREATE INDEX ffidmetadata_fileid_ffidmetadataid_idx ON public."FFIDMetadata" USING btree ("FileId", "FFIDMetadataId");


--
-- Name: ffidmetadatamatches_ffidmetadataid_idx; Type: INDEX; Schema: public; Owner: tdr
--

CREATE INDEX ffidmetadatamatches_ffidmetadataid_idx ON public."FFIDMetadataMatches" USING btree ("FFIDMetadataId");


--
-- Name: file_allfields_idx; Type: INDEX; Schema: public; Owner: tdr
--

CREATE INDEX file_allfields_idx ON public."File" USING btree ("ConsignmentId", "FileId", "FileType", "FileName", "ParentId", "UserId", "Datetime", "ChecksumMatches");


--
-- Name: file_consignmentid_fileid_index; Type: INDEX; Schema: public; Owner: tdr
--

CREATE INDEX file_consignmentid_fileid_index ON public."File" USING btree ("ConsignmentId", "FileId");


--
-- Name: file_consignmentid_filetype_fileid_idx; Type: INDEX; Schema: public; Owner: tdr
--

CREATE INDEX file_consignmentid_filetype_fileid_idx ON public."File" USING btree ("ConsignmentId", "FileType", "FileId");


--
-- Name: filemetadata_allfields_idx; Type: INDEX; Schema: public; Owner: tdr
--

CREATE INDEX filemetadata_allfields_idx ON public."FileMetadata" USING btree ("FileId", "PropertyName", "Value", "MetadataId", "Datetime", "UserId");


--
-- Name: filemetadata_fileid_propertyname_idx; Type: INDEX; Schema: public; Owner: tdr
--

CREATE INDEX filemetadata_fileid_propertyname_idx ON public."FileMetadata" USING btree ("FileId", "PropertyName");


--
-- Name: fileproperty_allowexport_idx; Type: INDEX; Schema: public; Owner: tdr
--

CREATE INDEX fileproperty_allowexport_idx ON public."FileProperty" USING btree ("AllowExport");


--
-- Name: fileproperty_exportordinal_idx; Type: INDEX; Schema: public; Owner: tdr
--

CREATE INDEX fileproperty_exportordinal_idx ON public."FileProperty" USING btree ("ExportOrdinal");


--
-- Name: filestatus_allfields_idx; Type: INDEX; Schema: public; Owner: tdr
--

CREATE INDEX filestatus_allfields_idx ON public."FileStatus" USING btree ("FileId", "StatusType", "Value", "FileStatusId", "CreatedDatetime");


--
-- Name: filestatus_fileid_statustype_idx; Type: INDEX; Schema: public; Owner: tdr
--

CREATE INDEX filestatus_fileid_statustype_idx ON public."FileStatus" USING btree ("FileId", "StatusType");


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: tdr
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: AVMetadata AVMetadata_Consignment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."AVMetadata"
    ADD CONSTRAINT "AVMetadata_Consignment_fkey" FOREIGN KEY ("FileId") REFERENCES public."File"("FileId");


--
-- Name: ConsignmentMetadata ConMetadata_Consignment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."ConsignmentMetadata"
    ADD CONSTRAINT "ConMetadata_Consignment_fkey" FOREIGN KEY ("ConsignmentId") REFERENCES public."Consignment"("ConsignmentId");


--
-- Name: ConsignmentMetadata ConMetadata_PropertyName_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."ConsignmentMetadata"
    ADD CONSTRAINT "ConMetadata_PropertyName_fkey" FOREIGN KEY ("PropertyName") REFERENCES public."ConsignmentProperty"("Name");


--
-- Name: ConsignmentStatus ConsignmentStatus_Consignment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."ConsignmentStatus"
    ADD CONSTRAINT "ConsignmentStatus_Consignment_fkey" FOREIGN KEY ("ConsignmentId") REFERENCES public."Consignment"("ConsignmentId");


--
-- Name: Consignment Consignment_Body_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."Consignment"
    ADD CONSTRAINT "Consignment_Body_fkey" FOREIGN KEY ("BodyId") REFERENCES public."Body"("BodyId");


--
-- Name: Consignment Consignment_Series_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."Consignment"
    ADD CONSTRAINT "Consignment_Series_fkey" FOREIGN KEY ("SeriesId") REFERENCES public."Series"("SeriesId");


--
-- Name: DisplayProperties DisplayProperties_FileProperty_PropertyName_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."DisplayProperties"
    ADD CONSTRAINT "DisplayProperties_FileProperty_PropertyName_fkey" FOREIGN KEY ("PropertyName") REFERENCES public."FileProperty"("Name");


--
-- Name: FFIDMetadataMatches FFIDMetadataMatches_Metadata_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."FFIDMetadataMatches"
    ADD CONSTRAINT "FFIDMetadataMatches_Metadata_fkey" FOREIGN KEY ("FFIDMetadataId") REFERENCES public."FFIDMetadata"("FFIDMetadataId");


--
-- Name: FFIDMetadata FFIDMetadata_Consignment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."FFIDMetadata"
    ADD CONSTRAINT "FFIDMetadata_Consignment_fkey" FOREIGN KEY ("FileId") REFERENCES public."File"("FileId");


--
-- Name: FileMetadata FileMetadata_FileProperty_PropertyName_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."FileMetadata"
    ADD CONSTRAINT "FileMetadata_FileProperty_PropertyName_fkey" FOREIGN KEY ("PropertyName") REFERENCES public."FileProperty"("Name");


--
-- Name: FileMetadata FileMetadata_File_FileId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."FileMetadata"
    ADD CONSTRAINT "FileMetadata_File_FileId_fkey" FOREIGN KEY ("FileId") REFERENCES public."File"("FileId");


--
-- Name: FilePropertyDependencies FilePropertyDependencies_FileProperty_PropertyName_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."FilePropertyDependencies"
    ADD CONSTRAINT "FilePropertyDependencies_FileProperty_PropertyName_fkey" FOREIGN KEY ("PropertyName") REFERENCES public."FileProperty"("Name");


--
-- Name: FilePropertyValues FilePropertyValues_FileProperty_PropertyName_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."FilePropertyValues"
    ADD CONSTRAINT "FilePropertyValues_FileProperty_PropertyName_fkey" FOREIGN KEY ("PropertyName") REFERENCES public."FileProperty"("Name");


--
-- Name: FileStatus FileStatus_File_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."FileStatus"
    ADD CONSTRAINT "FileStatus_File_fkey" FOREIGN KEY ("FileId") REFERENCES public."File"("FileId");


--
-- Name: File File_Consignment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."File"
    ADD CONSTRAINT "File_Consignment_fkey" FOREIGN KEY ("ConsignmentId") REFERENCES public."Consignment"("ConsignmentId");


--
-- Name: Series Series_Body_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."Series"
    ADD CONSTRAINT "Series_Body_fkey" FOREIGN KEY ("BodyId") REFERENCES public."Body"("BodyId");


--
-- PostgreSQL database dump complete
--

