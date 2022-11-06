create database MD3_Bai5_bai4;
use  MD3_Bai5_bai4;
-- ================================================ 1. Tạo 4 bảng và chèn dữ liệu ================================================
create table Customer(
cID varchar(3) primary key,
cName varchar(20),
cAge int (4)
);
create table orders(
oId varchar(3) primary key,
cID varchar(3),
oDate date,
oTotalPrice int,
foreign key (cId) references customer(cId)
);
create table Product(
pID varchar(3) primary key,
pName varchar(20),
pPrice float
);
create table OrderDetail(
oID varchar(3),
pID varchar(3),
odQTY int,
foreign key(oID) references orders(oID),
foreign key(pId) references Product(pId)
);
insert into customer(cID,cName,cAge)values
(1,'Minh Quân',10),
(2,'Ngọc Oanh',20),
(3,'Hồng Hà',50);
insert into orders(oId,cID,oDate)values
(1,1,'2006-3-21'),
(2,2,'2006-3-23'),
(3,1,'2006-3-16');
insert into Product(pID,pName,pPrice)values
(1,'Máy giặt',3),
(2,'Tủ lạnh',5),
(3,'Điều hòa',7),
(4,'Quạt',1),
(5,'Bếp Điện',2);
insert into orderdetail(oID,pID,odQTY)values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
-- 2. Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơntrong bảng Order, 
-- danh sách phải sắp xếp theo thứ tự ngày tháng, hóađơn mới hơn nằm trên như hình sau:
select *
from orders
order by  oDate desc;
-- 3. Hiển thị tên và giá của các sản phẩm có giá cao nhất 
select p.pName, max(p.pPrice) as 'Giá cao nhất'
from product p
group by p.pprice
order by p.pprice desc
limit 1;
-- ================ 4. Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách đó ====================
select c.cName,p.pname
from customer c join orders o on c.cid =o.cid join orderdetail od on od.oID=o.oid join product p on p.pID=od.pid;
-- ====================  5. Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào====================
select c.cName
from customer c
group by c.cname
having c.cname != all(select c.cName
from customer c join orders o on c.cid =o.cid join orderdetail od on od.oID=o.oid join product p on p.pID=od.pid);
--  ================================ 6. Hiển thị chi tiết của từng hóa đơn  ================================================================
select o.oid,o.odate,od.odQTY,p.pname,p.pprice
from customer c join orders o on c.cid =o.cid join orderdetail od on od.oID=o.oid join product p on p.pID=od.pid
order by o.oid;
-- 7. Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa
-- đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice) như sau: 
select o.oId,o.oDate,sum(od.odqty*p.pprice) as Total
from customer c join orders o on c.cid =o.cid join orderdetail od on od.oID=o.oid join product p on p.pID=od.pid
group by o.odate
order by o.oid

