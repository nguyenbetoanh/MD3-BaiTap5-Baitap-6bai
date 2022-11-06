Create Database QuanLyDiemSV CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci;
use QuanLyDiemSV;
-- ========================================================Bước 1 Tạo cơ sở dữ liệu demo===============================================
/*=============DANH MUC KHOA==============*/
Create table DMKhoa(
	MaKhoa char(2) primary key,
	TenKhoa nvarchar(30)not null
);
/*==============DANH MUC SINH VIEN============*/
Create table DMSV(
MaSV char(3) not null primary key,
HoSV nvarchar(15) not null,
TenSV nvarchar(7)not null,
Phai nchar(7),
NgaySinh datetime not null,
NoiSinh nvarchar (20),
MaKhoa char(2),
HocBong float
);
/*===================MON HOC========================*/
create table DMMH(
MaMH char (2) not null,
TenMH nvarchar (25)not null,
SoTiet tinyint,
Constraint DMMH_MaMH_pk primary key(MaMH)
);
/*=====================KET QUA===================*/
Create table KetQua
(
MaSV char(3) not null,
MaMH char (2)not null ,
LanThi tinyint,
Diem decimal(4,2),
Constraint KetQua_MaSV_MaMH_LanThi_pk primary key (MaSV,MaMH,LanThi)
);
/*==========================TAO KHOA NGOAI==============================*/
Alter table dmsv
add Constraint DMKhoa_MaKhoa_fk foreign key (MaKhoa)
References DMKhoa (MaKhoa);
Alter table KetQua
add constraint KetQua_MaSV_fk foreign key (MaSV) references DMSV (MaSV);
Alter table KetQua
add constraint DMMH_MaMH_fk foreign key (MaMH) references DMMH (MaMH);
/*==================NHAP DU LIEU====================*/
/*==============NHAP DU LIEU DMMH=============*/
Insert into DMMH(MaMH,TenMH,SoTiet)
values('01','Cơ Sở Dữ Liệu',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('02','Trí Tuệ Nhân Tạo',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('03','Truyền Tin',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('04','Đồ Họa',60);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('05','Văn Phạm',60);
/*==============NHAP DU LIEU DMKHOA=============*/
Insert into DMKhoa(MaKhoa,TenKhoa)
values('AV','Anh Văn');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TH','Tin Học');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TR','Triết');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('VL','Vật Lý');
/*==============NHAP DU LIEU DMSV=============*/
Insert into DMSV
values('A01','Nguyễn Thị','Hải','Nữ','1990-03-20','Hà Nội','TH',130000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A02','Trần Văn','Chính','Nam','1992-12-24','Bình Định','VL',150000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A03','Lê Thu Bạch','Yến','Nữ','1990-02-21','TP Hồ Chí Minh','TH',170000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A04','Trần Anh','Tuấn','Nam','1990-12-20','Hà Nội','AV',80000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B01','Trần Thanh','Mai','Nữ','1991-08-12','Hải Phòng','TR',0);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B02','Trần Thị Thu','Thủy','Nữ','1991-01-02','TP Hồ Chí Minh','AV',0);
/*==============NHAP DU LIEU BANG KET QUA=============*/
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',1,3);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',2,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','02',2,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','03',1,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',1,4.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',2,7);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','03',1,10);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','05',1,9);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',1,2);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',2,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',1,2.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',2,4);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A04','05',2,10);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','01',1,7);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',1,2.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',2,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','02',1,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','04',1,10);

-- Tạo bảng Products với các trường dữ liệu ID
use quanlydiemsv
delimiter &&
drop procedure if exists getId &&
create procedure getId(in idsv varchar(3))
begin
select * from dmsv where masv=idsv;
end &&
delimiter &&
call getid('a01')
-- =========================================== Bước 2: Tạo bảng Products với các trường dữ liệu sau:=======================================

