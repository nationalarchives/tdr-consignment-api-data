--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6 (Debian 11.6-1.pgdg90+1)
-- Dumped by pg_dump version 12.7

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
    "SeriesId" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "Datetime" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "ParentFolder" text,
    "TransferInitiatedDatetime" timestamp with time zone,
    "TransferInitiatedBy" uuid,
    "ExportDatetime" timestamp with time zone,
    "ExportLocation" text,
    "ConsignmentSequence" bigint NOT NULL,
    "ConsignmentReference" text NOT NULL
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
    "Description" text,
    "Shortname" text
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
    "PUID" text
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
    "ChecksumMatches" boolean
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
    "Shortname" text
);


ALTER TABLE public."FileProperty" OWNER TO tdr;

--
-- Name: FileStatus; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."FileStatus" (
    "FileStatusId" uuid NOT NULL,
    "FileId" uuid NOT NULL,
    "StatusType" text NOT NULL,
    "Value" text NOT NULL,
    "CreatedDatetime" timestamp with time zone NOT NULL
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
-- Name: Consignment Consignment_Series_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."Consignment"
    ADD CONSTRAINT "Consignment_Series_fkey" FOREIGN KEY ("SeriesId") REFERENCES public."Series"("SeriesId");


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
-- Name: FileMetadata FileMetadata_Consignment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."FileMetadata"
    ADD CONSTRAINT "FileMetadata_Consignment_fkey" FOREIGN KEY ("FileId") REFERENCES public."File"("FileId");


--
-- Name: FileMetadata FileMetadata_PropertyName; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."FileMetadata"
    ADD CONSTRAINT "FileMetadata_PropertyName" FOREIGN KEY ("PropertyName") REFERENCES public."FileProperty"("Name");


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

