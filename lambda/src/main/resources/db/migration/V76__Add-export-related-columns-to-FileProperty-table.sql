-- Add ExportOrdinal and AllowExport columns to FileProperty table
-- ExportOrdinal is an integer allowing properties to be arbitrarily ordered in an export
-- AllowExport is a boolean, indicating if a property should be included in metadata exports
-- Indexes added to speed up retrieval and sorting

ALTER TABLE public."FileProperty"
ADD COLUMN "ExportOrdinal" SMALLINT,
ADD COLUMN "AllowExport" BOOLEAN NOT NULL DEFAULT FALSE;

CREATE INDEX FileProperty_ExportOrdinal ON public."FileProperty" ("ExportOrdinal");

CREATE INDEX FileProperty_AllowExport ON public."FileProperty" ("AllowExport");

COMMIT;
