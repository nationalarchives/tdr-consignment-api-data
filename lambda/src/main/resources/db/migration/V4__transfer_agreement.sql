CREATE TABLE TransferAgreement (
    ConsignmentId bigint(20) NOT NULL,
    AllPublicRecords BOOLEAN DEFAULT NULL,
    AllCrownCopyright BOOLEAN DEFAULT NULL,
    AllEnglish BOOLEAN DEFAULT NULL,
    AllDigital BOOLEAN DEFAULT NULL,
    AppraisalSelectionSignedOff BOOLEAN DEFAULT NULL,
    SensitivityReviewSignedOff BOOLEAN DEFAULT NULL,
    PRIMARY KEY (ConsignmentId),
    CONSTRAINT ConsignmentId FOREIGN KEY (ConsignmentId) REFERENCES Consignment (ConsignmentId)
)
