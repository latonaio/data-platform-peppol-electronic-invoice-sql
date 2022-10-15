# peppol-electronic-invoice-sql

peppol-electronic-invoice-sql　は、Peppol における電子インボイスデータを維持管理する SQL テーブルを作成するためのレポジトリです。  

## peppolとは

Peppol（ペポル）とは、受発注や請求にかかる電子文書をネットワーク上でやり取りするための「文書仕様」「ネットワーク」「運用ルール」の国際規格です。  
国際的な非営利組織であるOPEN PEPPOLが管理しており、「操作がシンプルで、導入のハードルが低い」「ユーザー間でデータ連携が進み、業務コストの削減が実現できている」といった高評価をされています。  
日本におけるデジタルインボイス推進協議会では、来たるインボイス制度の導入に向け、2023年10月にはどの企業でも「電子インボイスありき」で業務が行われていることを目指し、今後は「Peppol（ペポル）」をベースにして、2021年6月末を目処に日本の法令や商慣習などに対応した“日本標準仕様”を策定・公開ができるよう進めています。  
Github（ https://github.com/OpenPEPPOL/peppol-bis-invoice-3 ）も公開されていますので、参照ください。

## 前提条件

peppol-electronic-invoice-sql は、データ連携にあたり、API を利用し、本レポジトリ の sql 設定ファイルの内容は、下記 URL の API 仕様を前提としています。
https://api.XXXXXXXX.com/api/OP_API_XXXXXXX_XXX/overview  

## sql の設定ファイル

peppol-electronic-invoice-sql には、sql の設定ファイルとして以下の sql ファイルが含まれています。

* peppol-electronic-invoice-sql-header-data.sql（Peppol 電子インボイス - ヘッダデータ）
* peppol-electronic-invoice-sql-header-partner-data.sql（Peppol 電子インボイス - ヘッダ取引先データ）
* peppol-electronic-invoice-sql-item-data.sql（Peppol 電子インボイス - 明細データ）
* peppol-electronic-invoice-sql-item-partner-data.sql（Peppol 電子インボイス - 明細取引先データ）

## パートナーファンクション

peppol-electronic-invoice-sql では、パートナーファンクションによって、関係者が分類されています。  
パートナーファンクションを用いて、Peppolの請求書データに関するパートナーテーブルを定義することにより、Peppolのデータ項目を整理し、データ項目の種類の総量を削減して、より効率的な、Peppolデータフォーマット体系のデータマネジメントを行うことができます。    

peppol-electronic-invoice-sql におけるパートナーファンクションは、2桁のコードで例示され、  

* ID / 請求主体 : IV
* AccountingCustomerParty / 請求先 : BL
* AccountingSupplierParty / 仕入先 : SP
* Payee / 受取人 : RV

となっています。  
（上記は例であり、用途に応じて任意のパートナーファンクションを定義してください）

## マッピング表

