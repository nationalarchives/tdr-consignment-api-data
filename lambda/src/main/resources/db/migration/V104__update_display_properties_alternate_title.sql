UPDATE "DisplayProperties"
SET "Value" = 'This title will be visible to the public during the closure period.'
WHERE "PropertyName" = 'TitleAlternate'
  AND "Attribute" = 'Description';

COMMIT;
