-- Migrate existing Transfer Agreement table data to ConsignmentMetadata table data
-- Each Transfer Agreement table column translates to an individual Consignment Metadata property

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyName", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    'AllEnglishConfirmed',
    "AllEnglish",
    "con.UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.SeriesId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId";

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyName", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    'AppraisalSelectionSignOffConfirmed',
    "AppraisalSelectionSignedOff",
    "con.UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.SeriesId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId";

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyName", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    'CrownCopyrightConfirmed',
    "AllCrownCopyright",
    "con.UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.SeriesId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId";

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyName", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    'InitialOpenRecordsConfirmed',
    -- New field to be added, assumption that all previous Transfer Agreements are valid
    -- therefore default to true for existing Transfer Agreements
    'true',
    "con.UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.SeriesId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId";

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyName", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    'PublicRecordsConfirmed',
    "AllPublicRecords",
    "con.UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.SeriesId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId";

INSERT INTO "ConsignmentMetadata" ("MetadataId", "ConsignmentId", "PropertyName", "Value", "UserId")
SELECT
    uuid_generate_v4(),
    "ConsignmentId",
    'SensitivityReviewSignOffConfirmed',
    "SensitivityReviewSignedOff",
    "con.UserId" FROM "TransferAgreement"
    JOIN "Consignment" AS con ("con.ConsignmentId", "con.SeriesId", "con.UserId") ON "ConsignmentId" = "con.ConsignmentId";
