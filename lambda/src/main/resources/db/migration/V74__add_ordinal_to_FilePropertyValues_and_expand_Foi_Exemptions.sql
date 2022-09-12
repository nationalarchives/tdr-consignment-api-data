--add ordinal column to FilePropertyValues Table

ALTER TABLE "FilePropertyValues"
    ADD COLUMN "Ordinal"  integer;

--Insert FOI exemptions codes. Also removes open as an option listed in FOI exemption codes TDR-2279

DELETE from "FilePropertyValues" 
WHERE "PropertyName" = 'FoiExemptionCode';

INSERT INTO "FilePropertyValues"("PropertyName","PropertyValue","Ordinal")
VALUES
('FoiExemptionCode','27(1)',1),
('FoiExemptionCode','27(2)',2),
('FoiExemptionCode','31',3),
('FoiExemptionCode','33',4),
('FoiExemptionCode','36',5),
('FoiExemptionCode','38(1a)',6),
('FoiExemptionCode','38(1b)',7),
('FoiExemptionCode','38(2)',8),
('FoiExemptionCode','40(2)',9),
('FoiExemptionCode','43(1)',10),
('FoiExemptionCode','43(2)',11),
('FoiExemptionCode','22',12),
('FoiExemptionCode','22A',13),
('FoiExemptionCode','23',14),
('FoiExemptionCode','24',15),
('FoiExemptionCode','23/24 - In the alternative',16),
('FoiExemptionCode','26',17),
('FoiExemptionCode','28',18),
('FoiExemptionCode','29',19),
('FoiExemptionCode','32',20),
('FoiExemptionCode','34',21),
('FoiExemptionCode','35',22),
('FoiExemptionCode','37(1)(a)',23),
('FoiExemptionCode','37(1)(aa)',24),
('FoiExemptionCode','37(1)(ab)',25),
('FoiExemptionCode','37(1)(ac)',26),
('FoiExemptionCode','37(1)(ad)',27),
('FoiExemptionCode','37(1)(b)',28),
('FoiExemptionCode','37(2)',29),
('FoiExemptionCode','39',30),
('FoiExemptionCode','40',31),
('FoiExemptionCode','41',32),
('FoiExemptionCode','42',33),
('FoiExemptionCode','43(1)',34),
('FoiExemptionCode','43(2)',35),
('FoiExemptionCode','44',36),
('FoiExemptionCode','EIRs 12(3) & 13',37),
('FoiExemptionCode','EIR 12(5)(a)',38),
('FoiExemptionCode','EIR 12(5)(b)',39),
('FoiExemptionCode','EIR 12(5)(c)',40),
('FoiExemptionCode','EIR 12(5)(d)',41),
('FoiExemptionCode','EIR 12(5)(e)',42),
('FoiExemptionCode','EIR 12(5)(f)',43),
('FoiExemptionCode','EIR 12(5)(g)',44);

COMMIT;
