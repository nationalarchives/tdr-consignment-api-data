-- Delete attribute added to non-existent property

DELETE FROM "DisplayProperties"
       WHERE "Attribute" = 'Required'
       AND "PropertyName" = 'date_created';

COMMIT;

-- Add attribute to correct existing property

INSERT INTO "DisplayProperties" ("PropertyName","Attribute","Value","AttributeType")
VALUES
    ('ClosureType','Required','true','boolean')

COMMIT;
