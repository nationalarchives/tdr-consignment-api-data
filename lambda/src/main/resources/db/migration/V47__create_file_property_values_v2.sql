CREATE TABLE IF NOT EXISTS public."FilePropertyValuesV2"
(
    "PropertyName"      text          NOT NULL,
    "PropertyValue"     text          NOT NULL,
    "Default"           boolean,
    "Dependencies"      integer,
    "SecondaryValue"    integer
);

COMMIT;
