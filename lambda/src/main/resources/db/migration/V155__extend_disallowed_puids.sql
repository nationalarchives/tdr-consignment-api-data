-- TDRD-533 Extend Disallowed PUIDs

UPDATE "DisallowedPuids"
SET "Active" = true
WHERE "PUID" IN ('fmt/682', 'zeroByteFile', 'x-fmt/409', 'x-fmt/410', 'x-fmt/411', 'fmt/899', 'fmt/900');

UPDATE "DisallowedPuids"
SET "Active" = true
WHERE "PUID Description" = 'Unidentified file';

INSERT INTO "DisallowedPuids" ("PUID", "PUID Description", "Reason", "Active")
VALUES ('x-fmt/454', 'Microsoft Internet Shortcut', 'Shortcut', true),
       ('x-fmt/428', 'Microsoft Windows Shortcut', 'Shortcut', true),
       ('x-fmt/45', 'Microsoft Word Document Template', 'Template', true),
       ('fmt/941', 'Back Up File', 'Backup', true),
       ('x-fmt/426', 'License file', 'LicenseContainsRegistrationInformation', true),
       ('fmt/111', 'OLE2 Compound Document Format', 'Zip', true),
       ('fmt/394', 'DS_Store File (MAC)', 'OperatingSystemMac', true),
       ('fmt/473', 'Microsoft Office Owner File', 'OperatingSystemMac', true),
       ('fmt/503', 'AppleDouble Resource Fork', 'OperatingSystemMac', true),
       ('fmt/1672', 'Linux/i386 Binary Executable File ZMAGIC', 'Executable', true),
       ('x-fmt/421', 'Text Configuration file', 'DesktopIni ', true);
COMMIT;
