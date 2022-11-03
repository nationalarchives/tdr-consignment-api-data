-- First we need to add the FileType property as it does not exist in the table currently
-- We will add it as ordinal 2 becuase it has to come from the File table and it was requested that anything from the 
-- File table comes at the beginning with Filename coming first.

INSERT INTO "FileProperty" 
	("Name", "Description", "FullName", "PropertyType", "Datatype", "Editable", "MultiValue", "PropertyGroup", "ExportOrdinal", "AllowExport" ) 
	VALUES
        ('FileType', 'States if the type is a file or folder', 'File Type', 'System', 'text', false, false, 'MandatoryMetadata', 2 ,true ) ;

-- Next we update all of the properties that will be used in the export csv with ordinals and set to true.
-- we have put Filename as the first ordinal as it comes from the File table.

UPDATE "FileProperty" as p SET
	"AllowExport" = "p1"."AllowExport",
	"ExportOrdinal" = "p1"."ExportOrdinal"
FROM (VALUES
	(true, 1,'Filename'),
	(true, 3, 'ClientSideFileSize'),
	(true, 4, 'ClientSideOriginalFilepath'),
	(true, 5, 'RightsCopyright'),
	(true, 6, 'LegalStatus'),
	(true, 7, 'HeldBy'),
	(true, 8, 'ClientSideFileLastModifiedDate'),
	(true, 9, 'ClosureType'),
	(true, 10, 'ClosureStartDate'),
	(true, 11, 'ClosurePeriod'),
	(true, 12, 'FoiExemptionCode'),
	(true, 13, 'FoiExemptionAsserted'),
	(true, 14, 'TitleClosed'),
	(true, 15, 'TitleAlternate'),
	(true, 16, 'description'),
	(true, 17, 'DescriptionPublic'),
	(true, 18, 'DescriptionAlternate'),
	(true, 19, 'Language'),
	(true, 20, 'date_created'),
	(true, 21, 'date_range'),
	(true, 22, 'end_date'),
	(true, 23, 'start_date'),
	(true, 24, 'file_name_language'),
	(true, 25, 'file_name_translation'),
	(true, 26, 'file_name_translation_language')
) as "p1"("AllowExport", "ExportOrdinal", "Name")
WHERE "p1"."Name" = "p"."Name"
;

-- We noticed that there was not a propertygroup set for ClientSideFileSize
UPDATE "FileProperty" SET "PropertyGroup" = 'System' WHERE "Name" = 'ClientSideFileSize';

COMMIT;
