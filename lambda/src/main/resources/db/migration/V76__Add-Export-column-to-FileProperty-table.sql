-- Add ExportValue column to FileProperty table

ALTER TABLE public."FileProperies"
ADD COLUMN "Export" BOOLEAN NOT NULL DEFAULT FALSE;

CREATE INDEX FileProperty_ExportBool ON public."FileProperty" ("Export");

COMMIT;
