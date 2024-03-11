# ScanGo 無人商店自助結帳系統

<img width="330px" height="600px" src="https://github.com/chriz-chen/ScanGo/assets/151800532/d5577581-98cb-4dd4-9746-e41b7ee09190"/>

## 【 專案動機 】
1. 因應全球人力缺工問題，實體店面面臨轉型挑戰，為了降低人力成本並應對缺工問題，決定開發自助結帳系統。
2. 在傳統零售模式中，結帳容易受制於排隊等問題影響效率，現在使用手機 ScanGo 掃完結帳即可帶走商品。

## 【 專案特色 】
1. 採用RWD響應式網頁設計，分為前台（顧客－手機版）、後台（管理員－網頁版），並設定權限分級制度。
2. 全網採用 Https 通訊協定加密，保護使用者交易資訊不外洩。
3. 顧客掃描商品上 QR Code 條碼，即可加入購物車。後台管理員可在後台產生 QR Code 條碼並下載。
4. 註冊登入的密碼使用 BCrypt 加密，並在登入頁設定 OTP驗證碼。
5. 設置商店地圖供顧客參考位置，使用 Image Map 技術，達到動態地圖的效果。
6. 輸入優惠券代碼後，即可新增優惠券並於結帳時使用。
7. 結帳完後可查詢歷史訂單，並為訂單評分。

## 【 專案架構 】
- 後端：Java Spring MVC -> Controller、Repository、Service 三層式架構
- 渲染模板：JSP
- 前端：HTML5、CSS3、JavaScript、JQuery、AJAX、Fetch、BootStrap 5
- 資料庫：MySQL


![資料庫架構](https://github.com/chriz-chen/ScanGo/assets/151800532/659ca2cc-71d3-4fcf-ac5a-0b6b83f575c7)


