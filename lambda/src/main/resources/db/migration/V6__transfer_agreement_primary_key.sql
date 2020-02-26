ALTER TABLE TransferAgreement DROP FOREIGN KEY ConsignmentId;
ALTER TABLE TransferAgreement DROP PRIMARY KEY;
ALTER TABLE TransferAgreement ADD TransferAgreementId bigint(20) NOT NULL AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE TransferAgreement ADD KEY Consignment_Id_fkey (ConsignmentId);
ALTER TABLE TransferAgreement ADD CONSTRAINT Consignment_Id_fkey FOREIGN KEY (ConsignmentId) REFERENCES Consignment (ConsignmentId);
