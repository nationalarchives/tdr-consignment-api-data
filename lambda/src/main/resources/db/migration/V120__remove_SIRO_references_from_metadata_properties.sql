-- Remove SIRO references for the FoiExemptionAsserted property in the displayProperties table

UPDATE "DisplayProperties"
SET "Value" = 'FOI decision asserted, this is the date that the closure schedule was agreed by the Advisory Council and/or The National Archives.'
WHERE "PropertyName" = 'FoiExemptionAsserted'
  AND "Attribute" = 'Summary';

UPDATE "DisplayProperties"
SET "Value" = 'Date that the closure schedule was agreed by the Advisory Council and/or The National Archives.'
WHERE "PropertyName" = 'FoiExemptionAsserted'
  AND "Attribute" = 'Description';

COMMIT;
