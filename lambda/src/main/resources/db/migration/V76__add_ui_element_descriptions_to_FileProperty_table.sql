-- This script adds description information used for fields on the 
-- "Add Closure Metadata" page of the TDR web application.

UPDATE public."FileProperty"
SET "Description" = (CASE
                         WHEN "Name" = 'FoiExemptionAsserted'
                         THEN 'Date of the Advisory Council approval (or SIRO approval if appropriate)'

                         WHEN "Name" = 'ClosureStartDate'
                         THEN 'This has been defaulted to the last date modified. If this is not correct, amend the field below.'

                         WHEN "Name" = 'ClosurePeriod'
                         THEN 'Number of years the record is closed from the closure start date'

                         WHEN "Name" = 'FoiExemptionCode'
                         THEN 'Select the exemption code that applies'
                     END);
                     
COMMIT;
