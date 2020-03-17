ALTER TABLE ClientFileMetadata DROP FOREIGN KEY ClientFileMetadata_ibfk_1;
ALTER TABLE ClientFileMetadata MODIFY COLUMN FileId bigint(20) NOT NULL;
ALTER TABLE ClientFileMetadata DROP PRIMARY KEY;
ALTER TABLE ClientFileMetadata ADD ClientFileMetadataId bigint(20) NOT NULL auto_increment PRIMARY KEY;
ALTER TABLE ClientFileMetadata ADD KEY File_Id_fkey (FileId);
ALTER TABLE ClientFileMetadata ADD CONSTRAINT File_Id_fkey FOREIGN KEY (FileId) REFERENCES File (FileId);