-- In the FilePropertyDependencies table, change "PropertyName" values
-- TitlePublic--> TitleClosed
-- (There are currently two affected rows).

UPDATE public."FilePropertyDependencies"
SET "PropertyName" = 'TitleClosed'
WHERE "PropertyName" = 'TitlePublic';

COMMIT;
