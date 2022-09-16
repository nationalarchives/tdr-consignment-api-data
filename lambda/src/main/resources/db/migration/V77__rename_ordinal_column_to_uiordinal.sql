-- Rename "Ordinal" column to "UIOrdinal" in the FileProperty table.

ALTER TABLE  "FileProperty"  RENAME COLUMN "Ordinal" TO "UIOrdinal";

COMMIT;