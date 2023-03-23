UPDATE "Consignment"
SET "IncludeTopLevelFolder" = false
WHERE "IncludeTopLevelFolder" IS NULL
  AND "ConsignmentType" = 'judgment';

COMMIT;
