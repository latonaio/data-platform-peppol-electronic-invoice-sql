# peppol-electronic-invoice-sql

peppol-electronic-invoice-sql　は、Peppol における電子インボイスデータを保存する SQL テーブルを作成するためのレポジトリです。  

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
* peppol-electronic-invoice-sql-header-partner-address-data.sql（Peppol 電子インボイス - ヘッダ取引先住所データ）
* peppol-electronic-invoice-sql-item-data.sql（Peppol 電子インボイス - 明細データ）

## パートナーファンクション

peppol-electronic-invoice-sql では、パートナーファンクションによって、関係者が分類されています。  
パートナーファンクションを用いて、Peppolの請求書データに関するパートナーテーブルを定義することにより、Peppolのデータ項目を整理し、データ項目の種類の総量を削減して、より効率的な、Peppolデータフォーマット体系のデータマネジメントを行うことができます。    

peppol-electronic-invoice-sql におけるパートナーファンクションは、2桁のコードで例示され、  

* ID および ProfileID / 請求主体 : IV
* AccountingCustomerParty / 請求先 : BP
* AccountingSupplierParty / 仕入先 : SP
* Payee / 支払人 : PY

となっています。  
（上記は例であり、用途に応じて任意のパートナーファンクションを定義してください）

## MySQL のセットアップ / Kubernetes の設定 / SQL テーブルの作成方法

MySQL のセットアップ / Kubernetes の設定 / 具体的な SQL テーブルの作成方法、については、[mysql-kube]( https://github.com/latonaio/mysql-kube )を参照ください。
