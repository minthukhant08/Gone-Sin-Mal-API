CREATE DataBase Gone_Sin_Mal

--Customer Table--
CREATE TABLE User_Table(
User_id bigint not null,
User_name varchar(255) ,
User_noti_token varchar(255),
User_type varchar(255) ,
User_state varchar(255) ,
User_available_coin bigint default 0,
User_visited_restaurant bigint default 0,
User_exceeded_date date,

CONSTRAINT PK_User_Table
PRIMARY KEY (User_id)
)

--Restaurant Table--
CREATE TABLE Restaurant_Table(
Rest_id bigint  IDENTITY(1,1) not null,
User_id bigint,
Rest_name varchar(255) ,
Rest_profile_picture varbinary(MAX),
Rest_password varchar(255) ,
Rest_gallery_1 varbinary(MAX) ,
Rest_gallery_2 varbinary(MAX) ,
Rest_gallery_3 varbinary(MAX) ,
Rest_gallery_4 varbinary(MAX) ,
Rest_category varchar(255),
Rest_coin bigint default 0,
Rest_special_coin bigint default 0,
Rest_email varchar(255) ,
Rest_phno varchar(255) , 
Rest_state varchar(255),
Rest_location varchar(255) ,
Rest_lat  DECIMAL(10, 8),
Rest_long  DECIMAL(11, 8),
Rest_created_date date,
Rest_coin_purchased bigint default 0,

CONSTRAINT PK_Restaurant_Table
PRIMARY KEY (Rest_id),

CONSTRAINT FK__Restaurant_User_id
FOREIGN KEY(User_id)
REFERENCES User_Table(User_id),
)

--Visited Restaurants Table--
CREATE TABLE Visited_Restaurants(
ID bigint IDENTITY(1,1) not null,
User_id bigint not null,
Rest_id bigint not null,

CONSTRAINT FK__visited_User_id
FOREIGN KEY(User_id)
REFERENCES User_Table(User_id),

CONSTRAINT FK__visited_Record_id
FOREIGN KEY(Rest_id)
REFERENCES Restaurant_Table(Rest_id),

CONSTRAINT PK_visited_record_Table
PRIMARY KEY (ID),
)


--System Table--
CREATE TABLE System_Table(
Record_id bigint  IDENTITY(1,1) not null,
Masterkey varchar(255) ,
Expired_coins bigint ,
Sold_coins bigint ,
Sold_special_coins bigint ,

CONSTRAINT PK_System_Table
PRIMARY KEY (Record_id)
)

--Favorite List Table--
CREATE TABLE Favorite_Table(
Fav_id bigint  IDENTITY(1,1) not null,
User_id bigint not null,
Rest_id bigint not null,

CONSTRAINT FK__Fav_Table_User_id
FOREIGN KEY(User_id)
REFERENCES User_Table(User_id),

CONSTRAINT FK_Fav_Table_Rest_id
FOREIGN KEY(Rest_id)
REFERENCES Restaurant_Table(Rest_id),

CONSTRAINT PK_Fav_Table_PK
PRIMARY KEY (Fav_id)
)

--Package Table--
CREATE TABLE Package_Table(
Package_id  bigint  IDENTITY(1,1) not null,
Package_type varchar(255) ,
Package_coin_amount bigint ,
Myanpay_button_link varchar(255) ,
Coin_img varbinary(MAX) ,

CONSTRAINT PK_Package_Table
PRIMARY KEY (Package_id)
)




--Promotion Table--
CREATE TABLE Promotion_Table(
Id bigint IDENTITY(1,1) not null,
Rest_id bigint not null,
User_id bigint not null,
User_promotion_amount int default 0,
ExpireIn date not null,

CONSTRAINT FK_Promotion_Table_User_id
FOREIGN KEY(User_id)
REFERENCES User_Table(User_id),

CONSTRAINT FK_Promotion_Table_Rest_id
FOREIGN KEY(Rest_id)
REFERENCES Restaurant_Table(Rest_id),

CONSTRAINT PK_Promotion_Table_PK
PRIMARY KEY (Id)
)


