-- Delete FilePropertyDependencies and FilePropertyValues tables
-- Remove unused columns from FileProperty table
DROP TABLE "FilePropertyDependencies";
DROP TABLE "FilePropertyValues";

ALTER TABLE "FileProperty"
    DROP COLUMN "PropertyType",
    DROP COLUMN "Editable",
    DROP COLUMN "MultiValue",
    DROP COLUMN "PropertyGroup",
    DROP COLUMN "UIOrdinal",
    DROP COLUMN "ExportOrdinal",
    DROP COLUMN "AllowExport";
