DROP TABLE demo;

CREATE TABLE Promotion(
 						promotion_id char(4) not null,
  						promotion_discount float,
  						promotion_start date,
  						promotion_end date,
  						Primary KEY (promotion_id));

CREATE TABLE Member(
  						member_id char(5) not null,
  						member_fname varchar(20),
  						member_lname varchar(20),
  						member_address varchar(40),
  						member_email varchar(30),
  						member_phone varchar(10),
  						member_dob date,
  						PRIMARY KEY (member_id));

CREATE TABLE Product(
 						product_id char(4) not null,
  						product_name varchar(100),
  						product_description varchar(400),
  						product_price float,
  						product_quantity int,
  						PRIMARY KEY (product_id),
  						promotion_id char(4) FOREIGN KEY REFERENCES Promotion(promotion_id));

CREATE TABLE Orders(
  						order_id char(5) not null,
  						product_id char(4) FOREIGN KEY REFERENCES Product(product_id),
  						member_id char(5) FOREIGN KEY REFERENCES Member(member_id),
  						order_quantity int,
  						order_total float,
  						payment_method varchar(20),
  						PRIMARY KEY (order_id));

CREATE TABLE Review(
  						review_id char(5) not null,
  						product_id char(4) FOREIGN KEY REFERENCES Product(product_id),
  						member_id char(5) FOREIGN KEY REFERENCES Member(member_id),
  						review_comment varchar(750),
  						review_rating tinyint not null check(review_rating BETWEEN 0 and 5),
  						PRIMARY key (review_id));
                        
CREATE TABLE History(
  						history_id char(5) not null,
  						order_id char(5) FOREIGN key REFERENCES Orders(order_id),
  						PRIMARY key (history_id));
                        
INSERT INTO Member VALUES ('10001','Arden','Duxbury','9730 Mockingbird Drive',
                           'aduxbury0@hp.com','3687028600','12/20/2000');
INSERT INTO Member VALUES ('10002','Gweneth','Benjafield','668 Pankratz Way',
                           'gbenjafield1@slideshare.net','4831208799','10/25/2008');
INSERT INTO Member VALUES ('10003','Maible','Pevsner','7 Morrow Junction',
                           'mpevsner2@sciencedaily.com','8531425917','6/7/2007');
INSERT INTO Member VALUES ('10004','Gregg','Dunrige','6964 Killdeer Parkway',
                           'gdunrige3@unblog.fr','8426885491','3/26/2003');
INSERT INTO Member VALUES ('10005','Marty','Klais','75 Laurel Hill','mklais4@naver.com',
                           '7235316167','7/7/2005');

INSERT INTO Promotion VALUES ('2001',300.00,'8/1/2023','11/30/2023');
INSERT INTO Promotion VALUES ('2002',66.00,'10/1/2023','11/30/2023');
INSERT INTO Promotion VALUES ('2003',35.00,'5/1/2023','12/31/2023');
INSERT INTO Promotion VALUES ('2004',125.00,'8/1/2023','12/31/2023');
INSERT INTO Promotion VALUES ('2005',2000.00,'11/1/2023','12/31/2023');

