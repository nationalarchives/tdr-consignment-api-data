-- Update the 'DescriptionAlternate' attribute to large text & Insert new attribute FutureDateAllowed

UPDATE "DisplayProperties"
SET "Value" = 'large text'
WHERE "PropertyName" = 'DescriptionAlternate'
  AND "Attribute" = 'ComponentType';

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES ('FoiExemptionAsserted', 'FutureDateAllowed', false, 'boolean');

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES ('ClosureStartDate', 'FutureDateAllowed', true, 'boolean');

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES ('start_date', 'FutureDateAllowed', true, 'boolean');

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES ('end_date', 'FutureDateAllowed', true, 'boolean');

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES ('date_created', 'FutureDateAllowed', true, 'boolean');

COMMIT;
