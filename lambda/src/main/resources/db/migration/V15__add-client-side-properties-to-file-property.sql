INSERT INTO "FileProperty" ("PropertyId", "Name", "Description", "Shortname")
VALUES (uuid_generate_v4(), 'ClientSideOriginalFilepath', 'The originalfile path', 'ClientOriginalFilepath'),
       (uuid_generate_v4(), 'ClientSideFileLastModifiedDate', 'The last modified date of the file',
        'ClientFileLastModifiedDate'),
       (uuid_generate_v4(), 'ClientSideFileSize', 'The size of the file', 'ClientFileSize'),
       (uuid_generate_v4(), 'SHA256ClientSideChecksum', 'The sha256 checksum, generated on the client side',
        'SHA256ClientChecksum');
