-- correct 'FullName' for properties
-- exclude property from export

UPDATE "FileProperty"
SET  "FullName" = 'former_reference_department'
WHERE "Name" = 'former_reference_department';

UPDATE "FileProperty"
SET  "FullName" = 'creating_body'
WHERE "Name" = 'creating_body';

UPDATE "FileProperty"
SET  "AllowExport" = 'false'
WHERE "Name" = 'creating_body';

COMMIT;
