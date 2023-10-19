-- Activate 'zero byte file' to be checked for
UPDATE "DisallowedPuids"
    SET "Active" = true WHERE "PUID" = 'zeroByteFile';

COMMIT;
