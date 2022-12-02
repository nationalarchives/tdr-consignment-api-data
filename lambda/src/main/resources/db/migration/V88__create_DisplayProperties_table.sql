-- Create the DisplayProperties table and foreign key constraint

CREATE TABLE "DisplayProperties"
(
   "PropertyName"   text,
   "Attribute"      text,
   "Value"          text,
   "AttributeType"  text
);

ALTER TABLE "DisplayProperties"
  ADD CONSTRAINT "DisplayProperties_FileProperty_PropertyName_fkey" FOREIGN KEY ("PropertyName")
  REFERENCES "FileProperty" ("Name")
  ON UPDATE NO ACTION
  ON DELETE NO ACTION;

COMMIT;
