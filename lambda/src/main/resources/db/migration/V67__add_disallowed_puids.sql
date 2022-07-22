INSERT INTO "DisallowedPuids" ("PUID","PUID Description","Reason", "Active")
VALUES
    ('','Unidentified file','Unidentified', false),
    ('x-fmt/409','MS-DOS Executable','Executable', false),
    ('x-fmt/410','Windows New Executable','Executable', false),
    ('x-fmt/411','Windows Portable Executable','Executable', false),
    ('fmt/899','Windows Portable Executable	32 bit','Executable', false),
    ('fmt/900','Windows Portable Executable	64 bit','Executable', false),
    ('fmt/682','Thumbs DB file','SystemFile', false);

COMMIT;
