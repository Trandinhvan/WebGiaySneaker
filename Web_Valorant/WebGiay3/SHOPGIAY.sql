CREATE DATABASE SHOPGIAY
GO
USE SHOPGIAY
GO
CREATE TABLE HANGGIAY
(
	MAHANG CHAR(10),
	TENHANG NVARCHAR(30),
	CONSTRAINT PK_HANGGIAY PRIMARY KEY(MAHANG),
)
go
CREATE TABLE GIAY
(
	MAGIAY CHAR(10),
	TENGIAY NVARCHAR(30),
	HINH VARCHAR(50),
	MAHANG CHAR(10),
	SOLUONG INT,
	GIABAN INT,
	CONSTRAINT PK_GIAY PRIMARY KEY(MAGIAY),
)
go
create table account(
	userName char(50) primary key,
	pass char(50)
)
go
create table GIOHANG(
	ID int primary key IDENTITY(1,1),
	MAGIAY char(10),
	SOLUONG int,
	TongDON float,
	userName char(50)
	foreign key(MAGIAY) references GIAY(MAGIAY),
	foreign key(userName) references account(userName)

)
create table 
ALTER TABLE GIAY ADD CONSTRAINT FK_GIAY_HANG FOREIGN KEY(MAHANG) REFERENCES HANGGIAY(MAHANG)
INSERT INTO HANGGIAY
VALUES('G01','NIKE')
INSERT INTO HANGGIAY
VALUES('G02','ADIDAS')
INSERT INTO HANGGIAY
VALUES('G03','PUMA')
INSERT INTO HANGGIAY
VALUES('G04','CONVERSE')
INSERT INTO HANGGIAY
VALUES('G05','NEW BALANCE')
select * from GIAY
------nike
INSERT INTO GIAY
VALUES('N001','Nike Air Max 90','image/SanPham/airmax90.jpg','G01',null,2900000)
INSERT INTO GIAY
VALUES('N002','Nike Air Max 270','image/SanPham/airmax270.jpg','G01',null,2500000)
INSERT INTO GIAY
VALUES('N003','Nike Cortez','image/SanPham/cortez.jpg','G01',null,1950000)
INSERT INTO GIAY
VALUES('N004','Nike Jordan 1','image/SanPham/jodan1.jpg','G01',null,4100000)
INSERT INTO GIAY
VALUES('N005','Nike Air Force 1','image/SanPham/nikeairforce.jpg','G01',null,2100000)
INSERT INTO GIAY
VALUES('N006','Nike SB Travis Scott','image/SanPham/sbtravis.jpg','G01',null,3900000)
INSERT INTO GIAY
VALUES('N007','Nike SockDart','image/SanPham/sockdart.jpg','G01',null,1550000)
INSERT INTO GIAY
VALUES('N008','Nike Uptempo','image/SanPham/uptem.jpg','G01',null,3200000)
INSERT INTO GIAY
VALUES('N009','Nike VaporMax','image/SanPham/vapormax.jpg','G01',null,2750000)
INSERT INTO GIAY
VALUES('N010','Nike Jordan 4','image/SanPham/jodan4.jpg','G01',null,4900000)
DELETE FROM GIAY WHERE MAGIAY='N006' 

