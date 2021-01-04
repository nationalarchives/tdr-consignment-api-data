-- Migrate existing Transfer Agreement table data to ConsignmentMetadata table data
-- Each Transfer Agreement table column translates to an individual Consignment Metadata property

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyId", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    "prop.PropertyId",
    "AllEnglish",
    "con.UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.SeriesId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId"
    JOIN "ConsignmentProperty" AS prop ("prop.PropertyId", "prop.Name") ON "prop.Name" = 'AllEnglishConfirmed';

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyId", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    "prop.PropertyId",
    "AppraisalSelectionSignedOff",
    "con.UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.SeriesId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId"
    JOIN "ConsignmentProperty"AS prop ("prop.PropertyId", "prop.Name") ON "prop.Name" = 'AppraisalSelectionSignOffConfirmed';

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyId", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    "prop.PropertyId",
    "AllCrownCopyright",
    "con.UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.SeriesId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId"
    JOIN "ConsignmentProperty" AS prop ("prop.PropertyId", "prop.Name") ON "prop.Name" = 'CrownCopyrightConfirmed';

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyId", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    "prop.PropertyId",
    -- New field to be added, assumption that all previous Transfer Agreements are valid
    -- therefore default to true for existing Transfer Agreements
    'true',
    "con.UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.SeriesId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId"
    JOIN "ConsignmentProperty" AS prop ("prop.PropertyId", "prop.Name") ON "prop.Name" = 'InitialOpenRecordsConfirmed';

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyId", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    "prop.PropertyId",
    "AllPublicRecords",
    "con.UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.SeriesId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId"
    JOIN "ConsignmentProperty" AS prop ("prop.PropertyId", "prop.Name") ON "prop.Name" = 'PublicRecordsConfirmed';

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyId", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    "prop.PropertyId",
    "SensitivityReviewSignedOff",
    "con.UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.SeriesId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId"
    JOIN "ConsignmentProperty" AS prop ("prop.PropertyId", "prop.Name") ON "prop.Name" = 'SensitivityReviewSignOffConfirmed';
