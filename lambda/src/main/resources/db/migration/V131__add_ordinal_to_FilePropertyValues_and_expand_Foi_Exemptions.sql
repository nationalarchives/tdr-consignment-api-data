-- (TDR-3435) Remove all the existing FOI codes and add them again except '30', '36', '23', '24' and '23/24 - In the alternative' codes

DELETE from "FilePropertyValues"
WHERE "PropertyName" = 'FoiExemptionCode';

INSERT INTO "FilePropertyValues"("PropertyName","PropertyValue","Ordinal")
VALUES
('FoiExemptionCode','27(1)',1),
('FoiExemptionCode','27(2)',2),
('FoiExemptionCode','31',3),
('FoiExemptionCode','33',4),
('FoiExemptionCode','38(1a)',5),
('FoiExemptionCode','38(1b)',6),
('FoiExemptionCode','38(2)',7),
('FoiExemptionCode','40(2)',8),
('FoiExemptionCode','43(1)',9),
('FoiExemptionCode','43(2)',10),
('FoiExemptionCode','22',11),
('FoiExemptionCode','22A',12),
('FoiExemptionCode','26',13),
('FoiExemptionCode','28',14),
('FoiExemptionCode','29',15),
('FoiExemptionCode','32',16),
('FoiExemptionCode','34',17),
('FoiExemptionCode','35',18),
('FoiExemptionCode','37(1)(a)',19),
('FoiExemptionCode','37(1)(aa)',20),
('FoiExemptionCode','37(1)(ab)',21),
('FoiExemptionCode','37(1)(ac)',22),
('FoiExemptionCode','37(1)(ad)',23),
('FoiExemptionCode','37(1)(b)',24),
('FoiExemptionCode','37(2)',25),
('FoiExemptionCode','39',26),
('FoiExemptionCode','40',27),
('FoiExemptionCode','41',28),
('FoiExemptionCode','42',29),
('FoiExemptionCode','43(1)',30),
('FoiExemptionCode','43(2)',31),
('FoiExemptionCode','44',32),
('FoiExemptionCode','EIRs 12(3) & 13',33),
('FoiExemptionCode','EIR 12(5)(a)',34),
('FoiExemptionCode','EIR 12(5)(b)',35),
('FoiExemptionCode','EIR 12(5)(c)',36),
('FoiExemptionCode','EIR 12(5)(d)',37),
('FoiExemptionCode','EIR 12(5)(e)',38),
('FoiExemptionCode','EIR 12(5)(f)',39),
('FoiExemptionCode','EIR 12(5)(g)',40);

COMMIT;
