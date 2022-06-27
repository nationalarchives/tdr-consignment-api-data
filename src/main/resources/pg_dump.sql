--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)test

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
    "ConsignmentType" text
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
    "ExportVersion" text
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
-- Name: DisallowedPuids; Type: TABLE; Schema: public; Owner: tdr
--

CREATE TABLE public."DisallowedPuids" (
    "PUID" text NOT NULL,
    "PUID Description" text NOT NULL,
    "Created Date" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "Modified Date" timestamp with time zone,
    "Reason" text
);


ALTER TABLE public."DisallowedPuids" OWNER TO tdr;

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
    "PropertyGroup" text
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
    "SecondaryValue" integer
);


ALTER TABLE public."FilePropertyValues" OWNER TO tdr;

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
-- Data for Name: AVMetadata; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."AVMetadata" ("FileId", "Software", "SoftwareVersion", "DatabaseVersion", "Result", "Datetime") FROM stdin;
\.


--
-- Data for Name: AllowedPuids; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."AllowedPuids" ("PUID", "PUID Description", "Created Date", "Modified Date", "ConsignmentType") FROM stdin;
fmt/412	Microsoft Word 2007 onwards	2022-06-25 14:40:46.066163+00	\N	judgment
\.


--
-- Data for Name: Body; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."Body" ("BodyId", "Name", "Description", "TdrCode") FROM stdin;
64efba68-e1e4-4aa3-8599-8b2e05b9134b	MOCK1 Department	This is a mock body	MOCK1
49d24d9d-e4c2-4871-9c1a-5b00c9512174	MOCK2 Department	This is a mock body	MOCK2
256090c9-420b-4846-95e1-ed5bbd60043b	MOCK3 Department	This is a mock body	MOCK3
df76bc47-7b29-465f-972e-eb756d6e8fe5	Welsh Government	Welsh Government	TDR-WA
002d4833-bd6e-4343-a40b-74171ce55f9f	Ministry of Justice	Ministry of Justice	TDR-MOJ
0584d976-dbf8-4213-88f2-48ce23b68b0a	Health Research Authority	Health Research Authority	TDR-HRA
6969af6d-6f73-4bdb-8898-dc8764bce274	Royal Mint	Royal Mint	TDR-RMNT
3e62e86f-21d1-44db-8c37-ee1b2e2db872	Supreme Court	Supreme Court	TDR-SC
0aacfca6-dbae-4948-8715-d2962f81f06f	Judicial Office	Judicial Office	TDR-JO
2e62cc10-e550-4cf1-a479-f96514e75c93	HM Courts and Tribunals Service	HM Courts and Tribunals Service	TDR-HMCTS
3bfa5fea-f97b-424b-9c4c-02138ff39863	MOCKA	MockA	TDR-MOCKA
\.


--
-- Data for Name: Consignment; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."Consignment" ("ConsignmentId", "SeriesId", "UserId", "Datetime", "ParentFolder", "TransferInitiatedDatetime", "TransferInitiatedBy", "ExportDatetime", "ExportLocation", "ConsignmentSequence", "ConsignmentReference", "ConsignmentType", "BodyId", "ExportVersion") FROM stdin;
\.


--
-- Data for Name: ConsignmentMetadata; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyName", "Value", "Datetime", "UserId") FROM stdin;
\.


--
-- Data for Name: ConsignmentProperty; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."ConsignmentProperty" ("Name", "Description", "Shortname") FROM stdin;
AllEnglishConfirmed		
AppraisalSelectionSignOffConfirmed		
CrownCopyrightConfirmed		
InitialOpenRecordsConfirmed		
PublicRecordsConfirmed		
SensitivityReviewSignOffConfirmed		
FinalOpenRecordsConfirmed		
LegalCustodyTransferConfirmed		
\.


--
-- Data for Name: ConsignmentStatus; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."ConsignmentStatus" ("ConsignmentStatusId", "ConsignmentId", "StatusType", "Value", "CreatedDatetime", "ModifiedDatetime") FROM stdin;
\.


