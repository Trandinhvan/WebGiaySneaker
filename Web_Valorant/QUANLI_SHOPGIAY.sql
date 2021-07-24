CREATE DATABASE QUANLI_SHOPGIAY
GO
USE QUANLI_SHOPGIAY
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
	ID CHAR(10) primary key,
	MAGIAY char(10),
	SOLUONG int,
	TongDON float,
	userName char(50)
	foreign key(MAGIAY) references GIAY(MAGIAY),
	foreign key(userName) references account(userName)
)
ALTER TABLE GIAY ADD CONSTRAINT FK_GIAY_HANG FOREIGN KEY(MAHANG) REFERENCES HANGGIAY(MAHANG)

CREATE TABLE GIAOHANG
(
	SOGH CHAR(5),
	ID CHAR(10),
	CONSTRAINT PK_GIAOHANG PRIMARY KEY(SOGH),
	CONSTRAINT FK_GIAOHANG_GIOHANG FOREIGN KEY(ID) REFERENCES GIOHANG(ID)
)


CREATE TABLE ChiTietGH
(
	SOGH CHAR(5),
	MAGIAY CHAR(10),
	SLG INT,
	PHISHIP INT,
	TONGTIEN INT ,
	BAOHANH DATE,
	NGAYGH DATE,
	NGAYDOITRA DATE,
	CONSTRAINT PK_ChiTietGH PRIMARY KEY(SOGH,MAGIAY),
	CONSTRAINT FK_ChiTietGH_GIAY FOREIGN KEY(MAGIAY) REFERENCES GIAY(MAGIAY)
)

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
SELECT * FROM HANGGIAY

INSERT INTO account
VALUES('TRAN DINH VAN','333456')
INSERT INTO account
VALUES('NGUYEN MINH HIEN','123632')
INSERT INTO account
VALUES('LUONG MAO KIEN PHAT','123456')

INSERT INTO GIAY
VALUES('N001','Nike Air Max 90','image/SanPham/airmax90.jpg','G01',null,2900000)
INSERT INTO GIAY
VALUES('N002','Nike Air Max 270','image/SanPham/airmax270.jpg','G01',null,2500000)

INSERT INTO GIOHANG
VALUES('001','N002',1,NULL,'TRAN DINH VAN')
INSERT INTO GIOHANG
VALUES('002','N001',1,NULL,'NGUYEN MINH HIEN')

SELECT * FROM GIOHANG

INSERT INTO GIAOHANG
VALUES('GH01','001')
INSERT INTO GIAOHANG
VALUES('GH02','002')
INSERT INTO GIAOHANG(SOGH,ID)
VALUES('GH03','003')
----------THỦ TỤC
---1) Viết thủ tục truyền vào mã  giày, trả về tên giày và giá bán.
GO
CREATE PROC CAU1
@MAGIAY CHAR(10),@TENGIAY NVARCHAR(30) OUTPUT,@GIABAN INT OUTPUT
AS
	BEGIN
		SELECT TENGIAY,GIABAN
		FROM GIAY
		WHERE @MAGIAY=MAGIAY
	END
GO
DECLARE @TENGIAY NVARCHAR(30),@GIABAN INT
EXEC CAU1 'N001',@TENGIAY OUTPUT,@GIABAN OUTPUT




insert INTO GIAOHANG(SOGH)
VALUES('GH01')
SELECT * FROM GIOHANG

SET DATEFORMAT DMY
insert into ChiTietGH
VALUES('GH01','N001',10,null,null,'30/7/2021','30/7/2020','15/8/2020')
insert into ChiTietGH
VALUES('GH06','N002',5,null,null,'18/7/2021','20/5/2020','12/6/2020')

---2) Viết thủ tục in ra danh sách gồm tên giày,mã giày của 1 mã hãng, khi truyền vào tham số là mã hãng.
GO
CREATE PROC CAU2
@MAHANG CHAR(10)
AS
	BEGIN
		SELECT MAGIAY,TENGIAY
		FROM GIAY,HANGGIAY
		WHERE GIAY.MAHANG=GIAY.MAHANG AND HANGGIAY.MAHANG=@MAHANG
	END
