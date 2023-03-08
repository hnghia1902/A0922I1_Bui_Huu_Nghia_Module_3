create database quan_li_ban_hang;
use quan_li_ban_hang;
create table customer(
cID int primary key,
cName nvarchar(255),
cAge nvarchar(255)
);
create table oder(
oID int primary key,
oDate date,
oTotalPrice double,
cID int,
foreign key (cID) references Customer(cID)
);
create table product(
pID int primary key,
pName nvarchar(255),
pPrice double
);
create table OderDetail(
oID int,
pID int,
odQTY nvarchar(255),
foreign key (oID) references oder(oID),
foreign key(pID) references product(pID)
);