--Transaction Table--
CREATE TABLE Transaction_Table(
ID bigint IDENTITY(1,1) not null,
User_id bigint not null,
Tran_id bigint,
Tran_type varchar(255),
Pending bit,
Tran_date date,
Package_id  bigint not null,

CONSTRAINT FK_Transaction_Table_User_id
FOREIGN KEY(User_id)
REFERENCES User_Table(User_id),

CONSTRAINT FK_Transaction_Table_Package_id
FOREIGN KEY(Package_id)
REFERENCES Package_Table(Package_id),

CONSTRAINT PK_Transaction_Table
PRIMARY KEY (ID)
)

--Used_Transaction_ID_Table--
CREATE TABLE Used_Transaction_ID(
ID bigint IDENTITY(1,1) not null,
Tran_ID bigint not null,

CONSTRAINT PK_Used_Transaction_Table
PRIMARY KEY (ID),
)



--Notification Table--
CREATE TABLE Notification_Table(
Noti_id bigint  IDENTITY(1,1) not null,
User_id bigint not null,
Noti_type varchar (255) ,
Noti_text varchar (255),
Notification varchar (255) ,
ID bigint,


CONSTRAINT FK_Notification_Table_ID
FOREIGN KEY(ID)
REFERENCES Transaction_Table(ID),

CONSTRAINT FK_Notification_Table_User_id
FOREIGN KEY(User_id)
REFERENCES User_Table(User_id),

CONSTRAINT PK_Notification_Table
PRIMARY KEY (Noti_id)
)


--Refund Table--
CREATE TABLE Refund_Table(
ID bigint  IDENTITY(1,1) not null,
User_id bigint not null,
Amount bigint ,
Myan_pay varchar(255),

CONSTRAINT FK_Refund_Table_User_id
FOREIGN KEY(User_id)
REFERENCES User_Table(User_id),

CONSTRAINT PK_Refund_Table
PRIMARY KEY (ID)
)

INSERT INTO Package_Table(Package_type,Package_coin_amount,Myanpay_button_link,Coin_img)
SELECT 'normal' as Package_type,'1000' as Package_coin_amount, 'https://www.myanpay.com.mm/Personal/ButtonDonationLogIn.aspx?sid=18ad6219-7b30-49a2-99d9-8d95c2d0cf30' as Myanpay_button_link,*
FROM Openrowset( Bulk N'D:\UOG\Group Project\Gone-Sin-Mal-API\coins\NormalCoin100.png', Single_Blob) as Coin_img
INSERT INTO Package_Table(Package_type,Package_coin_amount,Myanpay_button_link,Coin_img)
SELECT 'normal' as Package_type,'2000' as Package_coin_amount, 'https://www.myanpay.com.mm/Personal/ButtonDonationLogIn.aspx?sid=18ad6219-7b30-49a2-99d9-8d95c2d0cf30' as Myanpay_button_link,*
FROM Openrowset( Bulk N'D:\UOG\Group Project\Gone-Sin-Mal-API\coins\NormalCoin200.png', Single_Blob) as Coin_img
INSERT INTO Package_Table(Package_type,Package_coin_amount,Myanpay_button_link,Coin_img)
SELECT 'normal' as Package_type,'3000' as Package_coin_amount, 'https://www.myanpay.com.mm/Personal/ButtonDonationLogIn.aspx?sid=18ad6219-7b30-49a2-99d9-8d95c2d0cf30' as Myanpay_button_link,*
FROM Openrowset( Bulk N'D:\UOG\Group Project\Gone-Sin-Mal-API\coins\NormalCoin300.png', Single_Blob) as Coin_img
INSERT INTO Package_Table(Package_type,Package_coin_amount,Myanpay_button_link,Coin_img)
SELECT 'normal' as Package_type,'4000' as Package_coin_amount, 'https://www.myanpay.com.mm/Personal/ButtonDonationLogIn.aspx?sid=18ad6219-7b30-49a2-99d9-8d95c2d0cf30' as Myanpay_button_link,*
FROM Openrowset( Bulk N'D:\UOG\Group Project\Gone-Sin-Mal-API\coins\NormalCoin400.png', Single_Blob) as Coin_img
INSERT INTO Package_Table(Package_type,Package_coin_amount,Myanpay_button_link,Coin_img)
SELECT 'normal' as Package_type,'5000' as Package_coin_amount, 'https://www.myanpay.com.mm/Personal/ButtonDonationLogIn.aspx?sid=18ad6219-7b30-49a2-99d9-8d95c2d0cf30' as Myanpay_button_link,*
FROM Openrowset( Bulk N'D:\UOG\Group Project\Gone-Sin-Mal-API\coins\NormalCoin500.png', Single_Blob) as Coin_img



