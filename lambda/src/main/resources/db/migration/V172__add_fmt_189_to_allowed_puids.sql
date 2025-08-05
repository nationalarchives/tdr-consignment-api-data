-- Add fmt/189 PUID to the AllowedPuids table for Judgment

INSERT INTO "AllowedPuids" ("PUID","PUID Description","ConsignmentType")
VALUES
    ('fmt/189','Microsoft Office Open XML','judgment');

COMMIT;
