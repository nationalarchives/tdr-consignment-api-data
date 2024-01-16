-- In the Body table, change "Name" values
-- MOCK1 --> Mock 1
-- MOCK2 --> Mock 2
-- MOCK3 --> Mock 3
-- (There are three affected rows).

UPDATE public."Body" SET "Name" = 'Mock 1 Department' WHERE "Name" = 'MOCK1 Department';
UPDATE public."Body" SET "Name" = 'Mock 2 Department' WHERE "Name" = 'MOCK2 Department';
UPDATE public."Body" SET "Name" = 'Mock 3 Department' WHERE "Name" = 'MOCK3 Department';

COMMIT;