--
-- Data for Name: DisallowedPuids; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."DisallowedPuids" ("PUID", "PUID Description", "Created Date", "Modified Date", "Reason") FROM stdin;
fmt/494	Microsoft Office Encrypted Document	2022-06-25 14:40:46.078953+00	\N	PasswordProtected
fmt/754	Microsoft Word Document (Password Protected)	2022-06-25 14:40:46.078953+00	\N	PasswordProtected
fmt/755	Microsoft Word Document Template (Password Protected)	2022-06-25 14:40:46.078953+00	\N	PasswordProtected
fmt/289	WARC Web ARChive file format	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/329	Shell Archive Format	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/508	Quarter Inch Cartridge Host Interchange Format	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/600	eXtensible ARchive format	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/610	ARJ File Format	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/613	RAR Archive	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/614	Windows Imaging Format	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/625	Apple Disk Copy Image	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/626	LHA File Format	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/639	Stuffit Archive File	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/656	KryoFlux	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/726	Virtual Disk Image	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/842	AccessData Custom Content Image	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/843	AccessData Custom Content Image (Encrypted)	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/844	Advanced Forensic Format	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/850	NuFile Exchange Archival Library	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/866	Apple Safari Webarchive	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/887	SafeGuard Encrypted Virtual Disk	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1070	Preferred Executable Format	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1071	Apple Disk Image	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1087	FAT Disk Image	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1095	PEA Archive Format	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1096	FreeArc Archive Format	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1097	ZPAQ Archive Format	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1098	XZ File Format	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1100	yEnc Encoded File	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1102	Uuencoded File	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1105	Hierarchical File System	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1190	Adobe SWC Package	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1242	ZFO (Form) File	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1243	ZFO (Message) File	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1244	ZFO (Sent Message)	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1245	ZFO (Proof of Delivery) File	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1251	Electronically Certified Document (EDOC)	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1252	Raw Flux Image	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1281	WARC 1.1	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1340	BDOC 1	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1341	ASICS	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1355	WARC 1.0	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1361	Amiga Disk File	2022-06-25 14:40:46.078953+00	\N	Zip
fmt/1399	DiskDoubler.	2022-06-25 14:40:46.078953+00	\N	Zip
x-fmt/157	Interchange File	2022-06-25 14:40:46.078953+00	\N	Zip
x-fmt/219	Alexa Archive File	2022-06-25 14:40:46.078953+00	\N	Zip
x-fmt/263	ZIP Format	2022-06-25 14:40:46.078953+00	\N	Zip
x-fmt/265	Tape Archive Format	2022-06-25 14:40:46.078953+00	\N	Zip
x-fmt/266	GZIP Format	2022-06-25 14:40:46.078953+00	\N	Zip
x-fmt/267	BZIP Compressed Archive	2022-06-25 14:40:46.078953+00	\N	Zip
x-fmt/268	BZIP2 Compressed Archive	2022-06-25 14:40:46.078953+00	\N	Zip
x-fmt/269	ZOO Compressed Archive	2022-06-25 14:40:46.078953+00	\N	Zip
x-fmt/412	Java Archive Format	2022-06-25 14:40:46.078953+00	\N	Zip
x-fmt/416	BinHex Binary Text	2022-06-25 14:40:46.078953+00	\N	Zip
x-fmt/429	MHTML	2022-06-25 14:40:46.078953+00	\N	Zip
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

COPY public."File" ("FileId", "ConsignmentId", "UserId", "Datetime", "ChecksumMatches", "FileType", "FileName", "ParentId") FROM stdin;
\.


--
-- Data for Name: FileMetadata; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."FileMetadata" ("MetadataId", "FileId", "Value", "Datetime", "UserId", "PropertyName") FROM stdin;
\.


