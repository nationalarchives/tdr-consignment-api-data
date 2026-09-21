-- Add following properties to FileProperty table: CataloguePlacement, CitableRefPrefix, Inventor, FormerFilepathDepartment


INSERT INTO "FileProperty" ("Name", "FullName", "Datatype")
VALUES ('CataloguePlacement', 'CataloguePlacement', 'text'),
	   ('CitableRefPrefix', 'CitableRefPrefix', 'text'),
	   ('Inventor', 'Inventor', 'text'),
	   ('FormerFilepathDepartment', 'FormerFilepathDepartment', 'text');