| No. | Peppol　主テーブル名 | Peppol 主項目名 | データ連携基盤 主項目名 | データ連携基盤 主レポジトリ名 | データ連携基盤 主テーブル名 | データ連携基盤 項目名 | 備考 |
| - | - | - | - | - | - | - | - |
| 1 | Header | UBLVersionID | NA | NA | NA | NA | バージョンの表現は、GiHub のタグで？ |
| 2 | Header | CustomizationID | NA | NA | NA | NA | バージョンの表現は、GiHub のタグで？ |
| 3 | Header | ProfileID | NA | NA | NA | NA | バージョンの表現は、GiHub のタグで？ |
| 4 | Header | ID | BusinessPartner | InvoiceDocumentSQL | InvoiceDocumentHeader | ビジネスパートナ |  |
| 5 | Header | IssueDate | InvoiceDocumentDate | InvoiceDocumentSQL | InvoiceDocumentHeader | 請求伝票日付 |  |
| 6 | Header | DueDate | NA | NA | NA | NA | DueCalculationBaseDate, NetPaymentDays の組合せで対応 |
| 7 | Header | InvoiceTypeCode | InvoiceDocumentType | InvoiceDocumentSQL | InvoiceDocumentHeader | 請求伝票タイプ |  |
| 8 | Header | Note | DocumentHeaderText | InvoiceDocumentSQL | InvoiceDocumentHeader | 請求書ヘッダテキスト |  |
| 9 | Header | DocumentCurrencyCode | TransactionCurrency | InvoiceDocumentSQL | InvoiceDocumentItem | 取引通貨 |  |
| 10 | Header | AccountingCost | NA | NA | NA | NA |  |
| 11 | Header | BuyerReference | BillToParty | InvoiceDocumentSQL | InvoiceDocumentHeader | 請求先 |  |
| 12 | Header | InvoicePeriodStartDate | NA | NA | NA | NA | 当該機能は存在しない |
| 13 | Header | InvoicePeriodEndDate | DueCalculationBaseDate | InvoiceDocumentSQL | InvoiceDocumentHeader | 期日計算基準日 |  |
| 14 | Header | OrderReferenceID | OrderID | InvoiceDocumentSQL | InvoiceDocumentItem | オーダー番号 |  |
| 15 | Header | OrderReferenceSalesOrderID | NA | NA | NA | NA |  |
| 16 | Header | BillingReferenceInvoiceDocumentReferenceID | InvoiceDocument | InvoiceDocumentSQL | InvoiceDocumentHeader | 請求伝票番号 |  |
| 17 | Header | BillingReferenceInvoiceDocumentReferenceIssueDate | NA | NA | NA | NA |  |
| 18 | Header | DespatchDocumentReferenceID | ReferenceDocument | InvoiceDocumentSQL | InvoiceDocumentItem | 参照伝票 | 主に入出荷伝票番号が設定される。 |
| 19 | Header | ReceiptDocumentReferenceID | ReferenceDocument | InvoiceDocumentSQL | InvoiceDocumentItem | 参照伝票 | 主に入出荷伝票番号が設定される。 |
| 20 | Header | OriginatorDocumentReferenceID | OriginDocument | InvoiceDocumentSQL | InvoiceDocumentItem | 原始伝票 |  |
| 21 | Header | ContractDocumentReferenceID | ContractID | InvoiceDocumentSQL | InvoiceDocumentItem | 契約番号 |  |
| 22 | Header | AdditionalDocumentReferenceID>doc1< | ExternalReferenceDocument | InvoiceDocumentSQL | InvoiceDocumentHeader | 外部参照伝票 |  |
| 23 | Header | AdditionalDocumentReferenceDocumentDescription>doc1< | ExternalReferenceDocumentItem | InvoiceDocumentSQL | InvoiceDocumentItem | 外部参照伝票明細 |  |
| 24 | Header | AdditionalDocumentReferenceAttachmentExternalReferenceURI>doc1< | NA | NA | NA | NA | CreatesPDF API で attach する。 |
| 25 | Header | AdditionalDocumentReferenceID>doc2< | NA | NA | NA | NA |  |
| 26 | Header | AdditionalDocumentReferenceDocumentDescription>doc2< | NA | NA | NA | NA |  |
| 27 | Header | AdditionalDocumentReferenceAttachmentEmbeddedDocumentBinaryObject>doc2< | NA | NA | NA | NA | CreatesPDF API で attach する。 |
| 28 | Header | AdditionalDocumentReferenceID>other< | NA | NA | NA | NA |  |
| 29 | Header | AdditionalDocumentReferenceDocumentTypeCode>other< | NA | NA | NA | NA |  |
| 30 | Header | ProjectReferenceID | Project | InvoiceDocumentSQL | InvoiceDocumentItem | プロジェクト |  |
| 31 | Header | AccountingSupplierPartyPartyEndpointID | NA | NA | NA | NA |  |
| 32 | Header | AccountingSupplierPartyPartyPartyIdentificationID | SupplyFromParty | InvoiceDocumentSQL | InvoiceDocumentHeader | 仕入先 |  |
| 33 | Header | AccountingSupplierPartyPartyPartyTaxSchemeCompanyID | NA | NA | NA | NA |  |
| 34 | Header | AccountingSupplierPartyPartyPartyTaxSchemeTaxSchemeID | NA | NA | NA | NA |  |
| 35 | Header | AccountingCustomerPartyPartyEndpointID | NA | NA | NA | NA |  |
| 36 | Header | AccountingCustomerPartyPartyPartyIdentificationID | SoldToParty | InvoiceDocumentSQL | InvoiceDocumentHeader | 受注先 |  |
| 37 | Header | PayeePartyPartyIdentificationID | PartnerFunctionBusinessPartner | InvoiceDocumentSQL | InvoiceDocumentHeader | 取引先ビジネスパートナ | PartnerFunctionが"RV"(受取人)の > PartnerFunction BusinessPartner |
| 38 | Header | TaxRepresentativePartyPartyTaxSchemeCompanyID | NA | NA | NA | NA |  |
| 39 | Header | TaxRepresentativePartyPartyTaxSchemeTaxSchemeID | NA | NA | NA | NA |  |
| 40 | Header | DeliveryActualDeliveryDate | NA | NA | NA | NA |  |
| 41 | Header | DeliveryDeliveryLocationID | IssuingPlant | InvoiceDocumentSQL | InvoiceDocumentItem | 出荷プラント |  |
| 42 | Header | PaymentMeansPaymentMeansCode | PaymentMethod | InvoiceDocumentSQL | InvoiceDocumentHeader | 支払方法 |  |
| 43 | Header | PaymentMeansPaymentID | NA | NA | NA | NA |  |
| 44 | Header | TaxTotalTaxAmount | TaxAmount | InvoiceDocumentSQL | InvoiceDocumentHeader | 消費税額 |  |
| 45 | Header | TaxTotalTaxSubtotalTaxableAmount | NetAmount | InvoiceDocumentSQL | InvoiceDocumentItem | 正味請求総額 |  |
| 46 | Header | TaxTotalTaxSubtotalTaxAmount | TaxAmount | InvoiceDocumentSQL | InvoiceDocumentHeader | 消費税額 |  |
| 47 | Header | TaxTotalTaxSubtotalTaxCategoryID | TaxCode | InvoiceDocumentSQL | InvoiceDocumentItem | 消費税コード |  |
| 48 | Header | TaxTotalTaxSubtotalTaxCategoryPercent | NA | NA | NA | NA |  |
| 49 | Header | TaxTotalTaxSubtotalTaxCategoryTaxSchemeID | NA | NA | NA | NA |  |
| 50 | Header | LegalMonetaryTotalLineExtensionAmount | NA | NA | NA | NA |  |
| 51 | Header | LegalMonetaryTotalTaxExclusiveAmount | TotalNetAmount | InvoiceDocumentSQL | InvoiceDocumentHeader | 正味請求総額 |  |
| 52 | Header | LegalMonetaryTotalTaxInclusiveAmount | TotalGrossAmount | InvoiceDocumentSQL | InvoiceDocumentHeader | 総額 |  |
| 53 | Header | LegalMonetaryTotalAllowanceTotalAmount | NA | NA | NA | NA |  |
| 54 | Header | LegalMonetaryTotalChargeTotalAmount | NA | NA | NA | NA |  |
| 55 | Header | LegalMonetaryTotalPrepaidAmount | NA | NA | NA | NA |  |
| 56 | Header | LegalMonetaryTotalPayableRoundingAmount | NA | NA | NA | NA |  |
| 57 | Header | LegalMonetaryTotalPayableAmount | NA | NA | NA | NA |  |
| 58 | HeaderPartner | UBLVersionID | NA | NA | NA | NA |  |
| 59 | HeaderPartner | CustomizationID | NA | NA | NA | NA |  |
| 60 | HeaderPartner | ProfileID | NA | NA | NA | NA |  |
| 61 | HeaderPartner | ID | BusinessPartner | InvoiceDocumentSQL | InvoiceDocumentHeaderPartner | ビジネスパートナ |  |
| 62 | HeaderPartner | PartnerFunction | PartnerFunction | InvoiceDocumentSQL | InvoiceDocumentHeaderPartner | 取引先機能 |  |
| 63 | HeaderPartner | PartnerID | PartnerFunctionBusinessPartner | InvoiceDocumentSQL | InvoiceDocumentHeaderPartner | ビジネスパートナコード |  |
| 64 | HeaderPartner | PartnerName | NA | NA | NA | NA | ビジネスパートナマスタで管理 |
| 65 | HeaderPartner | AddressID | AddressID | InvoiceDocumentSQL | InvoiceDocumentHeaderPartner | 住所ID |  |
| 66 | Item | UBLVersionID | NA | NA | NA | NA |  |
| 67 | Item | CustomizationID | NA | NA | NA | NA |  |
| 68 | Item | ProfileID | NA | NA | NA | NA |  |
| 69 | Item | ID | BusinessPartner | InvoiceDocumentSQL | InvoiceDocumentHeader | ビジネスパートナ |  |
| 70 | Item | InvoiceLineID | InvoiceDocumentItem | InvoiceDocumentSQL | InvoiceDocumentItem | 請求伝票明細 |  |
| 71 | Item | InvoiceLineNote | InvoiceDocumentItemText | InvoiceDocumentSQL | InvoiceDocumentItem | 請求伝票明細テキスト |  |
| 72 | Item | InvoiceLineInvoicedQuantity | InvoiceQuantity | InvoiceDocumentSQL | InvoiceDocumentItem | 請求数量 |  |
| 73 | Item | InvoiceLineLineExtensionAmount | NA | NA | NA | NA |  |
| 74 | Item | InvoiceLineAccountingCost | NA | NA | NA | NA |  |
| 75 | Item | InvoiceLineInvoicePeriodStartDate | NA | NA | NA | NA |  |
| 76 | Item | InvoiceLineInvoicePeriodEndDate | NA | NA | NA | NA |  |
| 77 | Item | InvoiceLineOrderLineReferenceLineID | OrderItem | InvoiceDocumentSQL | InvoiceDocumentItem | オーダー明細番号 |  |
| 78 | Item | InvoiceLineDocumentReferenceID | NA | NA | NA | NA |  |
| 79 | Item | InvoiceLineDocumentReferenceDocumentTypeCode | DocumentItemCategory | InvoiceDocumentSQL | InvoiceDocumentItem | 伝票明細カテゴリ |  |
| 80 | Item | InvoiceLineItemName | Product | InvoiceDocumentSQL | InvoiceDocumentItem | 品目コード |  |
| 81 | Item | InvoiceLineItemSellersItemIdentificationID | NA | NA | NA | NA |  |
| 82 | Item | InvoiceLineItemStandardItemIdentificationID | ProductStandardID | InvoiceDocumentSQL | InvoiceDocumentItem | 品目グループ |  |
| 83 | Item | InvoiceLineItemOriginCountryIdentificationCode | CountryOfOrigin | InvoiceDocumentSQL | InvoiceDocumentItem | 原産国 |  |
| 84 | Item | InvoiceLineItemCommodityClassificationItemClassificationCode | NA | NA | NA | NA |  |
| 85 | Item | InvoiceLineItemClassifiedTaxCategoryID | TaxCode | InvoiceDocumentSQL | InvoiceDocumentItem | 消費税コード |  |
| 86 | Item | InvoiceLineItemClassifiedTaxCategoryPercent | NA | NA | NA | NA |  |
| 87 | Item | InvoiceLineItemClassifiedTaxCategoryTaxSchemeID | NA | NA | NA | NA |  |
| 88 | Item | InvoiceLineItemAdditionalItemPropertyName | NA | NA | NA | NA |  |
| 89 | Item | InvoiceLineItemAdditionalItemPropertyValue | NA | NA | NA | NA |  |
| 90 | Item | InvoiceLinePricePriceAmount | ConditionRateValue | InvoiceDocumentSQL | InvoiceDocumentItemPricingElement | 条件レート値 |  |
| 91 | Item | InvoiceLinePriceBaseQuantity | ConditionQuantity | InvoiceDocumentSQL | InvoiceDocumentItemPricingElement | 条件数量 |  |
| 92 | ItemPartner | UBLVersionID | NA | NA | NA | NA |  |
| 93 | ItemPartner | CustomizationID | NA | NA | NA | NA |  |
| 94 | ItemPartner | ProfileID | NA | NA | NA | NA |  |
| 95 | ItemPartner | ID | BusinessPartner | InvoiceDocumentSQL | InvoiceDocumentHeader | ビジネスパートナ |  |
| 96 | ItemPartner | InvoiceLineID | InvoiceDocumentItem | InvoiceDocumentSQL | InvoiceDocumentItem | 請求伝票明細 |  |
| 97 | ItemPartner | PartnerFunction | PartnerFunction | InvoiceDocumentSQL | InvoiceDocumentHeaderPartner | 取引先機能 |  |
| 98 | ItemPartner | PartnerID | PartnerFunctionBusinessPartner | InvoiceDocumentSQL | InvoiceDocumentHeaderPartner | ビジネスパートナコード |  |
| 99 | ItemPartner | PartnerName | NA | NA | NA | NA | ビジネスパートナマスタで管理 |
| 100 | ItemPartner | AddressID | AddressID | InvoiceDocumentSQL | InvoiceDocumentHeaderPartner | 住所ID |  |
|  | 

## MySQL のセットアップ / Kubernetes の設定 / SQL テーブルの作成方法

MySQL のセットアップ / Kubernetes の設定 / 具体的な SQL テーブルの作成方法、については、[mysql-kube]( https://github.com/latonaio/mysql-kube )を参照ください。
