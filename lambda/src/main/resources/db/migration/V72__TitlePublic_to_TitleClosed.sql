-- Change name TitlePublic to TitleClosed in FileProperty and FilePropertyValues tables
-- Default PropertyValue to be false.

-- Update Name and FullName in FileProperty table
UPDATE public."FileProperty"
SET "Name" = 'TitleClosed', "FullName" = 'Title Closed'
WHERE "Name" = 'TitlePublic';

-- Update PropertyName, PropertyValue and Default values in the
-- FilePropertyValues table, ensuring 'False' is the default
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
