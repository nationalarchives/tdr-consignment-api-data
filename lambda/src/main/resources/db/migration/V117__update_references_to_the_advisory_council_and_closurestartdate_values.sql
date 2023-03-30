-- Update references to the Advisory Council & update ClosureStartDate values in the displayProperties table

UPDATE "DisplayProperties"
SET "Value" = 'FOI decision asserted, this is the date that the closure schedule was agreed by the Advisory Council and/or The National Archives SIRO.'
WHERE "PropertyName" = 'FoiExemptionAsserted'
  AND "Attribute" = 'Summary';

UPDATE "DisplayProperties"
SET "Value" = 'Date that the closure schedule was agreed by the Advisory Council and/or The National Archives SIRO.'
WHERE "PropertyName" = 'FoiExemptionAsserted'
  AND "Attribute" = 'Description';

UPDATE "DisplayProperties"
SET "Value" = 'Enter the date of the last change to this record, which is when the closure period will start.'
WHERE "PropertyName" = 'ClosureStartDate'
  AND "Attribute" = 'Description';

UPDATE "DisplayProperties"
SET "Value" = 'Closure start date, this is the date of the last change to this record'
WHERE "PropertyName" = 'ClosureStartDate'
  AND "Attribute" = 'Summary';

COMMIT;
