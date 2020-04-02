CREATE TABLE consignmentapi."TransferAgreement" (
    "TransferAgreementId" uuid NOT NULL,
    "ConsignmentId" uuid NOT NULL,
    "AllPublicRecords" BOOLEAN DEFAULT NULL,
    "AllCrownCopyright" BOOLEAN DEFAULT NULL,
    "AllEnglish" BOOLEAN DEFAULT NULL,
    "AllDigital" BOOLEAN DEFAULT NULL,
    "AppraisalSelectionSignedOff" BOOLEAN DEFAULT NULL,
    "SensitivityReviewSignedOff" BOOLEAN DEFAULT NULL,
    CONSTRAINT "TransferAgreement_pkey" PRIMARY KEY ("TransferAgreementId"),
    CONSTRAINT "TransferAgreement_Consignment_fkey" FOREIGN KEY ("ConsignmentId")
        REFERENCES consignmentapi."Consignment" ("ConsignmentId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)