----adidas
INSERT INTO GIAY
VALUES('A001','Stand Smith','image/SanPham/Adidas/stand.jpg','G02',null,1750000)
INSERT INTO GIAY
VALUES('A002','Super Star','image/SanPham/Adidas/super.jpg','G02',null,1800000)
INSERT INTO GIAY
VALUES('A003','Human Race','image/SanPham/Adidas/human.jpg','G02',null,4550000)
INSERT INTO GIAY
VALUES('A004','NMD R1','image/SanPham/Adidas/nmd.jpg','G02',null,2400000)
INSERT INTO GIAY
VALUES('A005','ProPhere','image/SanPham/Adidas/prophere.jpg','G02',null,1750000)
INSERT INTO GIAY
VALUES('A006','Adidas EQT','image/SanPham/Adidas/eqt.jpg','G02',null,1600000)
INSERT INTO GIAY
VALUES('A007','Falcon','image/SanPham/Adidas/falcon.jpg','G02',null,230000)
INSERT INTO GIAY
VALUES('A008','Ultra Boost 5.0','image/SanPham/Adidas/ultra.jpg','G02',null,3550000)
INSERT INTO GIAY
VALUES('A009','Yung 1','image/SanPham/Adidas/yung1.jpg','G02',null,210000)
INSERT INTO GIAY
VALUES('A010','Yeezy Zebra','image/SanPham/Adidas/zebra.jpg','G02',null,11050000)

----puma
INSERT INTO GIAY
VALUES('P001','Thunder Spectra','image/SanPham/Puma/thunderspectra.jpg','G03',null,2550000)
INSERT INTO GIAY
VALUES('P002','Cell Alien','image/SanPham/Puma/cellalien.jpg','G03',null,3150000)
INSERT INTO GIAY
VALUES('P003','Cell Venom','image/SanPham/Puma/cellvernom.jpg','G03',null,2200000)
INSERT INTO GIAY
VALUES('P004','Ember Trail','image/SanPham/Puma/embertrail.jpg','G03',null,1900000)
INSERT INTO GIAY
VALUES('P005','RSX Hard Drive','image/SanPham/Puma/harddrive.jpg','G03',null,3000000)
INSERT INTO GIAY
VALUES('P006','LQDCELL Omega Density','image/SanPham/Puma/LQDCELLOmegaDensity.jpg','G03',null,2100000)
INSERT INTO GIAY
VALUES('P007','RSX Toy','image/SanPham/Puma/rsxtoy.jpg','G03',null,2900000)
INSERT INTO GIAY
VALUES('P008','RSX Trophy','image/SanPham/Puma/rsxtrophy.jpg','G03',null,2450000)
INSERT INTO GIAY
VALUES('P009','Puma Suede','image/SanPham/Puma/suede.jpg','G03',null,1400000)
INSERT INTO GIAY
VALUES('P010','Bari Mule','image/SanPham/Puma/barimule.jpg','G03',null,1500000)

----converse
INSERT INTO GIAY
VALUES('C001','Converse 1970s','image/SanPham/Converse/1970s.jpg','G04',null,1800000)
INSERT INTO GIAY
VALUES('C002','Chuck Dainty','image/SanPham/Converse/chuckdainty.jpg','G04',null,2100000)
INSERT INTO GIAY
VALUES('C003','Chuck Taylor All Star','image/SanPham/Converse/chucktaylorallstar.jpg','G04',null,2800000)
INSERT INTO GIAY
VALUES('C004','Converse Classic','image/SanPham/Converse/classic.jpg','G04',null,2000000)
INSERT INTO GIAY
VALUES('C005','Converse x Dior','image/SanPham/Converse/dior.jpg','G04',null,4500000)
INSERT INTO GIAY
VALUES('C006','Jack PurCell','image/SanPham/Converse/jackbercell.jpg','G04',null,1700000)
INSERT INTO GIAY
VALUES('C007','Converse One Star','image/SanPham/Converse/onestar.jpg','G04',null,2200000)
INSERT INTO GIAY
VALUES('C008','Converse Rubber','image/SanPham/Converse/rubber.jpg','G04',null,1600000)
INSERT INTO GIAY
VALUES('C009','Chuck Taylor 2','image/SanPham/Converse/taylor2.jpg','G04',null,2900000)
INSERT INTO GIAY
VALUES('C010','Converse x F.O.G','image/SanPham/Converse/xFog.jpg','G04',null,10000000)


