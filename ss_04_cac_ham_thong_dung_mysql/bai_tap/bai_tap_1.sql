-- 1
select *
from `subject`
group by credit
having Credit = (select max(credit) from `subject`);
-- 2
select SubName, Mark 
from `subject` s
inner join mark m on s.subid = m.SubId
having mark = (select max(mark) from mark);
-- 3
select Stu.StudentID, Stu.StudentName, Stu.ClassID, Stu.Address ,avg(M.Mark) as 'DiemTrungBinh'
from Student Stu 
inner join Mark M on Stu.StudentID = M.StudentID
group by Stu.StudentName
order by DiemTrungBinh DESC
