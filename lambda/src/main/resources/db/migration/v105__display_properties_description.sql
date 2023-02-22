-- Update the description value of the DisplayProperties and insert new details component text.

UPDATE "DisplayProperties"
SET "Value" = 'The description of this record will be visible to the public to help explain its content.'
WHERE "PropertyName" = 'description' AND "Attribute" = 'Description';

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES
    ('description', 'DetailsSummary', 'Is the description sensitive to the public?', 'text'),
    ('description', 'DetailsText', 'If the description of this record contains sensitive information, you must enter the full uncensored version in this field. You can enter an alternative description on the Closure metadata page.', 'text');

COMMIT;
