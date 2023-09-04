-- Enforce 'camel case' naming for columns
ALTER TABLE "FFIDMetadataMatches" RENAME COLUMN "extensionmismatch" TO "ExtensionMismatch";
ALTER TABLE "FFIDMetadataMatches" RENAME COLUMN "formatname" TO "FormatName";
