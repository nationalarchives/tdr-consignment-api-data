-- Delete BN body and update BN 116 series to point to MHRA body

UPDATE "Series"
SET "BodyId" = (SELECT "BodyId" FROM "Body" WHERE "TdrCode" = 'TDR-MHRA')
WHERE "Code" = 'BN 116';

DELETE
from "Body"
where "TdrCode" = 'TDR-BN';

--commit changes
COMMIT;
