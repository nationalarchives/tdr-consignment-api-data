-- Delete attribute added to non-existent property
-- Add attribute to correct existing property

DELETE FROM "DisplayProperties"
       WHERE "Attribute" = 'Required'
       AND "PropertyName" = 'date_created';

COMMIT;

INSERT INTO "DisplayProperties" ("PropertyName","Attribute","Value","AttributeType")
VALUES
    ('ClosureType','Required','true','boolean');

COMMIT;
