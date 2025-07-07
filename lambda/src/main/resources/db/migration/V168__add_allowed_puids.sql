-- Add fmt/1827 PUID to the AllowedPuids table for Judgment

INSERT INTO "AllowedPuids" ("PUID","PUID Description","ConsignmentType")
VALUES
    ('fmt/1827','DOCX Strict OOXML Document','judgment');

COMMIT;
