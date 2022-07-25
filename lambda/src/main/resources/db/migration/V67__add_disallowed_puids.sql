-- Zero byte files are not specifically identified by DROID, as assigned no PUID same as an unidentified file format
-- Add a placeholder identifier for zero byte files to still allow filtering by 'Active'

INSERT INTO "DisallowedPuids" ("PUID","PUID Description","Reason", "Active")
VALUES
    ('','Unidentified file','Unidentified', false),
    ('x-fmt/409','MS-DOS Executable','Executable', false),
    ('x-fmt/410','Windows New Executable','Executable', false),
    ('x-fmt/411','Windows Portable Executable','Executable', false),
    ('fmt/899','Windows Portable Executable 32 bit','Executable', false),
    ('fmt/900','Windows Portable Executable 64 bit','Executable', false),
    ('fmt/682','Thumbs DB file','SystemFile', false),
    ('zeroByteFile', 'Identifier for empty file not in PRONOM', 'ZeroByteFile', false);

COMMIT;