---new balance
INSERT INTO GIAY
VALUES('NB001','New Balance 247','image/SanPham/New Balance/247.jpg','G05',null,2000000)
INSERT INTO GIAY
VALUES('NB002','New Balance 515','image/SanPham/New Balance/515.jpg','G05',null,2100000)
INSERT INTO GIAY
VALUES('NB003','New Balance 520','image/SanPham/New Balance/520.jpg','G05',null,2900000)
INSERT INTO GIAY
VALUES('NB004','New Balance 574','image/SanPham/New Balance/574.jpg','G05',null,1800000)
INSERT INTO GIAY
VALUES('NB005','New Balance 996','image/SanPham/New Balance/996.jpg','G05',null,3150000)
INSERT INTO GIAY
VALUES('NB006','New Balance 997','image/SanPham/New Balance/997.jpg','G05',null,2700000)
INSERT INTO GIAY
VALUES('NB007','New Balance 997H','image/SanPham/New Balance/997h.jpg','G05',null,3300000)
INSERT INTO GIAY
VALUES('NB008','New Balance 998','image/SanPham/New Balance/998.jpg','G05',null,3500000)
INSERT INTO GIAY
VALUES('NB009','New Balance X-90','image/SanPham/New Balance/x90.jpg','G05',null,2500000)
INSERT INTO GIAY
VALUES('NB010','New Balance X-Racer','image/SanPham/New Balance/247.jpg','G05',null,2850000)
select *from GIAY
go
--Hàm xuất hóa đơn
create function proc_ouPutGioHang(@userName nvarchar(50))
returns table
as
	return (select TENGIAY,GIOHANG.SOLUONG,TongDON from GIOHANG,GIAY where GIOHANG.MAGIAY=GIAY.MAGIAY and @userName=userName)
go
select *from dbo.proc_ouPutGioHang('minhhien')
select *from GIOHANG
SELECT * FROM  GIAY WHERE TENGIAY like '%Super%'
go
CREATE FUNCTION [dbo].[fuConvertToUnsign1] ( @strInput NVARCHAR(4000) ) RETURNS NVARCHAR(4000) AS BEGIN IF @strInput IS NULL RETURN @strInput IF @strInput = '' RETURN @strInput DECLARE @RT NVARCHAR(4000) DECLARE @SIGN_CHARS NCHAR(136) DECLARE @UNSIGN_CHARS NCHAR (136) SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' +NCHAR(272)+ NCHAR(208) SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee iiiiiooooooooooooooouuuuuuuuuuyyyyy AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD' DECLARE @COUNTER int DECLARE @COUNTER1 int SET @COUNTER = 1 WHILE (@COUNTER <=LEN(@strInput)) BEGIN SET @COUNTER1 = 1 WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1) BEGIN IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) ) BEGIN IF @COUNTER=1 SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1) ELSE SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER) BREAK END SET @COUNTER1 = @COUNTER1 +1 END SET @COUNTER = @COUNTER +1 END SET @strInput = replace(@strInput,' ','-') RETURN @strInput END
go
select *from GIAY where dbo.fuConvertToUnsign1(TENGIAY) like N'%' +dbo.fuConvertToUnsign1('Falcon')+'%'
select *from account
---
go
create proc USP_login
@username NVARCHAR(100),@password NVARCHAR(100)
as
begin
	select *from account where userName=@username and pass=@password
end
exec USP_login @username='cc', @password='cc'
select *from account
go
create function login(@user nvarchar(50),@pass nvarchar(50))
returns table 
as
	return(select *from account where @user=userName and pass=@pass)
go
select *from dbo.login('cc','cc')
select *from account where userName='cc' and pass='cc'
select *from GIOHANG
go
Alter function fu_GIOHANG()
returns table
as
	return (select ID,GIOHANG.MAGIAY ,TENGIAY,GIOHANG.SOLUONG,GIABAN,TongDON from GIOHANG,GIAY where GIOHANG.MAGIAY=GIAY.MAGIAY)
go
delete from account