--
-- Data for Name: FileProperty; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."FileProperty" ("Name", "Description", "FullName", "CreatedDatetime", "ModifiedDatetime", "PropertyType", "Datatype", "Editable", "MultiValue", "PropertyGroup") FROM stdin;
Language	\N	Language	2022-06-25 14:40:45.89662+00	\N	Defined	text	t	f	OptionalMetadata
HeldBy	\N	Held By	2022-06-25 14:40:45.89662+00	\N	Defined	text	f	f	MandatoryMetadata
LegalStatus	\N	Legal Status	2022-06-25 14:40:45.89662+00	\N	Defined	text	t	f	MandatoryMetadata
RightsCopyright	\N	Rights Copyright	2022-06-25 14:40:45.89662+00	\N	Defined	text	t	f	MandatoryMetadata
SHA256ClientSideChecksum	The sha256 checksum, generated on the client side	Checksum	2022-06-25 14:40:45.89662+00	\N	System	text	f	f	MandatoryMetadata
ClientSideFileSize	The size of the file	File Size	2022-06-25 14:40:45.89662+00	\N	System	decimal	f	f	\N
SHA256ServerSideChecksum	The SHA-256 checksum calculated after upload	Server Checksum	2022-06-25 14:40:45.89662+00	\N	System	text	f	f	System
date_created	\N	Date Created	2022-06-25 14:40:45.89662+00	\N	Supplied	datetime	t	f	OptionalMetadata
date_range	\N	Date range	2022-06-25 14:40:45.89662+00	\N	Supplied	text	t	f	OptionalMetadata
description	\N	Description	2022-06-25 14:40:45.89662+00	\N	Supplied	text	t	f	OptionalMetadata
end_date	\N	End date	2022-06-25 14:40:45.89662+00	\N	Supplied	datetime	t	f	OptionalMetadata
start_date	\N	Start date	2022-06-25 14:40:45.89662+00	\N	Supplied	datetime	t	f	OptionalMetadata
file_name_language	\N	File name language	2022-06-25 14:40:45.89662+00	\N	Supplied	text	t	f	OptionalMetadata
file_name_translation	\N	File name translation	2022-06-25 14:40:45.89662+00	\N	Supplied	text	t	f	OptionalMetadata
file_name_translation_language	\N	File name translation language	2022-06-25 14:40:45.89662+00	\N	Supplied	text	t	f	OptionalMetadata
ClientSideFileLastModifiedDate	The last modified date of the file	Last Modified Date	2022-06-25 14:40:45.89662+00	\N	System	datetime	f	f	MandatoryMetadata
Filename	\N	Filename	2022-06-25 14:40:45.89662+00	\N	System	text	f	f	MandatoryMetadata
ClientSideOriginalFilepath	The originalfile path	Filepath	2022-06-25 14:40:45.89662+00	\N	System	text	f	f	MandatoryMetadata
ClosureType	\N	Closure Type	2022-06-25 14:40:45.89662+00	\N	Defined	text	t	f	MandatoryClosure
ClosurePeriod	\N	Closure Period	2022-06-25 14:40:45.89662+00	\N	Supplied	integer	t	f	MandatoryClosure
DescriptionPublic	\N	Description Public	2022-06-25 14:40:45.89662+00	\N	Supplied	boolean	t	f	MandatoryClosure
TitlePublic	\N	Title Public	2022-06-25 14:40:45.89662+00	\N	Supplied	boolean	t	f	MandatoryClosure
ClosureStartDate	\N	Closure Start Date	2022-06-25 14:40:45.89662+00	\N	Supplied	datetime	t	f	OptionalClosure
DescriptionAlternate	\N	Description Alternate	2022-06-25 14:40:45.89662+00	\N	Supplied	text	t	f	OptionalClosure
TitleAlternate	\N	Title Alternate	2022-06-25 14:40:45.89662+00	\N	Supplied	text	t	f	OptionalClosure
FoiExemptionAsserted	\N	Foi Exemption Asserted	2022-06-25 14:40:45.89662+00	\N	Supplied	datetime	t	f	MandatoryClosure
FoiExemptionCode	\N	Foi Exemption Code	2022-06-25 14:40:45.89662+00	\N	Defined	text	t	t	MandatoryClosure
\.


