-- Delete duplicate FOI exemption codes from the FilePropertyValues table
-- Removes the second instance of the duplicated codes

DELETE FROM "FilePropertyValues"
WHERE "PropertyName" = 'FoiExemptionCode'
AND "PropertyValue" IN ('43(1)','43(2')
AND "Ordinal" IN (34,35);

COMMIT;
