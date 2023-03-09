INSERT INTO "ConsignmentStatus"
SELECT uuid_generate_v4(), "ConsignmentId", 'ClosureMetadata', 'NotEntered', NOW(), NULL
FROM "Consignment"
WHERE "ConsignmentId" NOT IN (SELECT "ConsignmentId" FROM "ConsignmentStatus" WHERE "StatusType" = 'ClosureMetadata');

INSERT INTO "ConsignmentStatus"
SELECT uuid_generate_v4(), "ConsignmentId", 'DescriptiveMetadata', 'NotEntered', NOW(), NULL
FROM "Consignment"
WHERE "ConsignmentId" NOT IN (SELECT "ConsignmentId" FROM "ConsignmentStatus" WHERE "StatusType" = 'DescriptiveMetadata');

COMMIT;
