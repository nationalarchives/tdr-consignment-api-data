-- Add OriginalFilepath to the FileProperty table, and mark it for inclusion in the metadata csv.

INSERT INTO "FileProperty"
    ("Name", "Description", "FullName", "PropertyType", 
    "Datatype", "Editable", "MultiValue", "PropertyGroup", "ExportOrdinal", "AllowExport" )
VALUES
    ('OriginalFilepath', 'The original filepath of a redacted file', 'OriginalFilepath', 'System', 
    'text', false, false, 'MandatoryMetadata', 135 , true ) ;
	
COMMIT;
