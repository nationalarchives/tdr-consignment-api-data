UPDATE public."FileProperty"
SET "AllowExport" = TRUE
WHERE "Name" IN ('ClientSideOriginalFilepath'
'Filename',
'ClientSideFileSize',
'RightsCopyright',
'LegalStatus',
'HeldBy',
'Language',
'FoiExemptionCode',
'ClientSideFileLastModifiedDate'
);

UPDATE public."FileProperty"
SET "ExportOrdinal" = (CASE
                         WHEN "Name" = 'ClientSideOriginalFilepath'
                         THEN 10

                         WHEN "Name" = 'Filename' 
                         THEN 20

                         WHEN "Name" = 'ClientSideFileSize'
                         THEN 30

                         WHEN "Name" = 'RightsCopyright'
                         THEN 40

                         WHEN "Name" = 'LegalStatus'
                         THEN 50

                         WHEN "Name" = 'HeldBy'
                         THEN 60

                         WHEN "Name" = 'Language'
                         THEN 70

                         WHEN "Name" = 'FoiExemptionCode'
                         THEN 80

                         WHEN "Name" = 'ClientSideFileLastModifiedDate'
                         THEN 90

                     END);
                     
COMMIT;