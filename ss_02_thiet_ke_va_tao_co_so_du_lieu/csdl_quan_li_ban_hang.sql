create database casestudy_database;
use casestudy_database;
create table vi_tri(
	ma_vi_tri int primary key not null,
    ten_vi_tri varchar(45)
    );

create table trinh_do(
	ma_trinh_do int primary key not null,
    ten_trinh_do varchar(45)
);

create table bo_phan(
	ma_bo_phan int primary key not null,
    ten_bo_phan varchar(45) 
);

create table nhan_vien(
	ma_nhan_vien int primary key not null,
    ho_ten varchar(45),
    ngay_sinh date,
    so_cmnd varchar(45),
    luong double,
    so_dien_thoai varchar(10),
    email varchar(45),
    dia_chi varchar(45),
    ma_vi_tri int,
    ma_trinh_do int,
    ma_bo_phan int,
    foreign key (ma_vi_tri) references vi_tri (ma_vi_tri),
    foreign key (ma_trinh_do) references trinh_do (ma_trinh_do),
	foreign key (ma_bo_phan) references bo_phan (ma_bo_phan)
);

create table loai_khach (
	ma_loai_khach int primary key not null,
    ten_loai_khach varchar(45) 
);

create table khach_hang (
	ma_khach_hang int primary key not null,
    ma_loai_khach int,
    ho_ten varchar(45),
    ngay_sinh date,
    gioi_tinh bit(1),
    so_cmnd varchar(45),
    so_dien_thoai varchar(10),
    email varchar(45),
    dia_chi varchar(45),
    foreign key (ma_loai_khach) references loai_khach (ma_loai_khach)
);

create table kieu_thue(
	ma_kieu_thue int primary key not null,
    ten_kieu_thue varchar(45)
);

create table loai_dich_vu(
	ma_loai_dich_vu int primary key not null,
    ten_loai_dich_vu varchar(45)
);

