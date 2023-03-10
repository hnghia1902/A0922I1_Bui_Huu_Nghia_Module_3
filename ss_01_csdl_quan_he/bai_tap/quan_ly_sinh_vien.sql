create database student_management;
use student_management;
create table class(
id int primary key,
name nvarchar(255)
);
create table teacher(
id int primary key,
`name` nvarchar(255),
age date,
country nvarchar(255)
);