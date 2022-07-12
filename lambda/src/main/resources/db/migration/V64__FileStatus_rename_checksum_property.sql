-- Rename 'Checksum' StatusType to 'ChecksumMatches' to better reflect what is represents

UPDATE "FileStatus" SET "StatusType" = 'ChecksumMatches'  WHERE "StatusType" = 'Checksum';

Commit;
