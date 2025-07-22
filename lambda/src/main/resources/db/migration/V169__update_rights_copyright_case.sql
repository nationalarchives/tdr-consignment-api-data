-- Update Crown Copyright to Crown copyright (lowercase c)
UPDATE public."FilePropertyValues"
SET "PropertyValue" = 'Crown copyright'
WHERE "PropertyName" = 'RightsCopyright'
AND "PropertyValue" = 'Crown Copyright';

COMMIT;