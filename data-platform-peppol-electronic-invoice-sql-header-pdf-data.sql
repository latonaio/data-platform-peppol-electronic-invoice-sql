CREATE TABLE `data_platform_peppol_electronic_invoice_header_pdf_data` -- 新規追加
(
  `ID`                             varchar(10) NOT NULL,      -- <cbc> "F012345"
  `DocType`                        varchar(20) NOT NULL,      -- 新規追加
  `DocVersionID`                   int(4) NOT NULL,           -- 新規追加
  `DocID`                          varchar(100) NOT NULL,     -- 新規追加
  `FileName`                       varchar(200) DEFAULT NULL, -- 新規追加
    PRIMARY KEY (`ID`, `DocType`, `DocVersionID`, `DocID`),
    CONSTRAINT `DataPlatformPeppolElectronicInvoiceHeaderPDFData_fk` FOREIGN KEY (`ID`) REFERENCES `data_platform_peppol_electronic_invoice_header_data` (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
