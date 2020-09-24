--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6 (Debian 11.6-1.pgdg90+1)
-- Dumped by pg_dump version 11.7 (Debian 11.7-0+deb10u1)

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_with_oids = false;

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
    "Name" text,
    "Code" text,
    "Description" text
);


ALTER TABLE public."Body" OWNER TO tdr;

--
-- Name: ClientFileMetadata; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."ClientFileMetadata" (
    "ClientFileMetadataId" uuid NOT NULL,
    "FileId" uuid NOT NULL,
    "OriginalPath" text,
    "Checksum" text,
    "ChecksumType" text,
    "LastModified" timestamp with time zone NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "Filesize" bigint,
    "Datetime" timestamp with time zone NOT NULL
);


ALTER TABLE public."ClientFileMetadata" OWNER TO tdr;

--
-- Name: Consignment; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."Consignment" (
    "ConsignmentId" uuid NOT NULL,
    "SeriesId" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "Datetime" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "ParentFolder" text
);


ALTER TABLE public."Consignment" OWNER TO tdr;

--
-- Name: ConsignmentMetadata; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."ConsignmentMetadata" (
    "MetadataId" uuid NOT NULL,
    "ConsignmentId" uuid,
    "PropertyId" uuid,
    "Value" text,
    "Datetime" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UserId" uuid NOT NULL
);


ALTER TABLE public."ConsignmentMetadata" OWNER TO tdr;

--
-- Name: ConsignmentProperty; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."ConsignmentProperty" (
    "PropertyId" uuid NOT NULL,
    "Name" text,
    "Description" text,
    "Shortname" text
);


ALTER TABLE public."ConsignmentProperty" OWNER TO tdr;

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
    "PropertyId" uuid NOT NULL,
    "Value" text NOT NULL,
    "Datetime" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UserId" uuid NOT NULL
);


ALTER TABLE public."FileMetadata" OWNER TO tdr;

--
-- Name: FileProperty; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."FileProperty" (
    "PropertyId" uuid NOT NULL,
    "Name" text,
    "Description" text,
    "Shortname" text
);


ALTER TABLE public."FileProperty" OWNER TO tdr;

--
-- Name: Series; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."Series" (
    "SeriesId" uuid NOT NULL,
    "BodyId" uuid NOT NULL,
    "Name" text,
    "Code" text,
    "Description" text
);


ALTER TABLE public."Series" OWNER TO tdr;

--
-- Name: TransferAgreement; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."TransferAgreement" (
    "TransferAgreementId" uuid NOT NULL,
    "ConsignmentId" uuid NOT NULL,
    "AllPublicRecords" boolean,
    "AllCrownCopyright" boolean,
    "AllEnglish" boolean,
    "AllDigital" boolean,
    "AppraisalSelectionSignedOff" boolean,
    "SensitivityReviewSignedOff" boolean
);


ALTER TABLE public."TransferAgreement" OWNER TO tdr;

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
-- Data for Name: AVMetadata; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."AVMetadata" ("FileId", "Software", "SoftwareVersion", "DatabaseVersion", "Result", "Datetime") FROM stdin;
\.


--
-- Data for Name: Body; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."Body" ("BodyId", "Name", "Code", "Description") FROM stdin;
64efba68-e1e4-4aa3-8599-8b2e05b9134b	MOCK1 Department	MOCK1	This is a mock body
49d24d9d-e4c2-4871-9c1a-5b00c9512174	MOCK2 Department	MOCK2	This is a mock body
256090c9-420b-4846-95e1-ed5bbd60043b	MOCK3 Department	MOCK3	This is a mock body
\.


--
-- Data for Name: ClientFileMetadata; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."ClientFileMetadata" ("ClientFileMetadataId", "FileId", "OriginalPath", "Checksum", "ChecksumType", "LastModified", "CreatedDate", "Filesize", "Datetime") FROM stdin;
\.


--
-- Data for Name: Consignment; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."Consignment" ("ConsignmentId", "SeriesId", "UserId", "Datetime", "ParentFolder") FROM stdin;
\.


--
-- Data for Name: ConsignmentMetadata; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyId", "Value", "Datetime", "UserId") FROM stdin;
\.


--
-- Data for Name: ConsignmentProperty; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."ConsignmentProperty" ("PropertyId", "Name", "Description", "Shortname") FROM stdin;
\.


--
-- Data for Name: FFIDMetadata; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."FFIDMetadata" ("FFIDMetadataId", "FileId", "Software", "SoftwareVersion", "Datetime", "BinarySignatureFileVersion", "ContainerSignatureFileVersion", "Method") FROM stdin;
\.


--
-- Data for Name: FFIDMetadataMatches; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."FFIDMetadataMatches" ("FFIDMetadataId", "Extension", "IdentificationBasis", "PUID") FROM stdin;
\.


--
-- Data for Name: File; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."File" ("FileId", "ConsignmentId", "UserId", "Datetime", "ChecksumMatches") FROM stdin;
\.


--
-- Data for Name: FileMetadata; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."FileMetadata" ("MetadataId", "FileId", "PropertyId", "Value", "Datetime", "UserId") FROM stdin;
\.


--
-- Data for Name: FileProperty; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."FileProperty" ("PropertyId", "Name", "Description", "Shortname") FROM stdin;
6a6ecb98-49bf-4386-afa3-4971e962b484	SHA256ServerSideChecksum	The SHA-256 checksum calculated after upload	SHA256Checksum
\.


