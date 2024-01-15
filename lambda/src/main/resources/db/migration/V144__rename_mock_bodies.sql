-- In the Body table, change "Name" values
-- MOCK1 --> MOCK 1
-- MOCK2 --> MOCK 2
-- MOCK3 --> MOCK 3
-- (There are three affected rows).

UPDATE public."Body" SET "Name" = 'MOCK 1 Department' WHERE "Name" = 'MOCK1 Department';
UPDATE public."Body" SET "Name" = 'MOCK 2 Department' WHERE "Name" = 'MOCK2 Department';
UPDATE public."Body" SET "Name" = 'MOCK 3 Department' WHERE "Name" = 'MOCK3 Department';

COMMIT;
