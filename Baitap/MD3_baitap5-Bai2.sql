create database MD3_baitap5_bai2;
use MD3_baitap5_bai2;

create  table student(
studentID int(4) primary key,
studentName nvarchar(50) not null,
age int not null,
email varchar(100) not null
);

create table Classes(
classId int(4) primary key,
className nvarchar(50)
);

create table subjects(
subject_Id int(4) primary key,
subjectName nvarchar(50)
);

create table marks(
mark int(4) primary key,
subjectId int(4),
studentID int(4),
foreign key (studentID) references student(studentID),
foreign key (subjectId) references subjects(subject_Id)
);

create table classStudent(
studentid int(4),
classid int(4),
foreign key(studentid) references student(studentID),
foreign key (classid) references classes(classId)
);
insert into student(studentID,studentName,age,email)values
(1,'Nguyen Quang An',18,'an@yahoo.com'),
(2,'Nguyen Cong Vinh',20,'vinh@gmail.com'),
(3,'Nguyen Van Quyet',19,'quyetyahoo.com'),
(4,'Pham Thanh Binh',25,'binh@com'),
(5,'Nguyen Van Tai Em',30,'taiem@spornt.vn');
insert into classes(classId,className)values
(1,'C0706L'),
(2,'C0708G');
insert into subjects(subject_Id,subjectName)values
(1,'SQL'),
(2,'Java'),
(3,'C'),
(4,'Visual Basic');
insert into marks(mark,subjectId,studentID)values
(8,1,1),
(4,2,1),
(9,1,1),
(7,1,3),
(3,1,4),
(5,2,5),
(0,3,3),
(1,3,5),
(2,2,4);

-- 1. Hien thi danh sach tat ca cac hoc vien 
select * from student;
-- 2. Hien thi danh sach tat ca cac mon hoc
select * from subjects;
-- 3. Tinh diem trung binh 
select  avg(mark) as diem_trung_binh
from marks ;
-- 4. Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
select s.studentName,max(m.mark) as điểm_cao_nhất
from student s join marks m on m.studentid=s.studentid;
-- 5. Danh so thu tu cua diem theo chieu giam 
select * from marks
order by mark desc;
-- 6. Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max) 
ALTER TABLE subjects
MODIFY COLUMN SubjectName nvarchar(255);
-- 7. Cap nhat them dong chu « Day la mon hoc « vao truoc cac ban ghi tren cot SubjectName trong bang Subjects 
select s.subject_Id,s.subjectName as đây_là_môn_học from subjects s;
-- 8. Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
alter table student
add check(age>15 and age<50);
-- 9. Loai bo tat ca quan he giua cac bang
 ALTER TABLE Student
drop column status;
-- 10.Xoa hoc vien co StudentID la 1
delete from student
where studentid=5;
-- 11.Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
alter table student 
add column Statuss Bit default(1);
-- 2.Cap nhap gia tri Status trong bang Student thanh 0 
update  Student 
set statuss=0
where studentid=1;

