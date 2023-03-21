-- Script to update DescriptionClosed and TitleClosed default and data values

UPDATE public."FileMetadata"
SET  "Value" = 'false'
WHERE "PropertyName" = 'DescriptionClosed' and "Value" = 'False';

UPDATE public."FileMetadata"
SET  "Value" = 'true'
WHERE "PropertyName" = 'DescriptionClosed' and "Value" = 'True';

UPDATE public."FileMetadata"
SET  "Value" = 'false'
WHERE "PropertyName" = 'TitleClosed' and "Value" = 'False';

UPDATE public."FileMetadata"
SET  "Value" = 'true'
WHERE "PropertyName" = 'TitleClosed' and "Value" = 'True';

-- Next we update the propertyValue in FilePropertyValues
UPDATE public."FilePropertyValues"
SET  "PropertyValue" = 'false'
WHERE "PropertyName" = 'DescriptionClosed' and "PropertyValue" = 'False';

UPDATE public."FilePropertyValues"
SET  "PropertyValue" = 'true'
WHERE "PropertyName" = 'DescriptionClosed' and "PropertyValue" = 'True';

UPDATE public."FilePropertyValues"
SET  "PropertyValue" = 'false'
WHERE "PropertyName" = 'TitleClosed' and "PropertyValue" = 'False';

UPDATE public."FilePropertyValues"
SET  "PropertyValue" = 'true'
WHERE "PropertyName" = 'TitleClosed' and "PropertyValue" = 'True';

COMMIT;