INSERT INTO Product VALUES ('1001','VGA ASUS GEFORCE RTX 4090 TUF O24G GAMING - 24GB GDDR6X',
                            'ASUS TUF Gaming GeForce RTX® 4090 24GB GDDR6X optimized inside and out for lower 
                            temps and durability',85900.00,3,'2005');
INSERT INTO Product VALUES ('1002','RAM DDR5(6200) 32GB (16GBX2) CORSAIR VENGEANCE RGB BLACK',
                            'CORSAIR VENGEANCE RGB DDR5 memory delivers DDR5 performance, higher frequencies, 
                            and greater capacities optimized for Intel® motherboards while lighting up your PC 
                            with dynamic ',5990.00,26,'2004');
INSERT INTO Product VALUES ('1003','1 TB SSD M.2 PCIe 4.0 WD BLUE SN580 ','WD_BLACK SN770 NVMe SSD. 
                            boasts up to 40% faster performance and up to 20% more power efficiency at maximum 
                            speed over the previous generation3',2490.00,20,'2002');
INSERT INTO Product VALUES ('1004','POWER SUPPLY (80+ GOLD) 850W THERMALTAKE TOUGHPOWER GF3','Designed with a 
                            native PCIe 12+4pin connector, the Toughpower GF3 series is compatible with Intel‘s 
                            ATX 3.0 specification and is built for next-gen PCIe 5.0 graphics cards.',
                            5450.00,6,'2001');
INSERT INTO Product VALUES ('1005','CPU AMD AM5 RYZEN 9 7950X3D','The 16-core processor that can do it all with 
                            incredible performance from AMD. Plus, enjoy the benefits of next-gen AMD 3D 
                            V-Cache™ technology for low latency and even more game performance',
                            25700.00,2,'2005');

INSERT INTO Orders VALUES ('00001','1001','10002',1,85900.00,'credit card');
INSERT INTO Orders VALUES ('00002','1001','10005',1,85900.00,'credit card');
INSERT INTO Orders VALUES ('00003','1003','10001',2,4980.00,'cash');
INSERT INTO Orders VALUES ('00004','1005','10002',1,25700.00,'credit card');
INSERT INTO Orders VALUES ('00005','1002','10004',2,11980.00,'credit cash');

INSERT INTO History VALUES ('20001','00001');
INSERT INTO History VALUES ('20002','00002');
INSERT INTO History VALUES ('20003','00003');
INSERT INTO History VALUES ('20004','00004');
INSERT INTO History VALUES ('20005','00005');

INSERT into Review VALUES ('30001','1001','10002','If you`re here, you probably already know precisely what the 
                           4090 is and does. Key takeaways for this TUF variant are that it performs as 
                           advertised, is very large and runs relatively cool. Replaced a 10GB 3080, hesitantly, 
                           to take full advantage of the 5k+ resolution of a new VR headset. The 3080 just didn`t
                           have the stomach for those resolutions. This card pushes 3300x3300 (per eye!) without
                           breaking a sweat in the racing sims and roomscale experiences I`ve thrown at it. It s 
                           almost comical just how much memory and how powerful this GPU has and is.',5);
                           
INSERT into Review VALUES ('30002','1001','10005','Best card on the market. Stays cool and quiet under load from 
                           Starfield at 2k ultra. Understated look, which appeals to me, without an excess of RGB. 
                           It`s huge though, so make sure your case can accommodate it. Unfortunately it costs 
                           more than 3 next Gen consoles, but should keep up with anything that comes out for a 
                           couple generations.',5);
                           
INSERT into Review VALUES ('30003','1003','10001','Bought this drive - 1TB - to go into a new Dell Optiplex 5090 
                           computer. Very fast, no problems so far. The Dell can`t take advantage of the faster 
                           SN850 so this was a great comprise of performance, storage size, and price',5);
                           
INSERT into Review VALUES ('30004','1004','10002','This seems to be a good quality power supply. I am using it
                           with a fairly high end build, including an AMD 7800X3d + 4800 RTX card. I was able to
                           use 3 of the 6+2 PciE cables to connect to the adapter that came with my RTX 4080 and
                           it seems to be working well.',4);
                           
INSERT into Review VALUES ('30005','1005','10004',' I think I got a basic one; I did not win the silicon 
                           lottery. I`m not able to run my chip with even the most basic undervolting on my ASUS 
                           Rog Crosshair X670E Hero. Not that it really needs it. It runs super cool with my 420 
                           AIO, and I`ll be stepping it down to a 360 AIO so I can use the 420 on something else.'
                           ,4);

SELECT * FROM Product;

SELECT * FROM Member;

SELECT * FROM Orders;

SELECT * FROM Promotion;

SELECT * FROM Review;

SELECT * FROM History;

SELECT History.history_id, Orders.order_id, Orders.product_id, Orders.member_id, Orders.order_quantity, 
Orders.order_total, Orders.payment_method FROM Orders LEFT JOIN History ON Orders.order_id = History.order_id 
WHERE Orders.order_id ='00001';

SELECT Product.product_id,Product.product_name,Promotion.promotion_discount,
Promotion.promotion_start,Promotion.promotion_end FROM Product JOIN Promotion on 
Product.promotion_id = Promotion.promotion_id WHERE Product.product_id ='1001';

SELECT Product.product_name, Review.review_comment,Review.review_rating FROM Product JOIN Review on 
Product.product_id = Review.product_id WHERE Product.product_id ='1003';

SELECT Member.member_id, Member.member_fname, Product.product_name, Review.review_comment, 
Review.review_rating FROM 
Member JOIN Review ON Member.member_id = Review.member_id 
JOIN Product on Review.product_id = Product.product_id WHERE Member.member_id='10002';