-- -------------------------------------------CATEGORY---------------------------------------------------------------
insert into category (categoryPart, categoryName) values ('五金雜貨區', '清潔用品');
insert into category (categoryPart, categoryName) values ('五金雜貨區', '廚房用品');
insert into category (categoryPart, categoryName) values ('五金雜貨區', '衛生紙');
insert into category (categoryPart, categoryName) values ('零食飲料區', '汽水');
insert into category (categoryPart, categoryName) values ('零食飲料區', '餅乾');
insert into category (categoryPart, categoryName) values ('零食飲料區', '茶');
insert into category (categoryPart, categoryName) values ('家電用品區', '季節家電');
insert into category (categoryPart, categoryName) values ('家電用品區', '美體家電');
insert into category (categoryPart, categoryName) values ('家電用品區', '廚房家電');


/*
-- --------------------------------------------PRODUCT-------------------------------------------------------------------
insert into product(productName, price, unit, categoryId, inventory) values('一匙靈制菌超濃縮洗衣精補充包1.9Kg', 86, '包', 1, 50);
insert into product(productName, price, unit, categoryId, inventory) values('妙管家馬桶芳香清潔劑-香水百合750g', 57, '瓶', 1, 30);
insert into product(productName, price, unit, categoryId, inventory) values('泡舒洗潔精-檸檬1000g', 89, '瓶', 1, 25);
insert into product(productName, price, unit, categoryId, inventory) values('威猛先生快速通樂960cc', 75, '瓶', 1, 30);
insert into product(productName, price, unit, categoryId, inventory) values('OP無雙酚A鋁箔1500cm', 107, '個', 2, 50);
insert into product(productName, price, unit, categoryId, inventory) values('日光生活排水口濾渣網(約200入)', 76, '包', 2, 100);
insert into product(productName, price, unit, categoryId, inventory) values('妙潔耐熱袋量販包(六兩)345入', 72, '盒', 2, 50);
insert into product(productName, price, unit, categoryId, inventory) values('楓康耐熱袋大140入', 68, '盒', 2, 50);
insert into product(productName, price, unit, categoryId, inventory) values('五月花妙用廚房紙巾-6捲', 94, '組', 3, 70);
insert into product(productName, price, unit, categoryId, inventory) values('倍潔雅好韌真3層抽取衛生紙100抽6包', 125, '組', 3, 70);
insert into product(productName, price, unit, categoryId, inventory) values('家樂福嬰兒潔膚濕巾量販包(粉紅)80PCx4', 169, '包', 3, 130);
insert into product(productName, price, unit, categoryId, inventory) values('舒潔迪士尼抽取衛生紙超值包', 345, '盒', 3, 30);
insert into product(productName, price, unit, categoryId, inventory) values('可口可樂 600ml', 35, '瓶', 4, 70);
insert into product(productName, price, unit, categoryId, inventory) values('黑松加鹽沙士 600ml', 30, '瓶', 4, 30);
insert into product(productName, price, unit, categoryId, inventory) values('舒味思通寧汽水 330ml', 38, '罐', 4, 30);
insert into product(productName, price, unit, categoryId, inventory) values('黑松汽水', 30, '瓶', 4, 30);
insert into product(productName, price, unit, categoryId, inventory) values('Pocky百奇牛奶餅乾棒', 79, '包', 5, 300);
insert into product(productName, price, unit, categoryId, inventory) values('海太加鈣營養餅乾', 57, '盒', 5, 100);
insert into product(productName, price, unit, categoryId, inventory) values('能多益餅乾', 59, '包', 5, 150);
insert into product(productName, price, unit, categoryId, inventory) values('樂事美國經典原味', 45, '包', 5, 130);
insert into product(productName, price, unit, categoryId, inventory) values('味丹青草茶 560ml', 25, '瓶', 6, 30);
insert into product(productName, price, unit, categoryId, inventory) values('原味本舖養身杏仁茶240ml', 35, '罐', 6, 30);
insert into product(productName, price, unit, categoryId, inventory) values('悅氏麥仔茶550ml', 25, '瓶', 6, 30);
insert into product(productName, price, unit, categoryId, inventory) values('統一麥香奶茶', 10, '瓶', 6, 300);
insert into product(productName, price, unit, categoryId, inventory) values('【Philips 飛利浦】多功能暖風機 烘鞋_烘被_烘衣_暖風機_陶磁電暖器 (AHR3124FM)', 4888, '台', 7, 5);
insert into product(productName, price, unit, categoryId, inventory) values('【SDL 山多力】14吋立扇SL-1406', 788, '台', 7, 3);
insert into product(productName, price, unit, categoryId, inventory) values('【亞普牌】12吋鹵素燈電暖器(HY-213)', 1688, '台', 7, 3);
insert into product(productName, price, unit, categoryId, inventory) values('森活電蚊拍(三層網)-顏色隨機出貨尺寸：約46_18cm', 95, '個', 7, 15);
insert into product(productName, price, unit, categoryId, inventory) values('Comefree 小海葵纖體按摩棒', 988, '個', 8, 15);
insert into product(productName, price, unit, categoryId, inventory) values('TESCOM TID450TW大風量負離子吹風機', 799, '台', 8, 10);
insert into product(productName, price, unit, categoryId, inventory) values('康生雙持高效筋膜槍(智慧感壓)', 889, '台', 8, 10);
insert into product(productName, price, unit, categoryId, inventory) values('德國百靈Oral-B D100活力亮潔電動牙刷', 999, '支', 8, 30);
insert into product(productName, price, unit, categoryId, inventory) values('【PHILIPS 飛利浦】不挑鍋黑晶爐(HD4988)', 2088, '個', 9, 5);
insert into product(productName, price, unit, categoryId, inventory) values('【TATUNG大同】1.8公升不鏽鋼電茶壺(TEK-1815S)', 888, '個', 9, 3);
insert into product(productName, price, unit, categoryId, inventory) values('【TIGER 虎牌】日本製 微電腦電熱水瓶3L(PDR-S30R)', 2790, '個', 9, 10);
insert into product(productName, price, unit, categoryId, inventory) values('大同電鍋TAC-10L-DCU10人份', 2688, '個', 9, 2);
*/


