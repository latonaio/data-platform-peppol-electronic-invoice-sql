CREATE TABLE `data_platform_peppol_electronic_invoice_item_data`
(
    `ID`                                                                         varchar(10) NOT NULL,       -- <cbc> "F012345"
    `InvoiceLineID`                                                              varchar(10) NOT NULL,       -- <cbc/cac:InvoiceLine> "1"
    `InvoiceLineNote`                                                            varchar(100) DEFAULT NULL,  -- <cbc/cac:InvoiceLine> "The equipment has 3 year warranty."
    `InvoiceLineInvoicedQuantity                                                 varchar(15) DEFAULT NULL,    -- unitCode="H87"`<cbc/cac:InvoiceLine> "10"
    `InvoiceLineLineExtensionAmount                                              varchar(25) DEFAULT NULL,   -- currencyID="SGD"`<cbc/cac:InvoiceLine> "855.00"
    `InvoiceLineAccountingCost`                                                  varchar(10) DEFAULT NULL,    -- <cbc/cac:InvoiceLine> "Cost id 654"
    `InvoiceLineInvoicePeriodStartDate`                                          varchar(80) DEFAULT NULL,   -- <cbc/cac:InvoiceLineInvoicePeriod/cac:InvoiceLine> "2018-11-01"
    `InvoiceLineInvoicePeriodEndDate`                                            varchar(80) DEFAULT NULL,   -- <cbc/cac:InvoiceLineInvoicePeriod/cac:InvoiceLine> "2018-11-30"
    `InvoiceLineOrderLineReferenceLineID`              　                        varchar(10) DEFAULT NULL,   -- <cbc/cac:InvoiceLineOrderLineReference/cac:InvoiceLine> "1"
    `InvoiceLineDocumentReferenceID                                              varchar(10) DEFAULT NULL,   -- schemeID="ABZ"`<cbc/cac:InvoiceLineDocumentReference/cac:InvoiceLine> "AB-123"
    `InvoiceLineDocumentReferenceDocumentTypeCode`                               varchar(3) DEFAULT NULL,    -- <cbc/cac:InvoiceLineDocumentReference/cac:InvoiceLine> "130"
    `InvoiceLineItemName`                                                        varchar(100) DEFAULT NULL,  -- <cbc/cac:InvoiceLineItem/cac:InvoiceLine> "Yashica MG2"
    `InvoiceLineItemSellersItemIdentificationID`                                 varchar(10) DEFAULT NULL,   -- <cbc/cac:InvoiceLineItemSellersItemIdentification/cac:InvoiceLineItem/cac:InvoiceLine> "Item1"
    `InvoiceLineItemStandardItemIdentificationID`                                varchar(10) DEFAULT NULL,   -- schemeID="0160"<cbc/cac:InvoiceLineItemStandardItemIdentification/cac:InvoiceLineItem/cac:InvoiceLine> "1234567890121"
    `InvoiceLineItemOriginCountryIdentificationCode`                             varchar(2) DEFAULT NULL,    -- <cbc/cac:InvoiceLineItemOriginCountry/cac:InvoiceLineItem/cac:InvoiceLine> "CH"
    `InvoiceLineItemCommodityClassificationItemClassificationCode`               varchar(10) DEFAULT NULL,   -- listID="MP"<cbc/cac:InvoiceLineItemCommodityClassification/cac:InvoiceLineItem/cac:InvoiceLine> "43211503"
    `InvoiceLineItemClassifiedTaxCategoryID`                                     varchar(10) DEFAULT NULL,   -- <cbc/cac:InvoiceLineItemClassifiedTaxCategory/cac:InvoiceLineItem/cac:InvoiceLine> "SR"
    `InvoiceLineItemClassifiedTaxCategoryPercent`                                varchar(6) DEFAULT NULL,    -- <cbc/cac:InvoiceLineItemClassifiedTaxCategory/cac:InvoiceLineItem/cac:InvoiceLine> "7"
    `InvoiceLineItemClassifiedTaxCategoryTaxSchemeID`                            varchar(10) DEFAULT NULL,   -- <cbc/cac:InvoiceLineItemClassifiedTaxCategoryTaxScheme/cac:InvoiceLineItemClassifiedTaxCategory/cac:InvoiceLineItem/cac:InvoiceLine> "GST"
    `InvoiceLineItemAdditionalItemPropertyName`                                  varchar(100) DEFAULT NULL,  -- <cbc/cac:InvoiceLineItemAdditionalItemProperty/cac:InvoiceLineItem/cac:InvoiceLine> "Colour"
    `InvoiceLineItemAdditionalItemPropertyValue`                                 varchar(13) DEFAULT NULL,   -- <cbc/cac:InvoiceLineItemAdditionalItemProperty/cac:InvoiceLineItem/cac:InvoiceLine> "Black"
    `InvoiceLinePricePriceAmount`                                                varchar(13) DEFAULT NULL,   -- currencyID="SGD"`<cbc/cac:InvoiceLinePricePrice/cac:InvoiceLine> "90.00"
    `InvoiceLinePriceBaseQuantity`                                 　            varchar(15) DEFAULT NULL,    -- unitCode="H87"<cbc/cac:InvoiceLinePricePrice/cac:InvoiceLine> "1"
    PRIMARY KEY (`ID`, `InvoiceLineID`),
    CONSTRAINT `DataPlatformPeppolElectronicInvoiceItemData_fk` FOREIGN KEY (`ID`) REFERENCES `data_platform_peppol_electronic_invoice_header_data` (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
