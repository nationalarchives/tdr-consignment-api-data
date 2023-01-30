-- Update the displayProperties

UPDATE "DisplayProperties"
SET "Value" = 'Date of the Advisory Council approval.'
WHERE "PropertyName" = 'FoiExemptionAsserted' AND "Attribute" = 'Description';

UPDATE "DisplayProperties"
SET "Value" = 'The date of the last meaningful change to this record.'
WHERE "PropertyName" = 'ClosureStartDate' AND "Attribute" = 'Description';

UPDATE "DisplayProperties"
SET "Value" = 'This is the number of years the record is closed from the closure start date. If your file has multiple closure periods, enter the longest.'
WHERE "PropertyName" = 'ClosurePeriod' AND "Attribute" = 'Description';

UPDATE "DisplayProperties"
SET "Value" = 'FOI exemption code'
WHERE "PropertyName" = 'FoiExemptionCode' AND "Attribute" = 'Name';

UPDATE "DisplayProperties"
SET "Value" = 'Is the title sensitive for the public?'
WHERE "PropertyName" = 'TitleClosed' AND "Attribute" = 'Name';

UPDATE "DisplayProperties"
SET "Value" = 'Is the description sensitive for the public?'
WHERE "PropertyName" = 'DescriptionClosed' AND "Attribute" = 'Name';

UPDATE "DisplayProperties"
SET "Value" = 'Add alternative title without file extension'
WHERE "PropertyName" = 'TitleAlternate' AND "Attribute" = 'Name';

UPDATE "DisplayProperties"
SET "Value" = 'Alternative description'
WHERE "PropertyName" = 'DescriptionAlternate' AND "Attribute" = 'Name';

UPDATE "DisplayProperties"
SET "Value" = ''
WHERE "PropertyName" = 'TitleClosed' AND "Attribute" = 'Description';

UPDATE "DisplayProperties"
SET "Value" = 'The current description of your record is below. You can edit it in the Descriptive metadata step.'
WHERE "PropertyName" = 'DescriptionClosed' AND "Attribute" = 'Description';

COMMIT;
