INSERT INTO "MetadataReviewLog" ("MetadataReviewLogId", "ConsignmentId", "UserId", "Action", "EventTime")
SELECT
    gen_random_uuid(),
    cs."ConsignmentId",
    c."UserId",
    'Confirmation',
    cs."CreatedDatetime"
FROM "ConsignmentStatus" cs
         JOIN "Consignment" c ON c."ConsignmentId" = cs."ConsignmentId"
WHERE cs."StatusType" = 'ConfirmTransfer'
  AND cs."Value" = 'Completed'
  AND EXISTS (
    SELECT 1 FROM "MetadataReviewLog" mrl
    WHERE mrl."ConsignmentId" = cs."ConsignmentId"
      AND mrl."Action" = 'Approval'
)
  AND NOT EXISTS (
    SELECT 1 FROM "MetadataReviewLog" mrl
    WHERE mrl."ConsignmentId" = cs."ConsignmentId"
      AND mrl."Action" = 'Confirmation'
);
