-- Add Export column to FileProperty table
-- A boolean, indicating if a property should be included in metadata downloads

ALTER TABLE public."FileProperies"
ADD COLUMN "Export" BOOLEAN NOT NULL DEFAULT FALSE;

CREATE INDEX FileProperty_ExportBool ON public."FileProperty" ("Export");

COMMIT;