--
-- Data for Name: Series; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."Series" ("SeriesId", "BodyId", "Name", "Code", "Description") FROM stdin;
b9f46ebc-6061-48f9-9f16-afd3cee32b18	64efba68-e1e4-4aa3-8599-8b2e05b9134b	MOCK1 123	MOCK1 123	This is a mocked series from the MOCK1 body
130c2f74-c066-4886-bf7c-c35d1d169298	49d24d9d-e4c2-4871-9c1a-5b00c9512174	MOCK2 234	MOCK2 234	This is a mocked series from the MOCK2 body
219f0307-0536-40bb-a7ed-d6e268367776	49d24d9d-e4c2-4871-9c1a-5b00c9512174	MOCK2 345	MOCK2 345	This is a mocked series from the MOCK2 body
c8b68f13-5da3-49bd-9706-ad3fd1013649	256090c9-420b-4846-95e1-ed5bbd60043b	MOCK3 456	MOCK3 456	This is a mocked series from the MOCK3 body
\.


--
-- Data for Name: TransferAgreement; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."TransferAgreement" ("TransferAgreementId", "ConsignmentId", "AllPublicRecords", "AllCrownCopyright", "AllEnglish", "AllDigital", "AppraisalSelectionSignedOff", "SensitivityReviewSignedOff") FROM stdin;
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	initial	SQL	V1__initial.sql	388753820	tdr	2020-09-24 16:27:35.729732	58	t
2	2	seed body table	SQL	V2__seed_body_table.sql	325686039	tdr	2020-09-24 16:27:35.799712	3	t
3	3	seed series table	SQL	V3__seed_series_table.sql	1813069702	tdr	2020-09-24 16:27:35.808151	2	t
4	4	fileid not nullable avmetadata table	SQL	V4__fileid_not_nullable_avmetadata_table.sql	1275761246	tdr	2020-09-24 16:27:35.814911	1	t
5	5	add checksum to file property	SQL	V5__add_checksum_to_file_property.sql	1730828915	tdr	2020-09-24 16:27:35.81952	1	t
6	6	set metadata columns not null	SQL	V6__set_metadata_columns_not_null.sql	1641987673	tdr	2020-09-24 16:27:35.824685	1	t
7	7	alter ffid table	SQL	V7__alter_ffid_table.sql	-1147243810	tdr	2020-09-24 16:27:35.832086	10	t
8	8	add-matches-table	SQL	V8__add-matches-table.sql	203221356	tdr	2020-09-24 16:27:35.847754	11	t
9	9	make antivirus fields mandatory	SQL	V9__make_antivirus_fields_mandatory.sql	-140329485	tdr	2020-09-24 16:27:35.864468	2	t
10	10	delete antivirus value column	SQL	V10__delete_antivirus_value_column.sql	-111843522	tdr	2020-09-24 16:27:35.871062	1	t
11	11	add parent folder to consignment	SQL	V11__add_parent_folder_to_consignment.sql	509357678	tdr	2020-09-24 16:27:35.877617	3	t
12	12	add-checksum-validation-column	SQL	V12__add-checksum-validation-column.sql	1652755731	tdr	2020-09-24 16:27:35.884753	1	t
\.


--
-- Name: Body Body_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."Body"
    ADD CONSTRAINT "Body_pkey" PRIMARY KEY ("BodyId");


--
-- Name: ClientFileMetadata ClientFileMetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."ClientFileMetadata"
    ADD CONSTRAINT "ClientFileMetadata_pkey" PRIMARY KEY ("ClientFileMetadataId");


--
-- Name: ConsignmentMetadata ConMetadataId_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."ConsignmentMetadata"
    ADD CONSTRAINT "ConMetadataId_pkey" PRIMARY KEY ("MetadataId");


--
-- Name: ConsignmentProperty ConProperty_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."ConsignmentProperty"
    ADD CONSTRAINT "ConProperty_pkey" PRIMARY KEY ("PropertyId");


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
    ADD CONSTRAINT "FileProperty_pkey" PRIMARY KEY ("PropertyId");


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
-- Name: TransferAgreement TransferAgreement_pkey; Type: CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."TransferAgreement"
    ADD CONSTRAINT "TransferAgreement_pkey" PRIMARY KEY ("TransferAgreementId");


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
-- Name: ClientFileMetadata ClientFileMetadata_Consignment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."ClientFileMetadata"
    ADD CONSTRAINT "ClientFileMetadata_Consignment_fkey" FOREIGN KEY ("FileId") REFERENCES public."File"("FileId");


--
-- Name: ConsignmentMetadata ConMetadata_Consignment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."ConsignmentMetadata"
    ADD CONSTRAINT "ConMetadata_Consignment_fkey" FOREIGN KEY ("ConsignmentId") REFERENCES public."Consignment"("ConsignmentId");


--
-- Name: ConsignmentMetadata ConMetadata_Property_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."ConsignmentMetadata"
    ADD CONSTRAINT "ConMetadata_Property_fkey" FOREIGN KEY ("PropertyId") REFERENCES public."ConsignmentProperty"("PropertyId");


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
-- Name: FileMetadata FileMetadata_Property_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."FileMetadata"
    ADD CONSTRAINT "FileMetadata_Property_fkey" FOREIGN KEY ("PropertyId") REFERENCES public."FileProperty"("PropertyId");


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
-- Name: TransferAgreement TransferAgreement_Consignment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tdr
--

ALTER TABLE ONLY public."TransferAgreement"
    ADD CONSTRAINT "TransferAgreement_Consignment_fkey" FOREIGN KEY ("ConsignmentId") REFERENCES public."Consignment"("ConsignmentId");


--
-- PostgreSQL database dump complete
--

