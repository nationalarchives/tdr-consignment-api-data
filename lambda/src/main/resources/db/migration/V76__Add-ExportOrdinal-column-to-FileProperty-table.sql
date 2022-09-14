-- Add ExportOrdinal column to FileProperty table

ALTER TABLE public."FileProperies"
ADD COLUMN "ExportOrdinal" BOOLEAN NOT NULL DEFAULT FALSE;

CREATE INDEX FileProperty_ExportOrdinal ON public."FileProperty" ("ExportOrdinal");

COMMIT;