--
-- Data for Name: FilePropertyDependencies; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."FilePropertyDependencies" ("GroupId", "PropertyName", "Default") FROM stdin;
3	FoiExemptionAsserted	\N
3	ClosurePeriod	\N
3	ClosureStartDate	\N
3	FoiExemptionCode	\N
1	DescriptionAlternate	The description of this record is closed
2	TitleAlternate	The title of this record is closed
3	TitlePublic	\N
3	DescriptionPublic	\N
4	TitlePublic	\N
4	DescriptionPublic	\N
\.


--
-- Data for Name: FilePropertyValues; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."FilePropertyValues" ("PropertyName", "PropertyValue", "Default", "Dependencies", "SecondaryValue") FROM stdin;
Language	English	t	\N	\N
RightsCopyright	Crown Copyright	t	\N	\N
LegalStatus	Public Record(s)	t	\N	\N
LegalStatus	Not Public Record(s)	\N	\N	\N
LegalStatus	Welsh Public Record(s)	\N	\N	\N
ClosurePeriod	0	t	\N	\N
FoiExemptionCode	open	t	\N	\N
Language	Welsh	\N	\N	\N
Language	English and Welsh	\N	\N	\N
RightsCopyright	Non Crown Copyright	\N	\N	\N
ClosureType	open_on_transfer	t	\N	\N
TitlePublic	False	\N	2	\N
ClosureType	closed_for	\N	3	\N
HeldBy	The National Archives, Kew	t	\N	\N
FoiExemptionCode	24	\N	\N	\N
FoiExemptionCode	26	\N	\N	\N
FoiExemptionCode	27(1)	\N	\N	\N
FoiExemptionCode	27(2)	\N	\N	\N
FoiExemptionCode	29	\N	\N	\N
FoiExemptionCode	30(1)	\N	\N	\N
FoiExemptionCode	30(2)	\N	\N	\N
FoiExemptionCode	34	\N	\N	\N
FoiExemptionCode	38	\N	\N	\N
FoiExemptionCode	39	\N	\N	\N
FoiExemptionCode	40(2)	\N	\N	\N
FoiExemptionCode	41	\N	\N	\N
FoiExemptionCode	43	\N	\N	\N
FoiExemptionCode	44	\N	\N	\N
DescriptionPublic	True	t	\N	\N
FoiExemptionCode	23	\N	\N	\N
DescriptionPublic	False	\N	1	\N
FoiExemptionCode	28	\N	\N	30
FoiExemptionCode	31	\N	\N	100
FoiExemptionCode	32	\N	\N	20
FoiExemptionCode	33	\N	\N	20
FoiExemptionCode	35(1)(a)	\N	\N	20
FoiExemptionCode	35(1)(b)	\N	\N	20
FoiExemptionCode	35(1)(c)	\N	\N	20
FoiExemptionCode	35(1)(d)	\N	\N	20
FoiExemptionCode	36	\N	\N	20
FoiExemptionCode	37(1)(a)	\N	\N	20
FoiExemptionCode	37(1)(aa)	\N	\N	20
FoiExemptionCode	37(1)(ac)	\N	\N	20
FoiExemptionCode	37(1)(ad)	\N	\N	20
FoiExemptionCode	37(1)(b)	\N	\N	60
FoiExemptionCode	42	\N	\N	20
FoiExemptionCode	43(1)	\N	\N	30
FoiExemptionCode	43(2)	\N	\N	30
TitlePublic	True	t	4	\N
\.


--
-- Data for Name: FileStatus; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."FileStatus" ("FileStatusId", "FileId", "StatusType", "Value", "CreatedDatetime") FROM stdin;
\.


