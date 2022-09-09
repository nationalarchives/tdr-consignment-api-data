--From a comment 

-- FilePropertyValues table

-- ClosureType values
    -- closed_for
    -- open_on_transfer

-- Once again these are DRI terms TDR could just use Open or Closed

-- But we need to make sure closed_until is not something that TDR would consider. In which case TRE wouldn’t know what to change it to.

-- Is TDR giving the user a chance to change these from default?.
-- If not we could remove all but one for the time being:

--  LegalStatus
    -- Public Record(s)
    -- Welsh Public Record(s)
    -- Not Public Record(s)

-- RightsCopyright
    -- Crown Copyright
    -- Non Crown Copyright


--Assuming we will remove all but the current default value

DELETE from public."FilePropertyValues"
WHERE "PropertyName" = 'LegalStatus' 
AND "PropertyValue" IN ('Welsh Public Record(s)', 'Not Public Record(s)', 'Non Crown Copyright');

-- Commenting out until I have an answer on if the following are in fact required

-- UPDATE public."FilePropertyValues"
-- SET "PropertyValue" = 'closed', 
-- WHERE "PropertyName" = 'ClosureType' AND "PropertyValue" = 'closed_for';

-- UPDATE public."FilePropertyValues"
-- SET "PropertyValue" = 'open', 
-- WHERE "PropertyName" = 'ClosureType' AND "PropertyValue" = 'open_on_transfer';

COMMIT;
