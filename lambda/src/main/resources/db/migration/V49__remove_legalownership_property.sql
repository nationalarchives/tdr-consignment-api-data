UPDATE "ConsignmentMetadata" SET "PropertyName" = 'LegalCustodyTransferConfirmed'
WHERE "PropertyName" = 'LegalOwnershipTransferConfirmed';

COMMIT;

DELETE FROM "ConsignmentProperty" WHERE "Name" = 'LegalOwnershipTransferConfirmed';

COMMIT;