GO
EXEC CAU2 'G01'

---3) Viết thủ tục in ra tên giày và giá bán của giày có giá bán cao nhất.
GO
CREATE PROC CAU3
AS
	BEGIN
		SELECT TOP(1) TENGIAY,GIABAN
		FROM GIAY
		ORDER BY GIABAN DESC
	END
GO
EXEC CAU3
SELECT * FROM GIAY

---4) Viết thủ tục cập nhật giảm 500000 tất cả loại giày có mã hàng G005.
INSERT INTO GIAY
VALUES('NB001','New Balance 247','image/SanPham/New Balance/247.jpg','G05',null,2000000)
INSERT INTO GIAY
VALUES('NB002','New Balance 515','image/SanPham/New Balance/515.jpg','G05',null,2100000)

GO
CREATE PROC CAU4
AS
	BEGIN
		UPDATE GIAY SET GIABAN=GIABAN -500000 WHERE MAHANG='G05'
	END
GO
EXEC CAU4
SELECT * FROM GIAY WHERE MAHANG='G05'


---5) Viết thủ tục cập nhật số lượng của mỗi loại giày NIKE =10.
GO
CREATE PROC CAU5
AS
	BEGIN
		UPDATE GIAY SET SOLUONG=10 WHERE MAHANG=(SELECT HANGGIAY.MAHANG FROM GIAY,HANGGIAY WHERE GIAY.MAHANG=HANGGIAY.MAHANG AND 
		TENHANG='NIKE' GROUP BY HANGGIAY.MAHANG)
	END
GO
EXEC CAU5
SELECT * FROM GIAY,HANGGIAY WHERE GIAY.MAHANG=HANGGIAY.MAHANG AND TENHANG=N'NIKE'


---6) Viết thủ tục in ra USER đang đặt giày Nike Jordan 1 đang hàng trong giỏ hàng.

INSERT INTO GIAY
VALUES('N004','Nike Jordan 1','image/SanPham/jodan1.jpg','G01',null,4100000)
GO
CREATE PROC CAU6
AS
	BEGIN
		SELECT userName FROM GIOHANG,GIAY WHERE GIOHANG.MAGIAY=GIAY.MAGIAY AND TENGIAY='Nike Jordan 1'
	END
GO
INSERT INTO GIOHANG
VALUES('003','N004',3,NULL,'TRAN DINH VAN')
INSERT INTO GIOHANG
VALUES('004','N004',4,NULL,'NGUYEN MINH HIEN')
EXEC CAU6
SELECT * FROM GIOHANG


---7) Viết thủ tục trả về tên giày và ngày bảo hành khi truyền vào mã giày.
GO
CREATE PROC CAU7
@MAGIAY CHAR(10),@TENGIAY NVARCHAR(30) OUTPUT,@BAOHANH DATE OUTPUT
AS
	BEGIN
		SELECT TENGIAY,BAOHANH
		FROM ChiTietGH,GIAY
		WHERE ChiTietGH.MAGIAY=GIAY.MAGIAY AND @MAGIAY=ChiTietGH.MAGIAY
	END
GO
DECLARE @TENGIAY NVARCHAR(30),@BAOHANH DATE
EXEC CAU7 'N001',@TENGIAY OUTPUT,@BAOHANH OUTPUT
SELECT * FROM ChiTietGH

---8) Viết thủ tục trả về mặt hàng được giao gần đây nhất.
GO
CREATE PROC CAU8
@MAGIAY CHAR(10) OUTPUT,@TENGIAY NVARCHAR(30) OUTPUT
AS
	SELECT TOP(1) GIAY.MAGIAY,TENGIAY
	FROM ChiTietGH,GIAY
	WHERE ChiTietGH.MAGIAY=GIAY.MAGIAY ORDER BY NGAYGH ASC
GO
DECLARE @MAGIAY CHAR(10),@TENGIAY NVARCHAR(30)
EXEC CAU8 @MAGIAY OUTPUT,@TENGIAY OUTPUT
select TENGIAY,NGAYGH from ChiTietGH,GIAY where GIAY.MAGIAY=ChiTietGH.MAGIAY 


