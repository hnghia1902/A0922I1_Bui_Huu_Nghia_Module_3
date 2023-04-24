SELECT * FROM demo.users;
SET  @num := 0;

UPDATE `demo`.users SET id = @num := (@num+1);

ALTER TABLE `demo`.users AUTO_INCREMENT =1;
select * from demo.users where country like 'v%';
use demo;
select * from demo.users order by name asc