UPDATE "FileProperty"
SET  "FullName" = 'date_last_modified'
WHERE "Name" = 'ClientSideFileLastModifiedDate';

UPDATE "FileProperty"
SET  "FullName" = 'file_size'
WHERE "Name" = 'ClientSideFileSize';

UPDATE "FileProperty"
SET  "FullName" = 'original_filepath'
WHERE "Name" = 'ClientSideOriginalFilepath';

UPDATE "FileProperty"
SET  "FullName" = 'closure_period'
WHERE "Name" = 'ClosurePeriod';

UPDATE "FileProperty"
SET  "FullName" = 'closure_start_date'
WHERE "Name" = 'ClosureStartDate';

UPDATE "FileProperty"
SET  "FullName" = 'closure_type'
WHERE "Name" = 'ClosureType';

UPDATE "FileProperty"
SET  "FullName" = 'date_created'
WHERE "Name" = 'date_created';

UPDATE "FileProperty"
SET  "FullName" = 'date_range'
WHERE "Name" = 'date_range';

UPDATE "FileProperty"
SET  "FullName" = 'description'
WHERE "Name" = 'description';

UPDATE "FileProperty"
SET  "FullName" = 'description_alternate'
WHERE "Name" = 'DescriptionAlternate';

UPDATE "FileProperty"
SET  "FullName" = 'description_closed'
WHERE "Name" = 'DescriptionClosed';

UPDATE "FileProperty"
SET  "FullName" = 'end_date'
WHERE "Name" = 'end_date';

UPDATE "FileProperty"
SET  "FullName" = 'file_name_language'
WHERE "Name" = 'file_name_language';

UPDATE "FileProperty"
SET  "FullName" = 'file_name_translation'
WHERE "Name" = 'file_name_translation';

UPDATE "FileProperty"
SET  "FullName" = 'file_name_translation_language'
WHERE "Name" = 'file_name_translation_language';

UPDATE "FileProperty"
SET  "FullName" = 'file_name'
WHERE "Name" = 'Filename';

UPDATE "FileProperty"
SET  "FullName" = 'file_type'
WHERE "Name" = 'FileType';

UPDATE "FileProperty"
SET  "FullName" = 'foi_exemption_asserted'
WHERE "Name" = 'FoiExemptionAsserted';

UPDATE "FileProperty"
SET  "FullName" = 'foi_exemption_code'
WHERE "Name" = 'FoiExemptionCode';

UPDATE "FileProperty"
SET  "FullName" = 'held_by'
WHERE "Name" = 'HeldBy';

UPDATE "FileProperty"
SET  "FullName" = 'language'
WHERE "Name" = 'Language';

UPDATE "FileProperty"
SET  "FullName" = 'legal_status'
WHERE "Name" = 'LegalStatus';

UPDATE "FileProperty"
SET  "FullName" = 'original_filepath'
WHERE "Name" = 'OriginalFilepath';

UPDATE "FileProperty"
SET  "FullName" = 'rights_copyright'
WHERE "Name" = 'RightsCopyright';

UPDATE "FileProperty"
SET  "FullName" = 'start_date'
WHERE "Name" = 'start_date';

UPDATE "FileProperty"
SET  "FullName" = 'title_alternate'
WHERE "Name" = 'TitleAlternate';

UPDATE "FileProperty"
SET  "FullName" = 'title_closed'
WHERE "Name" = 'TitleClosed';

COMMIT;
