-- Add Export column to FileProperty table
-- A boolean, indicating if a property should be included in metadata downloads
-- Indexes added to speed up retrieval and sorting

ALTER TABLE public."FileProperty"
ADD COLUMN "ExportOrdinal" SMALLINT,
ADD COLUMN "AllowExport" BOOLEAN NOT NULL DEFAULT FALSE;

CREATE INDEX FileProperty_ExportOrdinal ON public."FileProperty" ("ExportOrdinal");

CREATE INDEX FileProperty_AllowExport ON public."FileProperty" ("AllowExport");

COMMIT;
