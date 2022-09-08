-- Update TitlePublic to TitleClosed in FileProperty and FilePropertyValues tables
-- The logic of  values in FilePropertyValues to be reversed 
-- Default value would be false

-- TO VERIFY - Is there a need to update the Dependencies integer field?

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