---9) Viết thủ tục in ra phí ship khi truyền vào MAGIAY.
GO
CREATE PROC CAU9
@MAGIAY CHAR(10)
AS
	SELECT PHISHIP
	FROM ChiTietGH
	WHERE MAGIAY=@MAGIAY
GO
EXEC CAU9 'N002'
SELECT * FROM ChiTietGH
---10) Viết thủ trả về các loại giày được giao trong năm 2020.
GO
CREATE PROC CAU10
 @TENGIAY NVARCHAR(30) OUTPUT,@NGAYGIAO DATE OUTPUT
 AS
	SELECT TENGIAY,NGAYGH
	FROM GIAY,ChiTietGH
	WHERE GIAY.MAGIAY=ChiTietGH.MAGIAY AND YEAR(NGAYGH)=2020
GO
DECLARE @TENGIAY NVARCHAR(30),@NGAYGIAO DATE
EXEC CAU10 @TENGIAY OUTPUT,@NGAYGIAO OUTPUT


---HÀM

--1.Hàm xuất hóa đơn khi truyền vào tên user
go
create function proc_ouPutGioHang(@userName nvarchar(50))
returns table
as
	return (select TENGIAY,GIOHANG.SOLUONG,TongDON from GIOHANG,GIAY 
	where GIOHANG.MAGIAY=GIAY.MAGIAY and @userName=userName)
go
select *from dbo.proc_ouPutGioHang('NGUYEN MINH HIEN')



--2.Khi truyền  vào hãng giày sẽ trả về các đôi giày của hãng đó
go
create function fu_HangGiay(@HangGiay nvarchar(50))
returns table
as
	return(select TENGIAY,GIABAN from GIAY,HANGGIAY where GIAY.MAHANG=HANGGIAY.MAHANG and TENHANG=@HangGiay)
go
select *from dbo.fu_HangGiay('nike')



--3.Viết hàm khi truyền vào user sẽ tính tổng hóa đơn của người đó
go
create function fu_TongHoaDon(@userName nvarchar(50))
returns float
as
begin
	declare @TongDon float
	set @TongDon=(select SUM(TongDON) from GIOHANG where @userName=userName)
	return @TongDon
end
go
Declare @TongDon float
set @TongDon=dbo.fu_TongHoaDon('NGUYEN MINH HIEN')
select @TongDon as N'Tổng ĐƠn'
--4.Viết in ra user mua giày nhiều nhất
go
create function fu_BestBuy()
returns table
as
	return (select top(1) with Ties userName, sum(SOLUONG)as N'Số lượng giày đã mua(Đôi)' 
	from GIOHANG group by userName order by SUM(SOLUONG) desc)
go
select *from dbo.fu_BestBuy()
--5.viết hàm trả về những user chưa mua hàng
go
create function fu_user_Dont_Buy()
returns table
as
	return (select account.userName from account where userName not in(select userName from GIOHANG))
go
select *from dbo.fu_user_Dont_Buy()



--6.Viết hàm trả về những đôi giày chưa ai mua
go
create function fu_sneaker()
returns table
as
	return (select TENGIAY from GIAY where MAGIAY not in (select MAGIAY from GIOHANG))
go
select *from dbo.fu_sneaker()


--7.viết hàm trả về mẫu giày được bán nhiều nhất
go
create function fu_BestSneaker()
returns table
as
	return(select top(1) with ties TENGIAY,sum(GIOHANG.SOLUONG)as N'Tổng số lượng đã bán' 
	from giay,GIOHANG where GIAY.MAGIAY=GIOHANG.MAGIAY 
	group by TENGIAY order by SUM(GIOHANG.SOLUONG) desc)
go
select *from dbo.fu_BestSneaker()



