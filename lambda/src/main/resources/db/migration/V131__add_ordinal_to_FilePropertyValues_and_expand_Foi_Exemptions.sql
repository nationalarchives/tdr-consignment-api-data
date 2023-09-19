-- (TDR-3435) Remove all the existing FOI codes and add them again except '30', '36', '23', '24' and '23/24 - In the alternative' codes

DELETE from "FilePropertyValues"
WHERE "PropertyName" = 'FoiExemptionCode';

INSERT INTO "FilePropertyValues"("PropertyName","PropertyValue","Ordinal")
VALUES
('FoiExemptionCode','27(1)',5),
('FoiExemptionCode','27(2)',10),
('FoiExemptionCode','31',15),
('FoiExemptionCode','33',20),
('FoiExemptionCode','38(1a)',25),
('FoiExemptionCode','38(1b)',30),
('FoiExemptionCode','38(2)',35),
('FoiExemptionCode','40(2)',40),
('FoiExemptionCode','43(1)',45),
('FoiExemptionCode','43(2)',50),
('FoiExemptionCode','22',55),
('FoiExemptionCode','22A',60),
('FoiExemptionCode','26',65),
('FoiExemptionCode','28',70),
('FoiExemptionCode','29',75),
('FoiExemptionCode','32',80),
('FoiExemptionCode','34',85),
('FoiExemptionCode','35',90),
('FoiExemptionCode','37(1)(a)',95),
('FoiExemptionCode','37(1)(aa)',100),
('FoiExemptionCode','37(1)(ab)',105),
('FoiExemptionCode','37(1)(ac)',110),
('FoiExemptionCode','37(1)(ad)',115),
('FoiExemptionCode','37(1)(b)',120),
('FoiExemptionCode','37(2)',125),
('FoiExemptionCode','39',130),
('FoiExemptionCode','40',135),
('FoiExemptionCode','41',140),
('FoiExemptionCode','42',145),
('FoiExemptionCode','43(1)',150),
('FoiExemptionCode','43(2)',155),
('FoiExemptionCode','44',160),
('FoiExemptionCode','EIRs 12(3) & 13',165),
('FoiExemptionCode','EIR 12(5)(a)',170),
('FoiExemptionCode','EIR 12(5)(b)',175),
('FoiExemptionCode','EIR 12(5)(c)',180),
('FoiExemptionCode','EIR 12(5)(d)',185),
('FoiExemptionCode','EIR 12(5)(e)',190),
('FoiExemptionCode','EIR 12(5)(f)',195),
('FoiExemptionCode','EIR 12(5)(g)',200);

COMMIT;
