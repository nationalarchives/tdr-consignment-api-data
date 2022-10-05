-- Add three foreign key constraints
-- FileProperty.Name as fk to FilePropertyValues.PropertyName
-- FileProperty.Name as fk to FilePropertyDependencies.PropertyName
-- FilePropertyValues.PropertyName as fk to FilePropertyDependencies.PropertyName

ALTER TABLE "FilePropertyValues" ADD CONSTRAINT "FilePropertyValues_FileProperty_PropertyName_fkey"
    FOREIGN KEY ("PropertyName") REFERENCES "FileProperty" ("Name")
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

ALTER TABLE "FilePropertyDependencies" ADD CONSTRAINT "FilePropertyDependencies_PropertyName_FileProperty_fkey"
    FOREIGN KEY ("PropertyName") REFERENCES "FileProperty" ("Name")
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

ALTER TABLE "FilePropertyValues" ADD CONSTRAINT "Dependencies_unique" UNIQUE ("Dependencies");

ALTER TABLE "FilePropertyDependencies" ADD CONSTRAINT "FilePropertyDependencies_FilePropertyValues_GroupId_fkey"
    FOREIGN KEY ("GroupId") REFERENCES "FilePropertyValues" ("Dependencies")
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

COMMIT;
