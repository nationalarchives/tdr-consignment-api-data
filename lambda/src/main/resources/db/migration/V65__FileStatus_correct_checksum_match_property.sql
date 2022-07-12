-- Rename 'ChecksumMatches' StatusType to 'ChecksumMatch' as incorrect name used

UPDATE "FileStatus" SET "StatusType" = 'ChecksumMatch'  WHERE "StatusType" = 'ChecksumMatches';

Commit;
