-- Insert data into the DisplayProperties table

INSERT INTO "DisplayProperties" ("PropertyName","Attribute","Value","AttributeType") 
VALUES
  ('date_range','Required','false','boolean'),
  ('Filename','Required','true','boolean'),
  ('file_name_translation','Required','false','boolean'),
  ('description','Required','false','boolean'),
  ('DescriptionAlternate','Required','false','boolean'),
  ('ClosurePeriod','Required','true','boolean'),
  ('DescriptionClosed','Required','false','boolean'),
  ('TitleAlternate','Required','false','boolean'),
  ('TitleClosed','Required','true','boolean'),
  ('FoiExemptionCode','Required','true','boolean'),
  ('FoiExemptionAsserted','Required','true','boolean'),
  ('end_date','Required','false','boolean'),
  ('date_created','Required','false','boolean'),
  ('start_date','Required','false','boolean'),
  ('ClosureStartDate','Required','true','boolean'),
  ('Language','Required','true','boolean'),
  ('file_name_language','Required','false','boolean'),
  ('file_name_translation_language','Required','false','boolean');

COMMIT;
