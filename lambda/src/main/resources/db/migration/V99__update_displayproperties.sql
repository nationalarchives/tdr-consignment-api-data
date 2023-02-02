-- Update the 'DescriptionAlternate' attribute to large text
-- Insert new attribute AllowFutureDate
-- Delete 'date_created' from displayProperties

UPDATE "DisplayProperties"
SET "Value" = 'large text'
WHERE "PropertyName" = 'DescriptionAlternate' AND "Attribute" = 'ComponentType';

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES ('FoiExemptionAsserted', 'AllowFutureDate', false, 'boolean');

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES ('ClosureStartDate', 'AllowFutureDate', false, 'boolean');

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES ('start_date', 'AllowFutureDate', false, 'boolean');

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES ('end_date', 'AllowFutureDate', false, 'boolean');

DELETE FROM "DisplayProperties" WHERE "PropertyName" = 'date_created';

COMMIT;
