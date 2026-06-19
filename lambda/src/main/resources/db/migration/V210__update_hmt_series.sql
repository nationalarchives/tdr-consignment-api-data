-- Update HMT series codes to add space between T and numbers
UPDATE "Series"
SET
    "Code" = CASE "Code"
                 WHEN 'T725' THEN 'T 725'
                 WHEN 'T729' THEN 'T 729'
                 WHEN 'T731' THEN 'T 731'
                 WHEN 'T733' THEN 'T 733'
                 WHEN 'T728' THEN 'T 728'
                 ELSE "Code"
        END,
    "Name" = CASE "Name"
                 WHEN 'T725' THEN 'T 725'
                 WHEN 'T729' THEN 'T 729'
                 WHEN 'T731' THEN 'T 731'
                 WHEN 'T733' THEN 'T 733'
                 WHEN 'T728' THEN 'T 728'
                 ELSE "Name"
        END,
    "Description" = CASE "Description"
                        WHEN 'T725' THEN 'T 725'
                        WHEN 'T729' THEN 'T 729'
                        WHEN 'T731' THEN 'T 731'
                        WHEN 'T733' THEN 'T 733'
                        WHEN 'T728' THEN 'T 728'
                        ELSE "Description"
        END
WHERE
    "Code" IN ('T725', 'T729', 'T731', 'T733', 'T728');

--commit changes
COMMIT;