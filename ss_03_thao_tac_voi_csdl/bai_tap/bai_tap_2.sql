INSERT INTO customer(cID, cName, cAge)
value
(1, 'Minh_Quan', 10),
(2, 'Ngoc_Oanh', 20),
(3, 'Hong_Ha', 50);
INSERT INTO `order` (oID, cID, oDate)
VALUE 
	(1, 1, '2006-3-21'),
    (2, 2, '2006-3-23'),
    (3, 1, '2006-3-16');
INSERT INTO product (pID, pName, pPrice)
VALUE 
	(1, 'May Giat', 3),
    (2, 'Tu Lanh', 5),
    (3, 'Dieu Hoa', 7),
    (4, 'Quat', 1),
    (5, 'Bep Dien', 2);
INSERT INTO orderdetail (oID, pID, odQTY)
VALUE 
	(1, 1, 3),
    (1, 3, 7),
    (1, 4, 2),
    (2, 1, 1),
    (3, 1, 8),
    (2, 5, 4),
    (2, 3, 3);
    -- 2
    select oID, oDate, oTotalPrice
    from `order`;
    -- 3
    select C.cID, C.cName, O.oID, P.pName
    from customer C
    INNER join `Order` O on C.cID = o.cID
	inner join OrderDetail OD on O.oID = OD.oID
	inner join Product P on P.pID = OD.pID;
    -- 4
    select cID, cName
    from customer 
    where customer.cID not in (select cID from `order`);
    -- 5
    select od.oID,o.oDate,sum( od.odQTY*p.pPrice ) as thanhtien
from `Order`  o inner join OrderDetail  od on o.oID=od.oID inner join Product  p on p.pID=od.pID
group by o.oID;

    
    
    