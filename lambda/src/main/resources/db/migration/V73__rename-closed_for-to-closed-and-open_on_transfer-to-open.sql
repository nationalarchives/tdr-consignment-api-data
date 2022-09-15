-- Change FilePropertyValues.ClosureType values
-- closed_for --> Closed
-- open_on_transfer --> Open

UPDATE public."FilePropertyValues"
SET "PropertyValue" = 'Closed'
WHERE "PropertyName" = 'ClosureType' AND "PropertyValue" = 'closed_for';

UPDATE public."FilePropertyValues"
SET "PropertyValue" = 'Open'
WHERE "PropertyName" = 'ClosureType' AND "PropertyValue" = 'open_on_transfer';

COMMIT;
