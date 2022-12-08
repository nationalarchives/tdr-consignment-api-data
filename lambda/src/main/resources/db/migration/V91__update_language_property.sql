-- Delete 'English and Welsh' Language property value as not needed

DELETE FROM "FilePropertyValues"
WHERE "PropertyName" = 'Language'
AND "PropertyValue" = 'English and Welsh';

COMMIT;

-- Make 'Language' property multiple value

UPDATE "FileProperty" SET "MultiValue" = 't' WHERE "Name" = 'Language';

COMMIT;