--8.Viết hàm trả về hãng giày bán nhiều nhất
go
create function fu_bestMade()
returns table
as
	return(select top(1) with ties TENHANG from GIAY,GIOHANG,HANGGIAY 
	where GIOHANG.MAGIAY=GIAY.MAGIAY and GIAY.MAHANG=HANGGIAY.MAHANG
		group by TENHANG
		order by sum(GIOHANG.SOLUONG) desc
	)
go

select * from fu_bestMade()
--9.Viết hàm khi truền vào tên hãng giày sẽ trả đôi mắc nhất
create function fu_ex_sneaker(@tenhang nvarchar(50))
returns table
as
	return(select top(1) with ties TENGIAY from GIAY,HANGGIAY
	 where GIAY.MAHANG=HANGGIAY.MAHANG and TENHANG=@tenhang
		group by TENGIAY
		order by SUM(GIABAN) desc
	)
go
select * from fu_ex_sneaker('NIKE')


--10.Viết hàm truyền vào tên hãng giày trả về tổng tiền của tất cả giày của hãng đó
go
create function fu_sum_money(@tenhang nvarchar(50))
returns float
as
begin
	declare @tongtien float
	set @tongtien=(select sum(GIABAN) from GIAY,HANGGIAY
	 where GIAY.MAHANG=HANGGIAY.MAHANG and @tenhang=TENHANG)
	return @tongtien
end
go
Declare @tongtien float
set @tongtien=dbo.fu_sum_money('Nike')
select @tongtien as 'Tổng tiền của Hãng Nike'


----TRIGGER
--1.Strigger kiem tra TENHANG thuộc 1 trong những hãng 
--( NIKE,PUMA,CONVERSE,NEW BALANCE,ADIDAS)
 CREATE TRIGGER KTRA_TENHANG
 ON HANGGIAY
 FOR INSERT,UPDATE
 AS
	if(select TENHANG from inserted) not in (N'NIKE',N'FUMA',N'ADIDAS',N'CONVERSE',N'NEW BALANCE')
	BEGIN
		PRINT N'Tên hãng phải thuộc:NIKE,ADIDAS,FUMA,CONVERSE,NEW BALANCE'
		ROLLBACK TRAN
	END
GO
INSERT INTO HANGGIAY
VALUES('G06','BITIS HUNTER')


--2.trigger kiểm tra  SOLUONG giay phai > 0
create trigger Ktra_Soluonggiay
on GIAY
FOR INSERT,UPDATE
AS
	if(select SOLUONG FROM inserted) <= 0
	BEGIN
		PRINT N'Số lượng giày phải lớn hơn 0'
		rollback tran
	END
go
INSERT INTO HANGGIAY
VALUES('G06','NIKE')
INSERT INTO GIAY
VALUES('N010','Nike Air Max 90','image/SanPham/airmax90.jpg','G06',0,2900000)


--3.trigger kiểm tra  GIABAN giay phai > 0
CREATE trigger Ktra_Giabangiay
on GIAY
FOR INSERT,UPDATE
AS
	if(select GIABAN FROM inserted) <= 0
	BEGIN
		PRINT N'Giá bán giày phải lớn hơn 0'
		rollback tran
	END
go
INSERT INTO GIAY
VALUES('N011','Nike Air Max 90','image/SanPham/airmax90.jpg','G06',100,0)

--4.trigger kiểm tra SOLUONG trong GIOHANG PHAI > 0
CREATE trigger Ktra_Soluonggtronggiohang
on GIOHANG
FOR INSERT,UPDATE
AS
	if(select SOLUONG FROM inserted) <= 0
	BEGIN
		PRINT N'Số lượng giày trong giỏ hàng phải lớn hơn 0'
		rollback tran
	END
go
INSERT INTO  account
values('PHAT','123')
INSERT INTO GIOHANG(SOLUONG,userName)
VALUES(0,'PHAT')


--5.Triggeer kiểm tra NGAYDOITRA ko được quá NGAYGH 7 ngày
GO
CREATE TRIGGER KT_NGAYDOITRA
ON ChiTietGH
FOR INSERT,UPDATE
AS
	IF((SELECT NGAYDOITRA FROM inserted)>DATEADD(DAY,7,(SELECT NGAYGH FROM inserted)))
	BEGIN
		PRINT N'Ngày đổi trả ko được quá NGAYGH quá 7 ngày.'
		ROLLBACK TRAN
	END
