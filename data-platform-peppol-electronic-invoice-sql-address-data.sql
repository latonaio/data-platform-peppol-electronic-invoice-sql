CREATE TABLE `data_platform_peppol_electronic_invoice_address_data`
(
    `ID`                      int(10) NOT NULL,
    `AddressID`               int(12) NOT NULL,
    `PostalCode`              varchar(10) DEFAULT NULL,
    `LocalRegion`             varchar(3) DEFAULT NULL,
    `Country`                 varchar(3) DEFAULT NULL,
    `District`                varchar(6) DEFAULT NULL,
    `StreetName`              varchar(200) DEFAULT NULL,
    `CityName`                varchar(200) DEFAULT NULL,
    `Building`                varchar(100) DEFAULT NULL,
    `Floor`                   int(4) DEFAULT NULL,
    `Room`                    int(8) DEFAULT NULL,

    PRIMARY KEY (`ID`, `AddressID`),
    
    CONSTRAINT `DataPlatformPeppolElectronicInvoiceAddressData_fk` FOREIGN KEY (`ID`) REFERENCES `data_platform_peppol_electronic_invoice_header_data` (`ID`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