--
-- Data for Name: Series; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public."Series" ("SeriesId", "BodyId", "Name", "Code", "Description") FROM stdin;
5d458207-93e4-4f34-bb94-5c5e18d80316	64efba68-e1e4-4aa3-8599-8b2e05b9134b	MOCK1 123	MOCK1 123	This is a mocked series from the MOCK1 body
acabeb5a-d51b-491e-9f99-7a351252d350	49d24d9d-e4c2-4871-9c1a-5b00c9512174	MOCK2 234	MOCK2 234	This is a mocked series from the MOCK2 body
8be45307-a2a2-469e-b9f3-c42572625152	49d24d9d-e4c2-4871-9c1a-5b00c9512174	MOCK2 345	MOCK2 345	This is a mocked series from the MOCK2 body
76a612c6-6ac9-4440-a894-e5a697e21285	256090c9-420b-4846-95e1-ed5bbd60043b	MOCK3 456	MOCK3 456	This is a mocked series from the MOCK3 body
935d3099-6082-41fb-b3db-093dde256460	df76bc47-7b29-465f-972e-eb756d6e8fe5	WA 20	WA 20	WA 20
721e8ecb-08df-4799-9f5d-1bc1d8ed0532	002d4833-bd6e-4343-a40b-74171ce55f9f	LCO 72	LCO 72	LCO 72
aa04eb1d-2f0e-46d7-aa94-5c0ab466d36d	0584d976-dbf8-4213-88f2-48ce23b68b0a	JA 899	JA 899	JA 899
fc136d48-a553-44b5-84bf-eef55756eba5	6969af6d-6f73-4bdb-8898-dc8764bce274	MINT 25	MINT 25	MINT 25
a669f5a6-9f2d-406f-8d17-589c5f511501	3bfa5fea-f97b-424b-9c4c-02138ff39863	MOCKA 101	MOCKA 101	MOCKA 101
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: tdr
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	initial	SQL	V1__initial.sql	388753820	tdr	2022-06-25 15:40:45.167964	78	t
2	2	seed body table	SQL	V2__seed_body_table.sql	325686039	tdr	2022-06-25 15:40:45.260864	14	t
3	3	seed series table	SQL	V3__seed_series_table.sql	1813069702	tdr	2022-06-25 15:40:45.283398	18	t
4	4	fileid not nullable avmetadata table	SQL	V4__fileid_not_nullable_avmetadata_table.sql	1275761246	tdr	2022-06-25 15:40:45.315458	8	t
5	5	add checksum to file property	SQL	V5__add_checksum_to_file_property.sql	1730828915	tdr	2022-06-25 15:40:45.340586	11	t
6	6	set metadata columns not null	SQL	V6__set_metadata_columns_not_null.sql	1641987673	tdr	2022-06-25 15:40:45.368509	11	t
7	7	alter ffid table	SQL	V7__alter_ffid_table.sql	-1147243810	tdr	2022-06-25 15:40:45.449233	6	t
8	8	add-matches-table	SQL	V8__add-matches-table.sql	203221356	tdr	2022-06-25 15:40:45.462076	12	t
9	9	make antivirus fields mandatory	SQL	V9__make_antivirus_fields_mandatory.sql	-140329485	tdr	2022-06-25 15:40:45.479603	3	t
10	10	delete antivirus value column	SQL	V10__delete_antivirus_value_column.sql	-111843522	tdr	2022-06-25 15:40:45.487373	1	t
11	11	add parent folder to consignment	SQL	V11__add_parent_folder_to_consignment.sql	509357678	tdr	2022-06-25 15:40:45.493969	9	t
12	12	add-checksum-validation-column	SQL	V12__add-checksum-validation-column.sql	1652755731	tdr	2022-06-25 15:40:45.507175	1	t
13	13	drop-metadata-created-date	SQL	V13__drop-metadata-created-date.sql	-1275196446	tdr	2022-06-25 15:40:45.513232	2	t
14	14	add-transfer-initiated-export-completed	SQL	V14__add-transfer-initiated-export-completed.sql	52633621	tdr	2022-06-25 15:40:45.523555	1	t
15	15	add-client-side-properties-to-file-property	SQL	V15__add-client-side-properties-to-file-property.sql	-952468615	tdr	2022-06-25 15:40:45.529642	5	t
16	16	drop alldigital from transfer agreement	SQL	V16__drop_alldigital_from_transfer_agreement.sql	-1086086338	tdr	2022-06-25 15:40:45.539114	4	t
17	17	add-transfer-summary-properties-to-consignment-property	SQL	V17__add-transfer-summary-properties-to-consignment-property.sql	-255062987	tdr	2022-06-25 15:40:45.548026	2	t
18	18	add transfer agreement properties to consignment properties	SQL	V18__add_transfer_agreement_properties_to_consignment_properties.sql	2064201265	tdr	2022-06-25 15:40:45.557737	2	t
19	19	remove duplicate consignment properties	SQL	V19__remove_duplicate_consignment_properties.sql	-1577053168	tdr	2022-06-25 15:40:45.56718	2	t
20	20	ensure property names unique	SQL	V20__ensure_property_names_unique.sql	-1988304288	tdr	2022-06-25 15:40:45.585213	17	t
21	21	change consignment metata foreign key	SQL	V21__change_consignment_metata_foreign_key.sql	1598376756	tdr	2022-06-25 15:40:45.605432	18	t
22	22	use property name in file metadata	SQL	V22__use_property_name_in_file_metadata.sql	-1136598841	tdr	2022-06-25 15:40:45.628509	7	t
23	23	migrate transfer agreements to consigment metadata	SQL	V23__migrate_transfer_agreements_to_consigment_metadata.sql	1300308932	tdr	2022-06-25 15:40:45.643134	5	t
24	24	consignmentmetadata make fields mandatory	SQL	V24__consignmentmetadata_make_fields_mandatory.sql	-2045935451	tdr	2022-06-25 15:40:45.651667	3	t
25	25	drop transfer agreement table	SQL	V25__drop_transfer_agreement_table.sql	-423580116	tdr	2022-06-25 15:40:45.664147	1	t
26	26	remove unused file metadata columns	SQL	V26__remove_unused_file_metadata_columns.sql	-1377014526	tdr	2022-06-25 15:40:45.67011	9	t
27	27	add-consignment-seq-and-reference	SQL	V27__add-consignment-seq-and-reference.sql	-537040181	tdr	2022-06-25 15:40:45.684467	12	t
28	28	add default file metadata properties	SQL	V28__add_default_file_metadata_properties.sql	856283781	tdr	2022-06-25 15:40:45.701064	3	t
29	29	rename consignment seq	SQL	V29__rename_consignment_seq.sql	494722225	tdr	2022-06-25 15:40:45.707979	1	t
30	30	add consignment ref existing rows	SQL	V30__add_consignment_ref_existing_rows.sql	1613657644	tdr	2022-06-25 15:40:45.714204	15	t
31	31	add consignment status table	SQL	V31__add_consignment_status_table.sql	-1005883243	tdr	2022-06-25 15:40:45.737663	11	t
32	32	add file status table	SQL	V32__add_file_status_table.sql	222769388	tdr	2022-06-25 15:40:45.75229	10	t
33	33	alter consignment status table	SQL	V33__alter_consignment_status_table.sql	-2082502743	tdr	2022-06-25 15:40:45.765895	4	t
34	34	remove default consignment sequence	SQL	V34__remove_default_consignment_sequence.sql	1743717285	tdr	2022-06-25 15:40:45.774705	6	t
35	35	rename body code	SQL	V35__rename_body_code.sql	-1563102969	tdr	2022-06-25 15:40:45.784395	2	t
36	36	create real body and series	SQL	V36__create_real_body_and_series.sql	399227197	tdr	2022-06-25 15:40:45.800189	7	t
37	37	create hra body and series	SQL	V37__create_hra_body_and_series.sql	653202897	tdr	2022-06-25 15:40:45.806737	2	t
38	38	create consignmentType column	SQL	V38__create_consignmentType_column.sql	2094497657	tdr	2022-06-25 15:40:45.820784	2	t
39	39	add-judgment-confirm-transfer-properties-to-consignment-property	SQL	V39__add-judgment-confirm-transfer-properties-to-consignment-property.sql	1336737680	tdr	2022-06-25 15:40:45.824387	1	t
40	40	make series nullable	SQL	V40__make_series_nullable.sql	424196020	tdr	2022-06-25 15:40:45.841155	7	t
41	41	backfill bodyid consignment table	SQL	V41__backfill_bodyid_consignment_table.sql	1934004917	tdr	2022-06-25 15:40:45.848046	2	t
42	42	backfill consignment type	SQL	V42__backfill_consignment_type.sql	-382184288	tdr	2022-06-25 15:40:45.85456	2	t
43	43	create mint25 series and body	SQL	V43__create_mint25_series_and_body.sql	-950960330	tdr	2022-06-25 15:40:45.861618	3	t
44	44	add file parent details	SQL	V44__add_file_parent_details.sql	-1916836460	tdr	2022-06-25 15:40:45.882832	10	t
45	45	add fileid consignmentid index	SQL	V45__add_fileid_consignmentid_index.sql	-717949478	tdr	2022-06-25 15:40:45.886438	3	t
46	46	update file property	SQL	V46__update_file_property.sql	-1856675162	tdr	2022-06-25 15:40:45.907845	11	t
47	47	create file property values	SQL	V47__create_file_property_values.sql	695573316	tdr	2022-06-25 15:40:45.920319	7	t
48	48	create file property dependencies	SQL	V48__create_file_property_dependencies.sql	200914252	tdr	2022-06-25 15:40:45.929576	5	t
49	49	remove legalownership property	SQL	V49__remove_legalownership_property.sql	-1077220306	tdr	2022-06-25 15:40:45.946413	12	t
50	50	add export version	SQL	V50__add_export_version.sql	1068332357	tdr	2022-06-25 15:40:45.950039	2	t
51	51	create supreme court body	SQL	V51__create_supreme_court_body.sql	2130968376	tdr	2022-06-25 15:40:45.956485	1	t
52	52	create judicial office body	SQL	V52__create_judicial_office_body.sql	220207667	tdr	2022-06-25 15:40:45.962019	1	t
53	53	folder data backfill	SQL	V53__folder_data_backfill.sql	463546616	tdr	2022-06-25 15:40:45.977452	7	t
54	54	rename multivalue	SQL	V54__rename_multivalue.sql	111815213	tdr	2022-06-25 15:40:45.981002	1	t
55	55	create hmcts body	SQL	V55__create_hmcts_body.sql	-2111082383	tdr	2022-06-25 15:40:45.986257	16	t
56	56	update judgment pilot transferring body	SQL	V56__update_judgment_pilot_transferring_body.sql	-2122954037	tdr	2022-06-25 15:40:46.013968	7	t
57	57	ClosureMetadataUpdates	SQL	V57__ClosureMetadataUpdates.sql	-292171532	tdr	2022-06-25 15:40:46.028804	10	t
58	58	Add new MOCKA dept	SQL	V58__Add_new_MOCKA_dept.sql	2017784282	tdr	2022-06-25 15:40:46.054032	21	t
59	59	create allowedpuids 	SQL	V59__create_allowedpuids_.sql	-1122927621	tdr	2022-06-25 15:40:46.072031	5	t
60	60	create disallowedpuids 	SQL	V60__create_disallowedpuids_.sql	508401137	tdr	2022-06-25 15:40:46.089857	10	t
\.


--
-- Name: consignment_sequence_id; Type: SEQUENCE SET; Schema: public; Owner: tdr
--

SELECT pg_catalog.setval('public.consignment_sequence_id', 1, false);


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
-- Name: file_consignmentid_fileid_index; Type: INDEX; Schema: public; Owner: tdr
--

CREATE INDEX file_consignmentid_fileid_index ON public."File" USING btree ("ConsignmentId", "FileId");


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