create table dich_vu(
	ma_dich_vu int primary key not null,
    ten_dich_vu varchar(45),
    dien_tich int,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da int,
    ma_kieu_thue int,
    ma_loai_dich_vu int,
    tieu_chuan_phong varchar(45),
    mo_ta_tien_nghi_khac varchar(45),
    dien_tich_ho_boi double,
    so_tang int,
    FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue (ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu (ma_loai_dich_vu)
);

create table hop_dong(
	ma_hop_dong int primary key not null,
    ngay_lam_hop_dong datetime,
    ngay_ket_thuc datetime,
    tien_dat_coc double,
    ma_nhan_vien int,
    ma_khach_hang int,
    ma_dich_vu int,
    foreign key (ma_nhan_vien) references nhan_vien (ma_nhan_vien),
    foreign key (ma_khach_hang) references khach_hang (ma_khach_hang),
	foreign key (ma_dich_vu) references dich_vu (ma_dich_vu)
);

create table dich_vu_di_kem(
	ma_dich_vu_di_kem int primary key not null,
    ten_dich_vu_di_kem varchar(45),
    gia double,
    don_vi varchar(10),
    trang_thai  varchar(45)
);

create table hop_dong_chi_tiet (
	ma_hop_dong_chi_tiet int primary key not null,
    ma_hop_dong int,
    ma_dich_vu_di_kem int,
    so_luong int,
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong (ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
);

-- data
insert into vi_tri
values (1, 'Quản Lý'),
		(2, 'Nhân Viên');

insert into trinh_do
values (1,'Trung Cấp'),
		(2, 'Cao Đẳng'),
        (3, 'Đại Học'),
        (4, 'Sau Đại Học');
        
insert into bo_phan
values (1, 'Sale-Marketing'),
		(2, 'Hành chính'),
        (3, 'Phục vụ'),
        (4, 'Quản lý');
        
insert into nhan_vien
values (1, 'Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1,3,1),
		(2,	'Lê Văn Bình',	'1997-04-09', '654231234', 7000000,	'0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1,	2, 2),
        (3,	'Hồ Thị Yến',	'1995-12-12',	'999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3,	2),
		(4,	'Võ Công Toản',	'1980-04-04',	'123231365', 17000000,'0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
		(5, 'Nguyễn Bỉnh Phát', '1999-12-09','454363232',6000000,'0902341231','phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1),
		(6,'Khúc Nguyễn An Nghi','2000-11-08','964542311',7000000,'0978653213','annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng',2,2,3),
		(7,'Nguyễn Hữu Hà','1993-01-01','534323231',8000000,'0941234553','nhh0101@gmail.com','4 Nguyễn Chí Thanh, Huế',2,3,2),
		(8,'Nguyễn Hà Đông','1989-09-03','234414123',9000000,'0642123111','donghanguyen@gmail.com','111 Hùng Vương, Hà Nội',2,4,4),
		(9,'Tòng Hoang','1982-09-03','256781231',6000000,'0245144444','hoangtong@gmail.com','213 Hàm Nghi, Đà Nẵng',2,4,4),
		(10,'Nguyễn Công Đạo','1994-01-08','755434343',8000000,'0988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2);

insert into loai_khach
values (1, 'Diamond'),
		(2, 'Platinum'),
        (3, 'Gold'),
        (4, 'Silver'),
        (5, 'Member');
        
insert into khach_hang
values (1,5,'Nguyễn Thị Hào','1970-11-07',0,'643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng'),
		(2,3,'Phạm Xuân Diệu','1992-08-08',1,'865342123','0954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị'),
		(3,1,'Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh'),
		(4,1,'Dương Văn Quan','1981-07-08',1,'543432111','0490039241','duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng'),
		(5,4,'Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai'),
		(6,4,'Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng'),
		(7,1,'Nguyễn Mỹ Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh'),
		(8,3,'Nguyễn Thị Hào','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum'),
		(9,1,'Trần Đại Danh','1994-07-01',1,'432341235','0643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi'),
		(10,2,'Nguyễn Tâm Đắc','1989-07-01',1,'344343432','0987654321','dactam@gmail.com','22 Ngô Quyền, Đà Nẵng');

insert into kieu_thue
values (1, 'year'),
		(2, 'month'),
        (3, 'day'),
        (4, 'hour');
        
insert into loai_dich_vu
values (1, 'Villa'),
		(2, 'House'),
        (3, 'Room');
        
insert into dich_vu 
values (1,'Villa Beach Front',25000,10000000,10,3,1,'vip','Có hồ bơi',500,4);
insert into dich_vu (ma_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,ma_kieu_thue,ma_loai_dich_vu,tieu_chuan_phong,mo_ta_tien_nghi_khac,so_tang)
values (2,'House Princess 01',14000,5000000,7,2,2,'vip','Có thêm bếp nướng',3);
insert into dich_vu (ma_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,ma_kieu_thue,ma_loai_dich_vu,tieu_chuan_phong,mo_ta_tien_nghi_khac)
values (3,'Room Twin 01',5000,1000000,2,4,3,'normal','Có tivi');
insert into dich_vu
values (4,'Villa No Beach Front',22000,9000000,8,3,1,'normal','Có hồ bơi',300,3);
insert into dich_vu (ma_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,ma_kieu_thue,ma_loai_dich_vu,tieu_chuan_phong,mo_ta_tien_nghi_khac,so_tang)
values (5,'House Princess 02',10000,4000000,5,3,2,'normal','Có thêm bếp nướng',2);
insert into dich_vu (ma_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,ma_kieu_thue,ma_loai_dich_vu,tieu_chuan_phong,mo_ta_tien_nghi_khac)
values (6,'Room Twin 02',3000,900000,2,4,3,'normal','Có tivi');

insert into dich_vu_di_kem
values (1,'Karaoke',10000,'giờ','tiện nghi, hiện đại'),
		(2,'Thuê xe máy',10000,'chiếc','hỏng 1 xe'),
		(3,'Thuê xe đạp',20000,'chiếc','tốt'),
		(4,'Buffet buổi sáng',15000,'suất','đầy đủ đồ ăn, tráng miệng'),
		(5,'Buffet buổi trưa',90000,'suất','đầy đủ đồ ăn, tráng miệng'),
		(6,'Buffet buổi tối',16000,'suất','đầy đủ đồ ăn, tráng miệng');
        
insert into hop_dong
values (1,'2020-12-08','2020-12-08',0,3,1,3),
		(2,'2020-07-14','2020-07-21',200000,7,3,1),
		(3,'2021-03-15','2021-03-17',50000,3,4,2),
		(4,'2021-01-14','2021-01-18',100000,7,5,5),
		(5,'2021-07-14','2021-07-15',0,7,2,6),
		(6,'2021-06-01','2021-06-03',0,7,7,6),
		(7,'2021-09-02','2021-09-05',100000,7,4,4),
        (8,'2021-06-17','2021-06-18',150000,3,4,1),
		(9,'2020-11-19','2020-11-19',0,3,4,3),
		(10,'2021-04-12','2021-04-14',0,10,3,5),
		(11,'2021-04-25','2021-04-25',0,2,2,1),
		(12,'2021-05-25','2021-05-27',0,7,10,1);
        
insert into hop_dong_chi_tiet
values (1,2,4,5),
		(2,2,5,8),
		(3,2,6,15),
		(4,3,1,1),
		(5,3,2,11),
		(6,1,3,1),
		(7,1,2,2),
		(8,12,2,2);
        
        
-- 2
select *
 from nhan_vien
 where (ho_ten like '% % H%') or (ho_ten like '% % T%') or (ho_ten like '% % K%') and (select length(ho_ten))<15;
-- 3
select *
from khach_hang kh
where timestampdiff(year,kh.ngay_sinh,now()) between 18 and 50
and (dia_chi like '%_Đà Nẵng') or (dia_chi like '%_Quảng Trị');
-- 4
select kh.ma_khach_hang, kh.ho_ten, count(hd.ma_hop_dong) as so_lan_dat_phong
from khach_hang kh
inner join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
where kh.ma_loai_khach = 1
group by kh.ho_ten
order by so_lan_dat_phong asc;
-- 5
	select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, (dv.chi_phi_thue + ifnull(hdct.so_luong*dvdk.gia, 0)) as tong_tien
	from khach_hang kh
	left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
	left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
	left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
	left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
	left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
	group by hd.ma_hop_dong
	order by kh.ma_khach_hang;
    -- 6
    select *
    from dich_vu dv
    inner join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
    where dv.ma_dich_vu not in
(select ma_dich_vu from hop_dong where
year(ngay_lam_hop_dong) = '2021' and (month(ngay_lam_hop_dong) between 1 and 3));
-- 07
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
inner join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where dv.ma_dich_vu not in 
(select ma_dich_vu from hop_dong where
year(ngay_lam_hop_dong) = '2021') and year(hd.ngay_lam_hop_dong) = '2020'
group by dv.ma_dich_vu;

--  08
SELECT 
	DISTINCT ho_ten 
FROM 
	khach_hang;

--  09
select month(ngay_lam_hop_dong) as 'thang', count(ma_khach_hang) as so_luong_kh
from hop_dong
where year(ngay_lam_hop_dong) = '2021'
GROUP BY thang
order by thang asc;

-- Task 10
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(ifnull(hdct.so_luong, 0)) as so_luong
from hop_dong hd
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
group by hd.ma_hop_dong;

--  11
select lk.ten_loai_khach, dvdk.ma_dich_vu_di_kem ,dvdk.ten_dich_vu_di_kem
from hop_dong hd
inner join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
inner join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
inner join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
inner join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where (kh.dia_chi like '%_Vinh') or (kh.dia_chi like '%_Quãng Ngãi') and (kh.ma_loai_khach = 1);

-- 12
select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu, sum(ifnull(hdct.so_luong, 0)) as so_luong
from hop_dong hd
left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
left join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
where hd.ma_hop_dong in 
(select ma_hop_dong from hop_dong where
year(ngay_lam_hop_dong) = '2020' and (month(ngay_lam_hop_dong)between 10 and 12))
and hd.ma_hop_dong not in
(select ma_hop_dong from hop_dong where
year(ngay_lam_hop_dong) = '2021' and (month(ngay_lam_hop_dong)between 1 and 6))
group by hd.ma_hop_dong;

--  13
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dv_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having sum(hdct.so_luong) = (select max(max.soluong) from
(select sum(hdct.so_luong) as soluong from hop_dong_chi_tiet hdct 
group by hdct.ma_dich_vu_di_kem) as max);

--  14
select hd.ma_hop_dong, dv.ten_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong hd
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
group by dvdk.ten_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem) = 1
order by hd.ma_hop_dong asc;

--  15
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
where year(hd.ngay_lam_hop_dong) between 2020 and 2021
group by nv.ma_nhan_vien
having count(hd.ma_nhan_vien) <= 3;

-- 16
select ma_nhan_vien from nhan_vien;
delete  from nhan_vien nv
where nv.ma_nhan_vien not in (select * from  (
 (select hd.ma_nhan_vien from hop_dong hd 
 where year(hd.ngay_lam_hop_dong) >= 2019 and year(hd.ngay_lam_hop_dong) <= 2021)));
 
 
 delete from nhan_vien nv
 where nv.ma_nhan_vien not in 
 (3);


-- 17
update khach_hang 
set ma_loai_khach = (select ma_loai_khach from loai_khach where ten_loai_khach like 'Diamond')
where 
	ma_loai_khach = (select ma_loai_khach from loai_khach where ten_loai_khach like 'Platinium') and 
    ma_khach_hang in (select tong_tien_theo_hop_dong.ma_khach_hang from
							(select ma_khach_hang, if (hop_dong_chi_tiet.ma_hop_dong is null, dich_vu.chi_phi_thue, dich_vu.chi_phi_thue + sum(hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia)) as tong_tien_hop_dong
							from khach_hang 
							inner join loai_khach using(ma_loai_khach) 
							inner join hop_dong using(ma_khach_hang) 
							inner join dich_vu using (ma_dich_vu)
							left join hop_dong_chi_tiet using (ma_hop_dong)
							left join dich_vu_di_kem using (ma_dich_vu_di_kem)
							where year(hop_dong.ngay_lam_hop_dong) = 2021
							group by khach_hang.ma_khach_hang, hop_dong.ma_hop_dong) as tong_tien_theo_hop_dong
						group by tong_tien_theo_hop_dong.ma_khach_hang
						having sum(tong_tien_theo_hop_dong.tong_tien_hop_dong) > 10000000);
                        
-- 18
update khach_hang
set ho_ten = 'del'
where ma_khach_hang in (
	select * from (select ma_khach_hang from khach_hang kh left join hop_dong hd using (ma_khach_hang)
					where year(hd.ngay_lam_hop_dong)<2021) as kh_can_xoa
);

delete from hop_dong_chi_tiet
where ma_hop_dong_chi_tiet in (
	select * from (select ma_hop_dong_chi_tiet from khach_hang kh left join hop_dong hd using (ma_khach_hang) join hop_dong_chi_tiet hdct using (ma_hop_dong)
					where kh.ho_ten = 'del') as hdct_can_xoa
);

delete from hop_dong
where ma_khach_hang in (
	select ma_khach_hang from khach_hang where ho_ten = 'del');

delete from khach_hang
where ho_ten = 'del';

-- 19
update dich_vu_di_kem
set gia = gia *2
where ma_dich_vu_di_kem in (
select * from (select ma_dich_vu_di_kem from dich_vu_di_kem
join hop_dong_chi_tiet
using (ma_dich_vu_di_kem)
join hop_dong
using (ma_hop_dong)
where year(ngay_lam_hop_dong) = 2020
group by ma_dich_vu_di_kem
having sum(so_luong)>=10) as dich_vu_di_kem_can_nag_gia
);

-- 20
select ma_nhan_vien, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;