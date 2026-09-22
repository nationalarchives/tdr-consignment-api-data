-- Add following properties to FileProperty table: CataloguePlacement, CitableRefPrefix, Inventor, FormerFilepathDepartment

INSERT INTO "FileProperty" ("Name", "FullName", "Datatype")
VALUES ('CataloguePlacement', 'catalogue_placement', 'text'),
	   ('CitableRefPrefix', 'citable_ref_prefix', 'text'),
	   ('Inventor', 'inventor', 'text'),
	   ('FormerFilepathDepartment', 'former_filepath_department', 'text');