GO
SET DATEFORMAT DMY
INSERT INTO ChiTietGH(SOGH,MAGIAY,SLG,PHISHIP,TONGTIEN,BAOHANH,NGAYGH,NGAYDOITRA)
VALUES('GH03','N004',10,15000,29015000,'29/7/2021','29/7/2020','29/8/2020')




--6.Trigger kiểm tra BAOHANH phải lớn hơn NGAYGH 180 NGAY
GO
CREATE TRIGGER KT_BAOHANH
ON ChiTietGH
FOR INSERT,UPDATE
AS
	IF(SELECT BAOHANH FROM inserted)>DATEADD(DAY,180,(SELECT NGAYGH FROM inserted))
	BEGIN
		PRINT N'BAO HANH KO ĐƯỢC > HƠN 80 SO VỚI NGÀY GIAO'
		ROLLBACK TRAN
	END
GO
INSERT INTO ChiTietGH(SOGH,MAGIAY,SLG,PHISHIP,TONGTIEN,BAOHANH,NGAYGH,NGAYDOITRA)
VALUES('GH02','N001',10,15000,29015000,'30/7/2022','30/7/2020','1/8/2020')

--7.trigger kiểm tra TONGTIEN trong ChitietGH phải lớn hơn 0
create trigger Ktra_TONGTIEN
ON ChitietGH
for insert,update
as
	if(select TONGTIEN FROM inserted)<=0
	BEGIN
		PRINT N'Tổng tiền phải lớn hơn 0 nhé'
		rollback tran
	END
GO
INSERT INTO ChiTietGH(SOGH,MAGIAY,SLG,PHISHIP,TONGTIEN,BAOHANH,NGAYGH,NGAYDOITRA)
VALUES('GH13','N011',10,15000,0,'30/7/2021','30/7/2020','15/8/2020')

--8. trigger kiểm tra số lượng giao phải lớn hơn 0.
GO
CREATE TRIGGER KT_SLG
ON ChiTietGH 
FOR INSERT,UPDATE
AS
	IF(SELECT SLG FROM inserted)<=0
	BEGIN
		PRINT N'SLG PHẢI >0'
		ROLLBACK TRAN
	END
GO

INSERT INTO GIAOHANG(SOGH)
VALUES('GH05')
SET DATEFORMAT DMY
INSERT INTO ChiTietGH(SOGH,MAGIAY,SLG,PHISHIP,TONGTIEN,BAOHANH,NGAYGH,NGAYDOITRA)
VALUES('GH05','N001',0,15000,1000000,'30/9/2020','30/7/2020','5/8/2020')

--9 Viết trigger tự động cập nhật lại số lượng giày khi loại giày đó được giao.
GO
CREATE TRIGGER UP_SL
ON ChiTietGH
FOR INSERT,UPDATE
AS
	UPDATE GIAY
	SET SOLUONG=SOLUONG-(SELECT SLG FROM inserted,GIAY WHERE GIAY.MAGIAY=INSERTED.MAGIAY )
GO
INSERT INTO ChiTietGH
VALUES('GH05','N001',3,15000,1000000,'30/9/2020','30/7/2020','5/8/2020')
SELECT * FROM GIAY WHERE MAGIAY='N001'


10-- Viết trigger xóa những chitietgh được giao trong năm 2019.
INSERT INTO ChiTietGH
VALUES('GH01','N002',3,15000,1000000,'30/9/2019','30/7/2019','5/8/2019')
select * from ChiTietGH
GO
CREATE TRIGGER XOA_GIAY
ON ChiTietGH
FOR DELETE
AS
	IF(SELECT YEAR(NGAYGH) FROM DELETED)!=2019
	BEGIN
		PRINT N'CHỈ ĐƯỢC XÓA NĂM 2019'
		ROLLBACK  TRAN
	END
GO
DELETE FROM ChiTietGH WHERE SOGH='GH05'