-- --------------------------------------------USER-------------------------------------------------------------------------
insert into level(levelId, levelName) values(1,'顧客');
insert into level(levelId, levelName) values(2,'管理員');

insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('user123', '$2a$10$JSfM9nCScx71EfKemrdsKepMNJXItZZ3bI9g33FtUQkGN5hyxv5zi', 'user123@gmail.com', '0922777213', '1978-10-28', 1, 'ScanGo', '2024-12-25');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('user456', 'qwewa$10$JSfM9nCScx71EfKdsadsadsadsadsadsdqwewqeQkGN5hyxv5zi', 'user456@gmail.com', '0960455213', '1990-11-12', 1, 'Google', '2024-12-25');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('uservfdv789', 'wqewqeqweqefsadasdasdKemrdsKepMNJXItZZ3bI9g33FtUQkGN5hyxv5zi', 'user789@gmail.com', '0912137213', '1998-01-02', 1, 'ScanGo', '2024-12-26');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('user111', '21312wqeqwesafewfewtewt23r32fffNJXItZZ3bI9g33FtUQkGN5hyxv5zi', 'zxc1@gmail.com', '0960222213', '1999-05-11', 1, 'Google', '2024-12-26');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('uservv222', 'wqeqwewqewqewqewqfeq;wq923213wqe12341Z3bI9g33FtUQkGN5hyxv5zi', 'weqwuu@gmail.com', '0960727213', '1980-05-07', 1, 'Google', '2024-12-26');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('user333', 'wqewqedf123214sadsdsdsadqwlk3iuro3rkjk3bI9g33FtUQkGN5hyxv5zi', 'usuuus@gmail.com', '0960111213', '1988-06-22', 1, 'ScanGo', '2024-12-26');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('quwuqeq', '123213saSfM9nCScx71EfKemrdsKepMNJXItZZ3bI9g33FtUQewrewrewrew', 'user091@gmail.com', '0919277213', '2000-11-22', 1, 'ScanGo', '2024-12-26');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('uasdasd', '213efewfM9nCScx71EfKemrdsKepMNffffeewZ3bI9g33ewwerewrewrfdfw', 'user111@gmail.com', '0960723223', '1966-10-10', 1, 'ScanGo', '2024-12-27');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('usewzqwe', '$2a$10$JSfM9nCScx71EfKemrdsKepMNJXItZZ3bI9g33FtUQkGN5hyxv5zi', 'userdqsa@gmail.com', '0960222213', '1963-01-25', 1, 'ScanGo', '2024-12-27');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('qazcccc', '$2a$10$JSfM9nCScx71EfKemrdsKepMNJXItZZ3bI9g33FtUQkGN5hyxv5zi', 'uuopqqg@mail.com', '0961234513', '1993-02-09', 1, 'Google', '2024-12-27');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('uwqeweqwe', 'rdsKepMNfff9nCScx71EfKemrdsKepMNJXItZZ3bI9g33FtUQkGN5hyxv5zi', 'wqoie1@gmail.com', '0960777213', '1992-10-14', 1, 'ScanGo', '2024-12-27');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('uvfvfdvf', 'wefewfwerdsKepMcx71EfKemrdsKepMNJXItZZ3bI9g33FtUQkGN5hyxv5zi', 'paosnd@gmail.com', '0960777213', '1972-03-20', 1, 'ScanGo', '2024-12-27');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('usadsad3', '$eqwes$JSfM9nCScx71EfKemrdsKepMNJXItZZ3bI9g33FtUQkGN5hyxv5zi', 'user21421@gmail.com', '0911777213', '1979-11-29', 1, 'Google', '2024-12-28');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('usdsa123', 'sdadwq$JSfM9nCScx71EfKemrdsKepMNJXItZZ3bI9g33FtUQkGN5hyxv5zi', '000111@gmail.com', '09600996623', '1979-01-09', 1, 'Google','2024-12-29');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('sadsadsaxz3', 'wwwqqewdddd9nCScx71EfKemrdsKepMNJXItZZ3bI9g33FtUQkGN5hyxv5zi', 'snacp@gmail.com', '0960777213', '1993-11-22', 1, 'ScanGo','2024-12-29');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('sadsad23', 'rdsKepMNffffScx71EfKemrdsKepMNJXItZZ3bIwqewqdsadasdqwreqf5zi', '0011212@gmail.com', '0900777213', '2004-03-01', 1, 'Google','2024-12-29');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('cxcasc23', '$wqewqCScx71EfKemrdsKepMNJXItZZ3bI9g33FtUwqewedsascasckji5zi', 'sddqwqwd@gmail.com', '09970777213', '2005-11-28', 1, 'Google','2024-12-30');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('sadsad3', '$2a$10$JSfM9nCScx71EfKemrdsKepMefewfewfewfdsvvrgregreggreggr', 'qwert@gmail.com', '092034413', '1956-10-02', 1, 'ScanGo','2024-12-30');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('usaff123', 'rdsKepMNffffwwefewfEfKemrdsKepMNJXItZZ3bI9g33FtUQkGN5hyxv5zi', 'qazxsw@gmail.com', '0919777213', '1977-09-22', 1, 'ScanGo','2024-12-30');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('ssss23', 'wqewqeffewfewfeeg71EfKemrdsKepMNJXItZZ3bI9g33FtUQkGN5hyxv5zi', 'usewqwq3@gmail.com', '0977722213', '1992-12-23', 1, 'ScanGo','2024-12-30');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('sdsad123', 'wqewedsdqdeqfeecx71EfKemrdsKepMNJXItZZ3bI9g33FtUQkGN5hyxv5zi', 'user12@gmail.com', '0945772213', '1979-12-26', 1, 'ScanGo','2024-12-30');
insert into user(userName, password, email, phone, birthday, levelId, authType, createDate) values('admin', '$2a$10$JSfM9nCScx71EfKemrdsKepMNJXItZZ3bI9g33FtUQkGN5hyxv5zi', 'admin@gmail.com', '0945772213', '1979-12-26', 2, 'ScanGo','2024-12-30');


-- --------------------------------------------COUPON------------------------------------------------------------------------------------------------
insert into coupon(couponName, code, type, value, minPurchaseAmount, description, startDate, endDate, isActive) values('$100折抵金', 'IWANTDISCOUNT100', 'FIXED', 100.00, 300, '即可使用', CURRENT_DATE, '2024-02-25', 1);
insert into coupon(couponName, code, type, value, minPurchaseAmount, description, startDate, endDate, isActive) values('10%折扣優惠', 'IWANT10%OFF', 'PERCENT', 10, 300, '現抵9折', CURRENT_DATE, '2024-02-25', 1);