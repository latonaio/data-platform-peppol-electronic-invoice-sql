CREATE TABLE `data_platform_peppol_electronic_invoice_item_partner_data`
(
    `ID`                          varchar(10) NOT NULL,      -- <cbc> "F012345"
    `InvoiceLineID`               varchar(6) NOT NULL,       -- <cbc/cac:InvoiceLine> "1"
    `PartnerFunction`             varchar(2) NOT NULL,       -- <na> "BL" Partner Function にマッピング済
    `PartnerID`                   varchar(10) NOT NULL,      -- <cbc> "INV0001"
    `PartnerName`                 varchar(100) DEFAULT NULL, -- <cbc> "IMDA1-Infocomm Media Devt Authority"
    `AddressID`                   int(12) DEFAULT NULL,      -- <na> "27518"
    PRIMARY KEY (`ID`, `InvoiceLineID`, `PartnerFunction`, `PartnerID`),
    CONSTRAINT `DataPlatformPeppolElectronicInvoiceItemPartnerData_fk` FOREIGN KEY (`ID`, `InvoiceLineID`) REFERENCES `data_platform_peppol_electronic_invoice_item_data` (`ID`, `InvoiceLineID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
