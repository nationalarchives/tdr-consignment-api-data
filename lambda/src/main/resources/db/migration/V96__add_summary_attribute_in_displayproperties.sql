-- Insert Summary in the DisplayProperties table

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES
  ('description', 'Summary', 'Description', 'text'),
  ('Language', 'Summary', 'Language', 'text'),
  ('file_name_translation', 'Summary', 'Translated title of record', 'text'),
  ('date_created', 'Summary', 'Date of the record', 'text'),
  ('FoiExemptionAsserted', 'Summary', 'FOI decision asserted, this is the date of the Advisory Council approval', 'text'),
  ('ClosureStartDate', 'Summary', 'Closure start date, this is the date the record starts', 'text'),
  ('ClosurePeriod', 'Summary', 'Closure period', 'text'),
  ('FoiExemptionCode', 'Summary', 'FOI exemption code', 'text'),
  ('TitleAlternate', 'Summary', 'Alternative title', 'text'),
  ('DescriptionAlternate', 'Summary', 'Alternative description', 'text');

COMMIT;
