CREATE TABLE IF NOT EXISTS public."FilePropertyDependenciesV2"
(
    "GroupId"       integer   NOT NULL,
    "PropertyName"  text      NOT NULL,
    "Default"       text
);

INSERT INTO "FilePropertyDependenciesV2" ("GroupId","PropertyName","Default")
VALUES
    (3,'FoiExemptionAsserted',NULL),
    (3,'ClosurePeriod',NULL),
    (3,'ClosureStartDate',NULL),
    (3,'FoiExemptionCode',NULL),
    (1,'DescriptionAlternate','The description of this record is closed'),
    (2,'TitleAlternate','The title of this record is closed');

COMMIT;