INSERT INTO Package_Table(Package_type,Package_coin_amount,Myanpay_button_link,Coin_img)
SELECT 'special' as Package_type,'10000' as Package_coin_amount, 'https://www.myanpay.com.mm/Personal/ButtonDonationLogIn.aspx?sid=18ad6219-7b30-49a2-99d9-8d95c2d0cf30' as Myanpay_button_link,*
FROM Openrowset( Bulk N'D:\UOG\Group Project\Gone-Sin-Mal-API\coins\SpecialCoin200.png', Single_Blob) as Coin_img
INSERT INTO Package_Table(Package_type,Package_coin_amount,Myanpay_button_link,Coin_img)
SELECT 'special' as Package_type,'20000' as Package_coin_amount, 'https://www.myanpay.com.mm/Personal/ButtonDonationLogIn.aspx?sid=18ad6219-7b30-49a2-99d9-8d95c2d0cf30' as Myanpay_button_link,*
FROM Openrowset( Bulk N'D:\UOG\Group Project\Gone-Sin-Mal-API\coins\SpecialCoin400.png', Single_Blob) as Coin_img
INSERT INTO Package_Table(Package_type,Package_coin_amount,Myanpay_button_link,Coin_img)
SELECT 'special' as Package_type,'30000' as Package_coin_amount, 'https://www.myanpay.com.mm/Personal/ButtonDonationLogIn.aspx?sid=18ad6219-7b30-49a2-99d9-8d95c2d0cf30' as Myanpay_button_link,*
FROM Openrowset( Bulk N'D:\UOG\Group Project\Gone-Sin-Mal-API\coins\SpecialCoin600.png', Single_Blob) as Coin_img
INSERT INTO Package_Table(Package_type,Package_coin_amount,Myanpay_button_link,Coin_img)
SELECT 'special' as Package_type,'40000' as Package_coin_amount, 'https://www.myanpay.com.mm/Personal/ButtonDonationLogIn.aspx?sid=18ad6219-7b30-49a2-99d9-8d95c2d0cf30' as Myanpay_button_link,*
FROM Openrowset( Bulk N'D:\UOG\Group Project\Gone-Sin-Mal-API\coins\SpecialCoin800.png', Single_Blob) as Coin_img
INSERT INTO Package_Table(Package_type,Package_coin_amount,Myanpay_button_link,Coin_img)
SELECT 'special' as Package_type,'50000' as Package_coin_amount, 'https://www.myanpay.com.mm/Personal/ButtonDonationLogIn.aspx?sid=18ad6219-7b30-49a2-99d9-8d95c2d0cf30' as Myanpay_button_link,*
FROM Openrowset( Bulk N'D:\UOG\Group Project\Gone-Sin-Mal-API\coins\SpecialCoin1000.png', Single_Blob) as Coin_img


insert into System_Table(Masterkey,Expired_coins,Sold_coins,Sold_special_coins)
values('12345',1,1,1)

