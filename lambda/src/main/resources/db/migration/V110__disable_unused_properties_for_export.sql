--script to stop unused properties from making it into the export
UPDATE public."FileProperty"
SET  "AllowExport" = 'false'
WHERE "Name" IN ('date_created','date_range','start_date','file_name_language','file_name_translation_language');

COMMIT;
