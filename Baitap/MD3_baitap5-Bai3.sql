create database MD3_bai5_bai3;
use MD3_bai5_bai3;
-- ===============================================1. Tạo 3 bảng và chèn dữ liệu =========================================================

create table test(
testid int primary key auto_increment,
testname varchar(20) not null
);
create table Students(
RN int primary key auto_increment,
Sname varchar(20) not null,
age tinyint not null
);
create table studenttest(
RN int not null,
testid int not null,
datetest date,
mark float,
foreign key(RN) references Students(RN),
foreign key(testid) references test(testid)
);
insert into students(Sname,age)values
('Nguyen Hong Ha', 20 ),
('Truong Ngoc Anh', 30 ),
('Tuan Minh', 25 ),
('Dan Truong', 22 );
insert into test(testname) values('EPC'),('DWMX'),('SQL1'),('SQL2');
insert into studenttest(RN,testid,datetest,mark)values
(1 ,1, '2006-07-17', 8 ),
(1 ,2, '2006-07-18', 5 ),
(1 ,3, '2006-07-19', 7 ),
(2 ,1, '2006-07-17', 7 ),
(2 ,2, '2006-07-18', 4 ),
(2 ,3, '2006-07-19', 2 ),
(3 ,1, '2006-07-17', 10 ),
(3 ,3, '2006-07-18', 1 );
-- ===============================================2. Sử dụng alter để sửa đổi =========================================================
-- a. Thêm ràng buộc dữ liệu cho cột age với giá trị thuộc khoảng: 15-55 
alter table students 
add check(age>15 and age <55);
-- b. Thêm giá trị mặc định cho cột mark trong bảng StudentTest là 0 
alter table studenttest
modify mark float default 0;
-- c. Thêm khóa chính cho bảng studenttest là (RN,TestID)
alter table studenttest
add primary key(RN,TestID);
-- d. Thêm ràng buộc duy nhất (unique) cho cột name trên bảng Test 
alter table Test
modify testname varchar(20) unique;
-- e. Xóa ràng buộc duy nhất (unique) trên bảng Test 
ALTER TABLE test
DROP INDEX testname;
-- 3.============ Hiển thị danh sách các học viên đã tham gia thi, các môn thi được thi bởi cáchọc viên đó, điểm thi và ngày thi  ===========
select s.Sname,t.testname,st.mark,st.datetest
from students s join studenttest st on s.rn=st.rn join test t on t.testid=st.testid;
-- =========================================== 4. Hiển thị danh sách các bạn học viên chưa thi môn nào ===========================================
select *
from students s 
where s.rn !=all(select st.rn
from studenttest st);

-- ===================== Hiển thị danh sách học viên phải thi lại, tên môn học phải thi lại và điểm thi(điểmphải thi lại là điểm nhỏ hơn 5) =======================
select s.Sname,t.testname,st.mark
from students s join studenttest st on s.rn=st.rn join test t on t.testid=st.testid
where st.mark<5;
-- 6. ===================== Hiển thị danh sách học viên và điểm trung bình(Average) của các môn đã thi. ===================== 
-- Danh sách phải sắp xếp theo thứ tự điểm trung bình giảm dần(nếu không sắp
select s.Sname,avg (st.mark) as 'điểm trung bình'
from students s join studenttest st on s.rn=st.rn 
group by s.sname
order by avg(st.mark) desc;
--  =============================  7. Hiển thị tên và điểm trung bình của học viên có điểm trung bình lớn nhất  ============================
select s.Sname,avg(st.mark) as 'điểm trung bình lớn nhất'
from students s join studenttest st on s.rn=st.rn 
group by s.rn
having avg(st.mark)>=all(select avg(st.mark) as 'điểm trung bình lớn nhất'
from students s join studenttest st on s.rn=st.rn 
group by s.rn);
-- ====================== 8. Hiển thị điểm thi cao nhất của từng môn học. Danh sách phải được sắp xếp theo tên môn học========================= 
select t.testname,max(st.mark) as 'điểm cao nhất'
from studenttest st  join test t on t.testid=st.testid
group by t.testname
order by max(st.mark) desc;
-- ======================  9. Hiển thị danh sách tất cả các học viên và môn học mà các học viên đó đã thi nếu ====================== 
-- học viên chưa thi môn nào thì phần tên môn học để Null như sau:
select s.sname, t.testname
from test t left join studenttest st on t.testid=st.testid right join students s on st.RN=s.RN ;
--  ===================================== 10. Sửa (Update) tuổi của tất cả các học viên mỗi người lên một tuổi. ============================
update students 
set age = age+1
where rn in (1,2,3,4);
--  =============================== 11. Thêm trường tên là Status có kiểu Varchar(10) vào bảng Student  ======================================
alter table students
add column statuss  varchar(10);
-- ======== 12. Cập nhật(Update) trường Status sao cho những học viên nhỏ hơn 30 tuổi sẽ nhận giá trị ‘Young’, trường hợp còn lại ’================= 
-- nhận giá trị ‘Old sau đó hiển thị toàn bộ nội dung bảng Student lên như sau: 
select sname,  case when age>30 then 'Young'else 'Old'end as Statuss
from students;
-- 13. Hiển thị danh sách học viên và điểm thi, dánh sách phải sắp xếp tăng dần theo ngày thi như sau
select s.Sname,t.testname,st.mark,st.datetest
from students s join studenttest st on s.rn=st.rn join test t on t.testid=st.testid
order by st.datetest;
-- ==========================14. Hiển thị các thông tin sinh viên có tên bắt đầu bằng ký tự ‘T’ và điểm thi trung bình >4.5. ===============================
select s.Sname,t.testname, avg(st.mark) as 'điểm trung bình'
from students s join studenttest st on s.rn=st.rn join test t on t.testid=st.testid
where s.sname like 'T%'
group by s.rn
having avg(st.mark)>4.5;
-- 15. Hiển thị các thông tin sinh viên (Mã, tên, tuổi, điểm trung bình, xếp hạng). Trong
-- đó, xếp hạng dựa vào điểm trung bình của học viên, điểm trung bình cao nhất thì
-- xếp hạng 1. 
select s.Sname,t.testname, avg(st.mark) as 'điểm trung bình',case when avg(st.mark)>6 then 'xếp hạng 1'else ''end as 'Xếp hạng'
from students s join studenttest st on s.rn=st.rn join test t on t.testid=st.testid
group by s.rn;
-- --================================= 16. Sủa đổi kiểu dữ liệu cột name trong bảng student thành nvarchar(max)=================================
alter table  students
CHANGE COLUMN `Sname` `nvarchar(max)` VARCHAR(20) NOT NULL ;
-- 17. Cập nhật (sử dụng phương thức write) cột name trong bảng student với yêu cầu  ********** 3 câu cuối khó ***********
-- sau:
-- a. Nếu tuổi >20 -> thêm ‘Old’ vào trước tên (cột name)
-- b. Nếu tuổi <=20 thì thêm ‘Young’ vào trước tên (cột name)
alter table  students
CHANGE COLUMN `Sname` `Name old` VARCHAR(20) NOT NULL ;
-- 18. Xóa tất cả các môn học chưa có bất kỳ sinh viên nào thi 
select *
from students s 
where s.rn !=all(select st.rn
from studenttest st);
delete from students;
-- 19. Xóa thông tin điểm thi của sinh viên có điểm <5. 
ALTER TABLE studenttest
DROP COLUMN age  ;