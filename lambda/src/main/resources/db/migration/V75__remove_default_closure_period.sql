--remove ClosurePeriod row from FilePropertyValues

DELETE from "FilePropertyValues" 
WHERE "PropertyName" = 'ClosurePeriod';

COMMIT;
