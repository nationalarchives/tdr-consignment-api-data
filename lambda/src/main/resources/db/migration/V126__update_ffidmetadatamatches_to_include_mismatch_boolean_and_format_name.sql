ALTER TABLE "FFIDMetadataMatches"
    ADD COLUMN ExtensionMismatch boolean NOT NULL DEFAULT false,
    ADD COLUMN FormatName text NOT NULL;
