-- First we need to add the FileType property as it does not exist in the table currently
-- We will add it as ordinal 2 becuase it has to come from the File table and it was requested that anything from the 
-- File table comes at the beginning with Filename coming first.

INSERT INTO "FileProperty" 
	("Name", "Description", "FullName", "PropertyType", "Datatype", "Editable", "MultiValue", "PropertyGroup", "ExportOrdinal", "AllowExport" ) 
	VALUES
        ('FileType', 'States if the type is a file or folder', 'File Type', 'System', 'text', false, false, 'MandatoryMetadata', 10 ,true ) ;

-- Next we update all of the properties that will be used in the export csv with ordinals and set to true.
-- we have put Filename as the first ordinal as it comes from the File table.

UPDATE "FileProperty" as p SET
	"AllowExport" = "p1"."AllowExport",
	"ExportOrdinal" = "p1"."ExportOrdinal"
FROM (VALUES
	(true, 5,'Filename'),
	(true, 15, 'ClientSideFileSize'),
	(true, 20, 'ClientSideOriginalFilepath'),
	(true, 25, 'RightsCopyright'),
	(true, 30, 'LegalStatus'),
	(true, 35, 'HeldBy'),
	(true, 40, 'ClientSideFileLastModifiedDate'),
	(true, 45, 'ClosureType'),
	(true, 50, 'ClosureStartDate'),
	(true, 55, 'ClosurePeriod'),
	(true, 60, 'FoiExemptionCode'),
	(true, 65, 'FoiExemptionAsserted'),
	(true, 70, 'TitleClosed'),
	(true, 75, 'TitleAlternate'),
	(true, 80, 'description'),
	(true, 85, 'DescriptionPublic'),
	(true, 90, 'DescriptionAlternate'),
	(true, 95, 'Language'),
	(true, 100, 'date_created'),
	(true, 105, 'date_range'),
	(true, 110, 'end_date'),
	(true, 115, 'start_date'),
	(true, 120, 'file_name_language'),
	(true, 125, 'file_name_translation'),
	(true, 130, 'file_name_translation_language')
) as "p1"("AllowExport", "ExportOrdinal", "Name")
WHERE "p1"."Name" = "p"."Name"
;

-- We noticed that there was not a propertygroup set for ClientSideFileSize
UPDATE "FileProperty" SET "PropertyGroup" = 'System' WHERE "Name" = 'ClientSideFileSize';

COMMIT;
