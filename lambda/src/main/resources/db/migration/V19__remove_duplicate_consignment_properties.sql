-- V17 and V18 migrations both add properties named: 'FinalOpenRecordsConfirmed' and 'LegalOwnershipTransferConfirmed'
-- remove the properties and re-add them with new uuids as not clear which version of the properties should be used
DELETE FROM "ConsignmentProperty" WHERE "Name" = 'FinalOpenRecordsConfirmed' OR "Name" = 'LegalOwnershipTransferConfirmed';

INSERT INTO "ConsignmentProperty" ("PropertyId", "Name", "Description", "Shortname")
VALUES (uuid_generate_v4(), 'FinalOpenRecordsConfirmed', '', ''),
       (uuid_generate_v4(), 'LegalOwnershipTransferConfirmed', '', '')
