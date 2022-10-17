CREATE TABLE `data_platform_peppol_electronic_invoice_header_partner_data`
(
    `ID`                          varchar(10) NOT NULL,      -- <cbc> "F012345"
    `PartnerFunction`             varchar(2) NOT NULL,       -- <na> "BL" Partner Function にマッピング済
    `PartnerID`                   varchar(10) NOT NULL,      -- <cbc> "INV0001"
    `PartnerName`                 varchar(100) DEFAULT NULL,  -- <cbc> "IMDA1-Infocomm Media Devt Authority"
    `AddressID`                   int(10) DEFAULT NULL,      -- <na> "27518"
    PRIMARY KEY (`ID`, `PartnerFunction`, `PartnerID`),
    CONSTRAINT `DataPlatformPeppolElectronicInvoiceHeaderPartnerData_fk` FOREIGN KEY (`ID`) REFERENCES `data_platform_peppol_electronic_invoice_header_data` (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
