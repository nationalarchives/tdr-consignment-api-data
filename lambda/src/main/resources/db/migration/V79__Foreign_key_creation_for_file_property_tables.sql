-- Add two foreign key constraints
-- FilePropertyValues.PropertyName as fk to FileProperty.Name
-- FilePropertyDependencies.PropertyName as fk to FileProperty.Name

ALTER TABLE "FilePropertyValues" ADD CONSTRAINT "FilePropertyValues_FileProperty_PropertyName_fkey"
    FOREIGN KEY ("PropertyName") REFERENCES "FileProperty" ("Name")
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

ALTER TABLE "FilePropertyDependencies" ADD CONSTRAINT "FilePropertyDependencies_FileProperty_PropertyName_fkey"
    FOREIGN KEY ("PropertyName") REFERENCES "FileProperty" ("Name")
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

COMMIT;
