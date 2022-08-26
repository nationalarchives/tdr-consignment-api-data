-- This allows us to filter out any non docx files for judgments
INSERT INTO "DisallowedPuids" ("PUID","PUID Description","Reason", "Active")
VALUES
    ('nonJudgmentFormat', 'No specific identifier for non judgment', 'NonJudgmentFormat', true);

COMMIT;
