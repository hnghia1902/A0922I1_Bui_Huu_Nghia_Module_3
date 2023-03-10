-- 1
select *
from student
where StudentName like 'h%';
-- 2
select *
from class 
where month(StartDate) = '12';
-- 3
select *
from `subject`
where Credit >3  and credit  <5;
-- 4
update student
set classID = 2
where StudentName = 'Hung';
drop database quan_ly_sinh_vien;
-- 5
select student.studentName, `subject`.subName, mark.mark from student, `subject`, mark
ORDER BY mark.Mark DESC, student.StudentName;
