-- Migrate existing Transfer Agreement table data to ConsignmentMetadata table data
-- Each Transfer Agreement table column translates to an individual Consignment Metadata property

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyId", "Value", "UserId")
SELECT
       uuid_generate_v4(),
       "ConsignmentId",
       "PropertyId",
       "AllEnglish",
       "UserId" FROM "TransferAgreement"
       JOIN "Consignment" AS con ("con.ConsignmentId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId"
       JOIN "ConsignmentProperty" ON "Name" = 'AllEnglishConfirmed';

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyId", "Value", "UserId")
SELECT
       uuid_generate_v4(),
       "ConsignmentId",
       "PropertyId",
       "AppraisalSelectionSignedOff",
       "UserId" FROM "TransferAgreement"
       JOIN "Consignment" AS con ("con.ConsignmentId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId"
       JOIN "ConsignmentProperty" ON "Name" = 'AppraisalSelectionSignOffConfirmed';

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyId", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    "PropertyId",
    "AllCrownCopyright",
    "UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId"
    JOIN "ConsignmentProperty" ON "Name" = 'CrownCopyrightConfirmed';

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyId", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    "PropertyId",
    -- New field to be added, assumption that all previous Transfer Agreements are valid
    -- therefore default to true for existing Transfer Agreements
    'false',
    "UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId"
    JOIN "ConsignmentProperty" ON "Name" = 'InitialOpenRecordsConfirmed';

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyId", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    "PropertyId",
    "AllPublicRecords",
    "UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId"
    JOIN "ConsignmentProperty" ON "Name" = 'PublicRecordsConfirmed';

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyId", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    "PropertyId",
    "SensitivityReviewSignedOff",
    "UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId"
    JOIN "ConsignmentProperty" ON "Name" = 'SensitivityReviewSignOffConfirmed';
