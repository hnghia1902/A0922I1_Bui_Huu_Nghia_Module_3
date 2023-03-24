-- 1
create database demo;
use demo;
-- b2
create table product(
id int primary key,
product_Code int,
product_Name varchar(45),
product_Price varchar(45),
product_Amount varchar(45),
product_Description varchar(45),
product_Status varchar(45)
);

insert into product
value(1,11,'a','z','x','c','v'),
	(2,22,'c','v','d','e','q'),
    (3,33,'e','w','q','e','p');
    -- b3
-- 1 
create unique index product_Code
on product(product_Code);    
-- 2
create index product_Name_Price
on product(product_Name, product_Price);
-- 3
EXPLAIN select * from product;
-- b4
create view thong_tin_product 
as 
select product_Code, product_Name, product_Price, product_Status 
from product;
select * from thong_tin_product;
update thong_tin_product
set product_Name = 'giga'
where product_Code = 11;
drop view thong_tin_product;
-- b5
-- 1
delimiter $$
create procedure allProduct()
begin
select * from product;
end
$$ delimiter ;
call allProduct();
-- 2
delimiter $$
create procedure addProduct(in id int, in pd_Cd int, in pd_N varchar(45), in pd_P varchar(45),in pd_A varchar(45), in pd_D varchar(45), in pd_S varchar(45))
begin
insert into product
value (id, pd_Cd, pd_N, pd_P, pd_A, pd_D, pd_S);
end
$$ delimiter ;
call addProduct(4,2,'d','pp','f','a1','m2');
-- 3
delimiter $$
create procedure editProduct(in id int, in pd_Cd int, in pd_N varchar(45), in pd_P varchar(45),in pd_A varchar(45), in pd_D varchar(45), in pd_S varchar(45))
begin
update product 
set
 product_Code = pd_Cd,
 product_Name = pd_N, 
 product_Price = pd_P, 
 product_Amount = pd_A, 
 product_Description = pd_D, 
 product_Status = pd_S
where id = id;
end
$$ delimiter ;

call editProduct(1,1000,'giga_speed','23w','as','nmd9','2f');

CALL `demo`.`editProduct`(3, 95, 'giga_speed','23w','as','nmd9','2f');
-- 4
delimiter $$
create procedure delete_ID_Product(in Id int)
begin
delete  from product
where id = Id;
end
$$ delimiter ;
call delete_ID_Product(3);


