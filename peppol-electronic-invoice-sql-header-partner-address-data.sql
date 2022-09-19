CREATE TABLE `peppol_electronic_invoice_header_partner_address_data`
(
    `UBLVersionID`              varchar(4)   NOT NULL,      --<cbc> "2.1"
    `CustomizationID`           varchar(100) NOT NULL,      --<cbc> "urn:cen.eu:en16931:2017#conformant#urn:fdc:peppol.eu:2017:poacc:billing:international:sg:3.0"
    `ProfileID`                 varchar(100) NOT NULL,      --<cbc> "urn:fdc:peppol.eu:2017:poacc:billing:01:1.0"
    `ID`                        varchar(10)  NOT NULL,      --<cbc> "F012345"
    `AddressID`                 varchar(10)  NOT NULL,      --<na> "27518"
    PRIMARY KEY (`ID`, `AddressID`, `UBLVersionID`, `CustomizationID`, `ProfileID`),
    CONSTRAINT `PeppolElectronicInvoiceHeaderPartnerAdressData_fk` FOREIGN KEY (`ID`) REFERENCES `peppol_electronic_invoice_header_data` (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
