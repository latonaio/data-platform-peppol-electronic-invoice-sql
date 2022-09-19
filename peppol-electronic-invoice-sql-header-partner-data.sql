CREATE TABLE `peppol_electronic_invoice_header_partner_data`
(
    `UBLVersionID`                varchar(4) NOT NULL,       --<cbc> "2.1"
    `CustomizationID`             varchar(100) NOT NULL,     --<cbc> "urn:cen.eu:en16931:2017#conformant#urn:fdc:peppol.eu:2017:poacc:billing:international:sg:3.0"
    `ProfileID`                   varchar(100) NOT NULL,     --<cbc> "urn:fdc:peppol.eu:2017:poacc:billing:01:1.0"
    `ID`                          varchar(10) NOT NULL,      --<cbc> "F012345"
    `PartnerFunction`             varchar(2) NOT NULL,  --     <na> "BP"  -- SAPのBP Role にマッピング済
    `PartnerID`                   varchar(10) NOT NULL, --     <cbc> "INV0001"
    `PartnerName`                 varchar(100) DEFAULT NULL,  -- <cbc> "IMDA1-Infocomm Media Devt Authority"
    PRIMARY KEY (`UBLVersionID`, `CustomizationID`, `ProfileID`, `ID`, `PartnerFunction`, `PartnerID`),
    CONSTRAINT `PeppolElectronicInvoiceHeaderPartnerData_fk` FOREIGN KEY (`ID`) REFERENCES `peppol_electronic_invoice_header_data` (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
