-- Remove fmt/189 PUID from the AllowedPuids table for Judgment

DELETE FROM "AllowedPuids"
WHERE "PUID" = 'fmt/189'
  AND "PUID Description" = 'Microsoft Office Open XML'
  AND "ConsignmentType" = 'judgment';

COMMIT;