-- Tạo bảng Products với các trường dữ liệu TenSV
delimiter &&
drop procedure if exists getName &&
create procedure getName(in namesv varchar(7))
begin
select * from dmsv where tensv=namesv;
end &&
delimiter &&
call getName('Hải');
-- Tạo bảng Products với các trường dữ liệu Phai
delimiter &&
drop procedure if exists getGioi &&
create procedure getGioi(in gioisv varchar(7))
begin
select * from dmsv where phai=gioisv;
end &&
delimiter &&
call getGioi('Nam');
-- Tạo bảng Products với các trường dữ liệu NgaySinh
delimiter &&
drop procedure if exists getDate &&
create procedure getDate(in svDate date)
begin
select * from dmsv where NgaySinh=svDate;
end &&
delimiter &&
call getDate('1992-12-24');
-- Tạo bảng Products với các trường dữ liệu HocBong
delimiter &&
drop procedure if exists getHocBong &&
create procedure getHocBong(in svHocBong float)
begin
select * from dmsv where HocBong =svHocBong ;
end &&
delimiter &&
call getHocBong(0);

-- =================================================================== Bước 3: =============================================================
select *from dmsv;
-- 1 Tạo Unique Index trên bảng dmsv (sử dụng cột tensv để tạo chỉ mục)
create index index_hb on dmsv(hocbong desc);
-- 2 Tạo Composite Index trên bảng dmsv (sử dụng 2 cột productName và productPrice)
 create index index_fullName on dmsv(hosv,tensv)
 -- 3 Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT * FROM dmsv
SHOW WARNINGS
-- 1  Tạo view lấy về các thông tin từ bảng dmsv 
create view viewTestform-- =================================================================== Bước 4: =============================================================
Dmsv as
select * from dmsv;
select * from viewTestformDmsv
-- 2  Tiến hành xoá view
drop view viewTestformDmsv;
-- =================================================================== Bước 5: =============================================================
-- 1 tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng dmsv
delimiter &&
drop procedure if exists SelectAllSutdent &&
CREATE PROCEDURE SelectAllSutdent()
begin
SELECT * FROM dmsv;
end &&
delimiter &&
call SelectAllSutdent();
-- 2 Tạo store procedure thêm một sản phẩm mới 
delimiter &&
drop  procedure if exists themmoidmsv &&
create procedure themmoidmsv(in masv varchar(3),in hosv varchar(15),in tensv varchar(7),in phai varchar(7)
,in ngaysinh date,in noisinh varchar(20),in makhoa char(2),in hocbong float)
begin
insert into dmsv(masv,hosv,tensv,phai,ngaysinh,noisinh,makhoa,hocbong)
values (masv,hosv,tensv,phai,ngaysinh,noisinh,makhoa,hocbong);
end &&
delimiter &&
call themmoidmsv('C01','Bùi Dối','Hai','Nam','1998-10-1','Cầu giấy','AV',9999);
-- 3 Tạo store procedure sửa thônMaSVMaSVg tin sản phẩm theo id 
delimiter &&
drop  procedure if exists updatesv &&
create procedure updatesv(in id varchar(3),in hosv varchar(15),in tensv varchar(7),in phai varchar(7)
,in ngaysinh date,in noisinh varchar(20),in makhoa char(2),in hocbong float)
begin
update dmsv
set hosv=hosv,tensv=tensv,phai=phai,ngaysinh=ngaysinh,noisinh=noisinh,makhoa=makhoa,hocbong=hocbong
where masv=id;
end &&
delimiter &&
call  quanlydiemsv.updatesv('A01','aaaaaaa','aaaaa','Nam','1999-9-9','aaaaa','AV',11111);
-- 4 Tạo store procedure xoá sản phẩm theo id 
delimiter &&
drop  procedure if exists  deletesv &&
create procedure deletesv(in id varchar(3))
begin
delete from dmsv
where masv=id;
end &&
delimiter &&
call deletesv('A07');