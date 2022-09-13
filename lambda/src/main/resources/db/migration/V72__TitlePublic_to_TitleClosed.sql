-- Change name TitlePublic to TitleClosed in FileProperty and FilePropertyValues tables
-- Flip the 'True' and 'False' PropertyValue content
-- Set default PropertyValue to be 'False'.

UPDATE public."FileProperty"
SET "Name" = 'TitleClosed', "FullName" = 'Title Closed'
WHERE "Name" = 'TitlePublic';

UPDATE public."FilePropertyValues"
SET "PropertyName" = 'TitleClosed', 
    "PropertyValue" = 'False',
    "Default" = TRUE
WHERE "PropertyName" = 'TitlePublic' AND "PropertyValue" = 'True';

UPDATE public."FilePropertyValues"
SET "PropertyName" = 'TitleClosed', 
    "PropertyValue" = 'True',
    "Default" = NULL
WHERE "PropertyName" = 'TitlePublic' AND "PropertyValue" = 'False';

COMMIT;
 