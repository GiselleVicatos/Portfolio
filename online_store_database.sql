DROP TABLE IF EXISTS customer CASCADE;

DROP TABLE IF EXISTS customer_banking CASCADE;

Drop TABLE IF EXISTS product CASCADE;

DROP TABLE IF EXISTS store CASCADE;

DROP TABLE IF EXISTS warehouse CASCADE;

DROP TABLE IF EXISTS purchase CASCADE;


CREATE TABLE customer
(customer_no SMALLINT NOT NULL,
 customer_name VARCHAR(25) NOT NULL,
 customer_street VARCHAR(25) NOT NULL,
 customer_suburb VARCHAR(25) NOT NULL,
 customer_city VARCHAR(25) NOT NULL,
 customer_pcode SMALLINT NOT NULL, 
 telephone_no VARCHAR(12) NOT NULL,
 dob DATE NOT NULL,
 account_no VARCHAR(20) NOT NULL, 
 bank_name VARCHAR(20) NOT NULL,
 bank_street VARCHAR(25) NOT NULL,
 bank_area VARCHAR(25) NOT NULL,
 bank_city VARCHAR(25) NOT NULL,
 bank_pcode SMALLINT NOT NULL,
 sort_code VARCHAR(8) NOT NULL, 
PRIMARY KEY(customer_no));

CREATE TABLE product
(product_no SMALLINT NOT NULL,
 product_name VARCHAR(25) NOT NULL, 
 product_type CHAR(2) NOT NULL,
 desctription VARCHAR(150) NOT NULL,
 product_cost DECIMAL NOT NULL, 
 PRIMARY KEY (product_no)); 

CREATE TABLE store
(store_no SMALLINT NOT NULL,
store_street VARCHAR(25) NOT NULL,
store_area VARCHAR(25) NOT NULL,
store_city VARCHAR(25) NOT NULL,
store_pcode SMALLINT NOT NULL,
PRIMARY KEY (store_no));

CREATE TABLE warehouse
(product_no SMALLINT NOT NULL,
product_quantity SMALLINT NOT NULL,
store_no SMALLINT NOT NULL,
PRIMARY KEY (product_no, store_no),
FOREIGN KEY(product_no) REFERENCES product(product_no),
FOREIGN KEY(store_no) REFERENCES store(store_no));

CREATE TABLE purchase
(purchase_no SMALLINT NOT NULL, 
 customer_no SMALLINT NOT NULL,
 product_no SMALLINT NOT NULL,
 store_no SMALLINT NOT NULL,
 purchase_date DATE NOT NULL,
 delivery_date DATE NOT NULL, 
 delivery_time TIME NOT NULL,
 PRIMARY KEY(purchase_no),
 FOREIGN KEY (store_no) REFERENCES store(store_no),
 FOREIGN KEY (customer_no) REFERENCES customer(customer_no),
 FOREIGN KEY (product_no) REFERENCES product(product_no));
 
 
INSERT INTO customer VALUES
(1, 'Sarah Smith', '1 Cherry Lane', 'Hout Bay', 'Cape Town', 7806, '0832345285', to_date('08-07-1975', 'DD-MM-YYYY'), '070981274', 'Standard Bank', '45A-47A Mill Street', 'Oranjezicht', 'Cape Town', 8001, '051001'),
(2, 'Rory Smith', '3 Hilton Crest', 'Hillcrest', 'Durban', 3610, '0723728764', to_date('13-08-1984', 'DD-MM-YYYY'), '3281738987', 'Nedbank', '303 Anton Lembede Street', 'Durban Central', 'Durban', 4001, '198765'),
(3, 'Megan Brown', '34 Molteno Road', 'Oranjezicht', 'Cape Town', 8001, '0732749865', to_date('08-01-1987', 'DD-MM-YYYY'), '074562476', 'Standard Bank', '45A-47A Mill Street', 'Oranjezicht', 'Cape Town', 8001, '051001'),
(4, 'Fred Miller', '1 Chesterfield Road', 'Oranjezicht', 'Cape Town', 8001, '0823678845', to_date('09-03-1994', 'DD-MM-YYYY'), '076273819', 'Standard Bank', '45A-47A Mill Street', 'Oranjezicht', 'Cape Town', 8001, '051001'),
(5, 'Sally Williams', '4 Chester Road', 'Barario', 'Johannesburg', 2195, '0834728493', to_date('17-03-1999', 'DD-MM-YYYY'), '072897173', 'Standard Bank', '5 Simmonds Street', 'Selby', 'Johannesburg', 2001, '051001'),
(6, 'Harry Wright', '15 Grosvenor Avenue', 'Oranjezicht', 'Cape Town', 8001, '0825738984', to_date('25-07-1987', 'DD-MM-YYYY'), '198273693', 'First National Bank', '82-84 Adderley Street', 'Cape Town City Centre', 'Cape Town', 8000, '250655'),
(7, 'Sandra Johnson', '6 Belmont Avenue', 'Rondebosch', 'Cape Town', 7700, '0723628863', to_date('17-11-1999', 'DD-MM-YYYY'), '6918273898', 'Capitec Bank', '181 Main Road', 'Claremont', 'Cape Town', 7700, '470010'),
(8, 'Alex Garcia', '8 Fairview Avenue', 'Woodstock', 'Cape Town', 7925, '0728374982', to_date('04-03-1992', 'DD-MM-YYYY'), '3091827399', 'Nedbank', '148 Long Street', 'Cape Town City Centre', 'Cape Town', 8001, '198765'),
(9, 'Henry Taylor', '5 West Street', 'Sandon', 'Johannesburg', 2031, '0827364493', to_date('12-03-1999', 'DD-MM-YYYY'), '071829384', 'Standard Bank', 'Alice Lane', 'Sandon', 'Johannesburg', 2196,'051001'),
(10, 'Sofie Moore','2 Strawberry Lane', 'Constania', 'Cape Town', 7806, '0845629839', to_date('01-03-1999', 'DD-MM-YYYY'), '129837465', 'First National Bank', '27 Somerset Road', 'Green Point', 'Cape Town', 8005, '250655'),
(11, 'Sarah Davis','6 Smith Road', 'Rondebosch', 'Cape Town', 7700, '0824837594', to_date('16-11-1986', 'DD-MM-YYYY'), '182736498', 'First National Bank', '82-84 Adderley Street', 'Cape Town City Centre', 'Cape Town', 8000, '250655'),
(12, 'Brendan Jackson', '12 Frome Drive', 'Umhlanga', 'Durban', 4019, '0723718837', to_date('02-08-1995', 'DD-MM-YYYY'), '3928174638', 'Nedbank', '303 Anton Lembede Street', 'Durban Central', 'Durban', 4001, '198765'),
(13, 'Martin White', '8 Palladium Street', 'Phoenix', 'Durban', 4068,'0827364819', to_date('13-06-1988', 'DD-MM-YYYY'), '078717263', 'Standard Bank', '1 Kingsmead Way', 'Old Fort', 'Durban', 4001, '051001');

INSERT INTO product VALUES
(111, 'Guitar', 'MI', 'classical (spanish/nylon) Yamaha 3/4 CS40', 2400.00),
(112, 'Guitar', 'MI', 'classical (spanish/nylon) Darestone 1/2', 850.00),
(113, 'Guitar', 'MI', 'classical (spanish/nylon) Caraya C950N', 1150.00),
(114, 'Guitar', 'MI', 'classical (spanish/nylon) Maxwell MXC341 1/2', 850.00),
(115, 'Guitar', 'MI', 'accoustic Giuliani GAG40SLEQ', 1995.00),
(116, 'Guitar', 'MI', 'accoustic Cort AD810 OP Dreadnaught', 2015.00),
(117, 'Guitar', 'MI', 'accoustic FTS-R38BLS Fts 38"', 1995.00),
(118, 'Guitar', 'MI', 'electric Cort G100', 2495.00),
(119, 'Guitar', 'MI', 'electric Cort CR100', 4250.00),
(1110, 'Guitar', 'MI', 'electric Caraya SEG-272VS Semi-Hollow', 4295.00),
(121, 'Violin', 'MI', 'Caraya MV-001', 1495.00),
(122, 'Violin', 'MI', 'Guiliani SV1', 1995.00),
(131, 'Cello', 'MI', 'Zeff Cello 4/4', 6495.00),
(132, 'Cello', 'MI', 'Stentor Student II Cello 4/4', 11190.00),
(141, 'Drums', 'MI', 'Pearl Roadshow', 9999.00),
(142, 'Drums', 'MI', 'Bangood digital Portable Roll Up', 713.00),
(151, 'Trumpet', 'MI', 'Grassi GR TR20SK Bb', 3745.00),
(152, 'Trumpet', 'MI', 'Zeff', 2100.00),
(161, 'Clarinet', 'MI', 'Zeff', 1995.00),
(211, 'Book', 'AM', 'Piano for adult beginners', 320.00),
(212, 'Book', 'AM', 'Piano for kids', 220.00),
(213, 'Book', 'AM', 'Suzuki Violin School',240.00),
(214, 'Book', 'AM', 'First 50 Songs You Should Strum', 320.00),
(215, 'Book', 'AM', 'How Music Works', 150.00),
(216, 'Book', 'AM', 'The Book of Beginner Piano Classics',420.00),
(217, 'Book', 'AM', 'The Rest is Noise', 340.00),
(218, 'Book', 'AM', '100 of the Most Beautiful Piano Solos Ever', 520.00),
(221, 'CD', 'AM', 'Queen, Greatest Hits', 230.00),
(222, 'CD', 'AM', 'Queen, All the Songs', 230.00),
(223, 'CD', 'AM', 'Pink Ployd, The Dark Side of the Moon', 210.00),
(224, 'CD', 'AM', 'Adele, 25', 200.00),
(225, 'CD', 'AM', 'Amy Winehouse, Back to Black', 200.00),
(226, 'CD', 'AM', 'Michael Jackson, Thriller', 210.00),
(227, 'CD', 'AM', 'P!nk, Greatest Hits...So Far', 210.00),
(228, 'CD', 'AM', 'The Beatles, Yellow Submarine', 200.00),
(231, 'DVD', 'AM', 'Titanic', 240.00),
(232, 'DVD', 'AM', 'Star Wars, The skywalker Saga', 952.00),
(233, 'DVD', 'AM', 'Harry Potter, Complete 8-Film Collection', 822.00),
(234, 'DVD', 'AM', 'James Bond, The Daniel Craig Collection', 646.00),
(235, 'DVD', 'AM', 'marvel Collection', 740.00),
(236, 'DVD', 'AM', 'Mary Poppins', 118.00),
(237, 'DVD', 'AM', 'The Sound of Music', 99.00),
(238, 'DVD', 'AM', 'My fair Lady', 119.00),
(239, 'DVD', 'AM', 'Breakfast at Tiffanys', 120.00),
(241, 'Sheet Music', 'AM', 'The Giant Book of Classical Sheet Music', 442.00),
(242, 'Sheet Music', 'AM', 'Popular Sheet Music: 30 Hits from 2017-2019', 387.00),
(243, 'Sheet Music', 'AM', 'Alfreds Easy Piano Songs -- Rock & Pop', 421.00),
(244, 'Sheet Music', 'AM', 'La La Land Easy Piano by Jusin Hurwitz', 283.08),
(245, 'Sheet Music', 'AM', 'George Gershwin: Sheet Music for Piano: Intermediate to Advanced', 264.78),
(246, 'Sheet Music', 'AM', 'Calvin Harrus-The Sheet Music Collection', 371.87),
(247, 'Sheet Music', 'AM', 'Prederic Chopin: Sheet Music for Piano: From Easy to Advanced', 299.31),
(248, 'Sheet Music', 'AM', 'Ludvig Van Beethoven: Sheet Music for Piano: From Easy to Advanced ', 299.31);

INSERT INTO store VALUES
(1, '84 Kloof Street', 'Gardens', 'Cape Town', 8001),
(2, '23 Musgrave Road', 'Berea', 'Durban', 4001),
(3, 'Maude Street', 'Sandon', 'Johannesburg', 2014);

INSERT INTO warehouse VALUES
(111, 1, 1),
(111, 0, 2),
(111, 1, 3),
(112, 1, 1),
(112, 2, 2),
(112, 2, 3),
(113, 2, 1),
(113, 0, 2),
(113, 1, 3),
(114, 0, 1),
(114, 1, 2),
(114, 2, 3),
(115, 3, 1),
(115, 2, 2),
(115, 2, 3),
(116, 3, 1),
(116, 2, 2),
(116, 0, 3),
(117, 1, 1),
(117, 2, 2),
(117, 1, 3),
(118, 2, 1),
(118, 1, 2),
(118, 0, 3),
(119, 3, 1),
(119, 2, 2),
(119, 2, 3),
(1110, 2, 1),
(1110, 2, 2),
(1110, 0, 3),
(121, 3, 1),
(121, 2, 2),
(121, 1, 3),
(122, 0, 1),
(122, 1, 2),
(122, 2, 3),
(131, 1, 1),
(131, 0, 2),
(131, 2, 3),
(132, 3, 1),
(132, 0, 2),
(132, 0, 3),
(141, 2, 1),
(141, 3, 2),
(141, 0, 3),
(142, 0, 1),
(142, 3, 2),
(142, 2, 3),
(151, 0, 1),
(151, 0, 2),
(151, 3, 3),
(152, 2, 1),
(152, 2, 2),
(152, 0, 3),
(161, 0, 1),
(161, 2, 2),
(161, 0, 3),
(211, 3, 1),
(211, 4, 2),
(211, 2, 3),
(212, 2, 1),
(212, 0, 2),
(212, 3, 3),
(213, 2, 1),
(213, 2, 2),
(213, 3, 3),
(214, 0, 1),
(214, 2, 2),
(214, 4, 3),
(215, 1, 1),
(215, 0, 2),
(215, 2, 3),
(216, 3, 1),
(216, 3, 2),
(216, 0, 3),
(217, 3, 1),
(217, 2, 2),
(217, 2, 3),
(218, 4, 1),
(218, 2, 2),
(218, 3, 3),
(221, 10, 1),
(221, 9, 2),
(221, 5, 3),
(222, 5, 1),
(222, 6, 2),
(222, 7, 3),
(223, 4, 1),
(223, 0, 2),
(223, 3, 3),
(224, 2, 1),
(224, 0, 2),
(224, 4, 3),
(225, 3, 1),
(225, 4, 2),
(225, 0, 3),
(226, 3, 1),
(226, 3, 2),
(226, 3, 3),
(227, 4, 1),
(227, 3, 2),
(227, 6, 3),
(228, 4, 1),
(228, 3, 2),
(228, 0, 3),
(231, 4, 1),
(231, 0, 2),
(231, 2, 3),
(232, 3, 1),
(232, 4, 2),
(232, 4, 3),
(233, 2, 1),
(233, 4, 2),
(233, 3, 3),
(234, 3, 1),
(234, 5, 2),
(234, 0, 3),
(235, 4, 1),
(235, 0, 2),
(235, 5, 3),
(236, 0, 1),
(236, 3, 2),
(236, 4, 3),
(237, 4, 1),
(237, 5, 2),
(237, 4, 3),
(238, 3, 1),
(238, 5, 2),
(238, 4, 3),
(239, 0, 1),
(239, 0, 2),
(239, 3, 3),
(241, 3, 1),
(241, 5, 2),
(241, 3, 3),
(242, 3, 1),
(242, 4, 2),
(242, 5, 3),
(243, 4, 1),
(243, 3, 2),
(243, 1, 3),
(244, 2, 1),
(244, 0, 2),
(244, 4, 3),
(245, 0, 1),
(245, 4, 2),
(245, 3, 3),
(246, 4, 1),
(246, 0, 2),
(246, 3, 3),
(247, 3, 1),
(247, 3, 2),
(247, 4, 3),
(248, 5, 1),
(248, 4, 2),
(248, 0, 3);

INSERT INTO purchase VALUES
(1, 1, 111, 1, to_date('01-08-2021', 'DD-MM-YYYY'), to_date('02-08-2021', 'DD-MM-YYYY'), ('14:00')), 
(2, 2, 111, 2, to_date('02-08-2021', 'DD-MM-YYYY'), to_date('03-08-2021', 'DD-MM-YYYY'), ('15:00')),
(3, 7, 112, 3, to_date('04-08-2021', 'DD-MM-YYYY'), to_date('05-08-2021', 'DD-MM-YYYY'), ('09:00')),
(4, 13, 151, 3, to_date('05-08-2021', 'DD-MM-YYYY'), to_date('06-08-2021', 'DD-MM-YYYY'), ('10:00')),
(5, 5, 211, 1, to_date('06-08-2021', 'DD-MM-YYYY'), to_date('07-08-2021', 'DD-MM-YYYY'), ('16:00')),
(6, 5, 213, 1, to_date('06-08-2021', 'DD-MM-YYYY'), to_date('07-08-2021', 'DD-MM-YYYY'), ('13:00')),
(7, 6, 216, 2, to_date('06-08-2021', 'DD-MM-YYYY'), to_date('07-08-2021', 'DD-MM-YYYY'), ('10:00')),
(8, 6, 217, 2, to_date('06-08-2021', 'DD-MM-YYYY'), to_date('08-08-2021', 'DD-MM-YYYY'), ('14:00')),
(9, 6, 218, 2, to_date('06-08-2021', 'DD-MM-YYYY'), to_date('08-08-2021', 'DD-MM-YYYY'), ('08:00')),
(10, 3, 238, 3, to_date('07-08-2021', 'DD-MM-YYYY'), to_date('08-08-2021', 'DD-MM-YYYY'), ('09:00')),
(11, 3, 241, 1, to_date('07-08-2021', 'DD-MM-YYYY'), to_date('08-08-2021', 'DD-MM-YYYY'), ('11:00')),
(12, 4, 239, 3, to_date('07-08-2021', 'DD-MM-YYYY'), to_date('09-08-2021', 'DD-MM-YYYY'), ('15:00')),
(13, 8, 141, 1, to_date('08-08-2021', 'DD-MM-YYYY'), to_date('09-08-2021', 'DD-MM-YYYY'), ('13:00')),
(14, 9, 213, 2, to_date('09-08-2021', 'DD-MM-YYYY'), to_date('10-08-2021', 'DD-MM-YYYY'), ('15:00')),
(15, 9, 214, 2, to_date('09-08-2021', 'DD-MM-YYYY'), to_date('10-08-2021', 'DD-MM-YYYY'), ('17:00')),
(16, 10, 241, 1, to_date('10-08-2021', 'DD-MM-YYYY'), to_date('11-08-2021', 'DD-MM-YYYY'), ('17:00')),
(17, 10, 242, 1, to_date('10-08-2021', 'DD-MM-YYYY'), to_date('11-08-2021', 'DD-MM-YYYY'), ('17:00')),
(18, 10, 243, 1, to_date('10-01-2021', 'DD-MM-YYYY'), to_date('11-08-2021', 'DD-MM-YYYY'), ('14:00')),
(19, 10, 247, 1, to_date('10-01-2021', 'DD-MM-YYYY'), to_date('12-08-2021', 'DD-MM-YYYY'), ('15:00')),
(20, 11, 242, 2, to_date('11-01-2021', 'DD-MM-YYYY'), to_date('12-08-2021', 'DD-MM-YYYY'), ('16:00')),
(21, 11, 132, 3, to_date('11-01-2021', 'DD-MM-YYYY'), to_date('12-08-2021', 'DD-MM-YYYY'), ('09:00')),
(22, 12, 111, 3, to_date('11-01-2021', 'DD-MM-YYYY'), to_date('01-08-2021', 'DD-MM-YYYY'), ('09:00')),
(23, 12, 121, 3, to_date('11-01-2021', 'DD-MM-YYYY'), to_date('12-08-2021', 'DD-MM-YYYY'), ('08:00')),
(24, 12, 121, 1, to_date('11-01-2021', 'DD-MM-YYYY'), to_date('12-08-2021', 'DD-MM-YYYY'), ('13:00')),
(25, 12, 131, 1, to_date('11-01-2021', 'DD-MM-YYYY'), to_date('13-08-2021', 'DD-MM-YYYY'), ('14:00')),
(26, 12, 141, 1, to_date('11-01-2021', 'DD-MM-YYYY'), to_date('13-08-2021', 'DD-MM-YYYY'), ('16:00')),
(27, 13, 245, 2, to_date('12-01-2021', 'DD-MM-YYYY'), to_date('13-08-2021', 'DD-MM-YYYY'), ('16:00')),
(28, 13, 247, 2, to_date('12-01-2021', 'DD-MM-YYYY'), to_date('13-08-2021', 'DD-MM-YYYY'), ('15:00'));


--ENTERING A NEW CUSTOMER INTO THE DATABASE


--function automatically updates the customer number 
CREATE OR REPLACE FUNCTION update_customer_no()
RETURNS smallint
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
mycustomer_no smallint;
BEGIN
  SELECT max(customer_no)+1
  INTO mycustomer_no  
  FROM customer; 
  RETURN mycustomer_no;
END
$BODY$;

--procedure adds a customer to the database
CREATE OR REPLACE PROCEDURE customer_registration(
	_customer_no smallint,
	_customer_name varchar(25),
	_customer_street varchar(25),
	_customer_suburb varchar(25),
	_customer_city varchar(25),
	_customer_pcode smallint,
	_telephone_no varchar(12),
	_dob date,
	_account_no VARCHAR(20),
	_bank_name VARCHAR(20),
	_bank_street VARCHAR(25),
	_bank_area VARCHAR(25),
	_bank_city VARCHAR(25),
	_bank_pcode SMALLINT,
	_sort_code VARCHAR(8))	
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN 
--code first deals with null values
IF _customer_no IS NULL 
	THEN
	RAISE NOTICE 'Customer number is needed and should be automated with the update_customer_no() function';	
	
ELSIF _customer_name IS NULL 
	THEN
	RAISE NOTICE 'You need to provide your name';
	
ELSIF _customer_street IS NULL 
	THEN
	RAISE NOTICE 'Your street address is missing';
	
ELSIF _customer_suburb IS NULL 
	THEN
	RAISE NOTICE 'Your suburb address is missing';
	
ELSIF _customer_city IS NULL 
	THEN
	RAISE NOTICE 'Your city address is missing';
	
ELSIF _customer_pcode IS NULL 
	THEN
	RAISE NOTICE 'Your postal code address is missing';	
	
ELSIF _telephone_no IS NULL 
	THEN
	RAISE NOTICE 'You need to provide your phone number';	

ELSIF _dob IS NULL 
	THEN
	RAISE NOTICE 'You need to provide your date of birth';

ELSIF _account_no IS NULL 
	THEN
	RAISE NOTICE 'You need to provide your account number';	
	
ELSIF _bank_name IS NULL 
	THEN
	RAISE NOTICE 'You need to provide the name of your bank';	
	
ELSIF _bank_street IS NULL 
	THEN
	RAISE NOTICE 'Your bank street address is missing';	
	
ELSIF _bank_area  IS NULL 
	THEN
	RAISE NOTICE 'Your bank area address is missing';	
	
ELSIF _bank_city IS NULL 
	THEN
	RAISE NOTICE 'Your bank city address is missing';	
	
ELSIF _bank_pcode IS NULL 
	THEN
	RAISE NOTICE 'Your bank postal code address is missing';
	
ELSIF _sort_code IS NULL 
	THEN
	RAISE NOTICE 'Your bank sort code is missing';	

--code checks if a customer is already logged in the database
ELSIF EXISTS(SELECT customer_name, customer_street, customer_suburb, customer_city, customer_pcode, telephone_no, _dob
		  FROM customer 
		  WHERE _customer_name=customer_name AND _customer_street=customer_street AND _customer_suburb=customer_suburb AND _customer_city=customer_city AND _customer_pcode=customer_pcode AND _telephone_no=telephone_no AND _dob=dob)
		  THEN
		  RAISE NOTICE 'User already exists'; 
		  
--inserts new customer details
ELSE
	INSERT INTO customer(customer_no, customer_name, customer_street, customer_suburb, customer_city, customer_pcode, telephone_no, dob, account_no, bank_name, bank_street, bank_area, bank_city, bank_pcode, sort_code)
	VALUES (_customer_no, _customer_name, _customer_street, _customer_suburb, _customer_city, _customer_pcode, _telephone_no, _dob, _account_no, _bank_name, _bank_street, _bank_area, _bank_city, _bank_pcode, _sort_code); 
	RAISE NOTICE 'You have been added to the database.';
END IF;
END
$BODY$;

--Each call shows how each error is handled. 
Call customer_registration(null, cast('Mary Brown' as varchar(25)), cast('2 Parliment Street' as varchar(25)), cast('Gardens' as varchar(25)), cast('Cape Town' as varchar(25)), cast(8001 as smallint), cast('0823728847' as varchar(12)), cast('1989-07-01' as date), cast('074532927' as VARCHAR(20)), cast('Standard Bank' as VARCHAR(20)), cast('45A-47A Mill Street' as VARCHAR(25)), cast('Oranjezicht' as VARCHAR(25)), cast('Cape Town' as VARCHAR(25)), cast(8001 as smallint), cast('051001' as VARCHAR(8)));
Call customer_registration(cast(update_customer_no() as smallint), null, cast('2 Parliment Street' as varchar(25)), cast('Gardens' as varchar(25)), cast('Cape Town' as varchar(25)), cast(8001 as smallint), cast('0823728847' as varchar(12)), cast('1989-07-01' as date), cast('074532927' as VARCHAR(20)), cast('Standard Bank' as VARCHAR(20)), cast('45A-47A Mill Street' as VARCHAR(25)), cast('Oranjezicht' as VARCHAR(25)), cast('Cape Town' as VARCHAR(25)), cast(8001 as smallint), cast('051001' as VARCHAR(8)));
Call customer_registration(cast(update_customer_no() as smallint), cast('Mary Brown' as varchar(25)), null, cast('Gardens' as varchar(25)), cast('Cape Town' as varchar(25)), cast(8001 as smallint), cast('0823728847' as varchar(12)), cast('1989-07-01' as date), cast('074532927' as VARCHAR(20)), cast('Standard Bank' as VARCHAR(20)), cast('45A-47A Mill Street' as VARCHAR(25)), cast('Oranjezicht' as VARCHAR(25)), cast('Cape Town' as VARCHAR(25)), cast(8001 as smallint), cast('051001' as VARCHAR(8)));
Call customer_registration(cast(update_customer_no() as smallint), cast('Mary Brown' as varchar(25)), cast('2 Parliment Street' as varchar(25)), null, cast('Cape Town' as varchar(25)), cast(8001 as smallint), cast('0823728847' as varchar(12)), cast('1989-07-01' as date), cast('074532927' as VARCHAR(20)), cast('Standard Bank' as VARCHAR(20)), cast('45A-47A Mill Street' as VARCHAR(25)), cast('Oranjezicht' as VARCHAR(25)), cast('Cape Town' as VARCHAR(25)), cast(8001 as smallint), cast('051001' as VARCHAR(8)));
Call customer_registration(cast(update_customer_no() as smallint), cast('Mary Brown' as varchar(25)), cast('2 Parliment Street' as varchar(25)), cast('Gardens' as varchar(25)), null, cast(8001 as smallint), cast('0823728847' as varchar(12)), cast('1989-07-01' as date), cast('074532927' as VARCHAR(20)), cast('Standard Bank' as VARCHAR(20)), cast('45A-47A Mill Street' as VARCHAR(25)), cast('Oranjezicht' as VARCHAR(25)), cast('Cape Town' as VARCHAR(25)), cast(8001 as smallint), cast('051001' as VARCHAR(8)));
Call customer_registration(cast(update_customer_no() as smallint), cast('Mary Brown' as varchar(25)), cast('2 Parliment Street' as varchar(25)), cast('Gardens' as varchar(25)), cast('Cape Town' as varchar(25)), null, cast('0823728847' as varchar(12)), cast('1989-07-01' as date), cast('074532927' as VARCHAR(20)), cast('Standard Bank' as VARCHAR(20)), cast('45A-47A Mill Street' as VARCHAR(25)), cast('Oranjezicht' as VARCHAR(25)), cast('Cape Town' as VARCHAR(25)), cast(8001 as smallint), cast('051001' as VARCHAR(8)));
Call customer_registration(cast(update_customer_no() as smallint), cast('Mary Brown' as varchar(25)), cast('2 Parliment Street' as varchar(25)), cast('Gardens' as varchar(25)), cast('Cape Town' as varchar(25)), cast(8001 as smallint), null, cast('1989-07-01' as date), cast('074532927' as VARCHAR(20)), cast('Standard Bank' as VARCHAR(20)), cast('45A-47A Mill Street' as VARCHAR(25)), cast('Oranjezicht' as VARCHAR(25)), cast('Cape Town' as VARCHAR(25)), cast(8001 as smallint), cast('051001' as VARCHAR(8)));
Call customer_registration(cast(update_customer_no() as smallint), cast('Mary Brown' as varchar(25)), cast('2 Parliment Street' as varchar(25)), cast('Gardens' as varchar(25)), cast('Cape Town' as varchar(25)), cast(8001 as smallint), cast('0823728847' as varchar(12)), null, cast('074532927' as VARCHAR(20)), cast('Standard Bank' as VARCHAR(20)), cast('45A-47A Mill Street' as VARCHAR(25)), cast('Oranjezicht' as VARCHAR(25)), cast('Cape Town' as VARCHAR(25)), cast(8001 as smallint), cast('051001' as VARCHAR(8)));
Call customer_registration(cast(update_customer_no() as smallint), cast('Mary Brown' as varchar(25)), cast('2 Parliment Street' as varchar(25)), cast('Gardens' as varchar(25)), cast('Cape Town' as varchar(25)), cast(8001 as smallint), cast('0823728847' as varchar(12)), cast('1989-07-01' as date), null, cast('Standard Bank' as VARCHAR(20)), cast('45A-47A Mill Street' as VARCHAR(25)), cast('Oranjezicht' as VARCHAR(25)), cast('Cape Town' as VARCHAR(25)), cast(8001 as smallint), cast('051001' as VARCHAR(8)));
Call customer_registration(cast(update_customer_no() as smallint), cast('Mary Brown' as varchar(25)), cast('2 Parliment Street' as varchar(25)), cast('Gardens' as varchar(25)), cast('Cape Town' as varchar(25)), cast(8001 as smallint), cast('0823728847' as varchar(12)), cast('1989-07-01' as date), cast('074532927' as VARCHAR(20)), null, cast('45A-47A Mill Street' as VARCHAR(25)), cast('Oranjezicht' as VARCHAR(25)), cast('Cape Town' as VARCHAR(25)), cast(8001 as smallint), cast('051001' as VARCHAR(8)));
Call customer_registration(cast(update_customer_no() as smallint), cast('Mary Brown' as varchar(25)), cast('2 Parliment Street' as varchar(25)), cast('Gardens' as varchar(25)), cast('Cape Town' as varchar(25)), cast(8001 as smallint), cast('0823728847' as varchar(12)), cast('1989-07-01' as date), cast('074532927' as VARCHAR(20)), cast('Standard Bank' as VARCHAR(20)), null, cast('Oranjezicht' as VARCHAR(25)), cast('Cape Town' as VARCHAR(25)), cast(8001 as smallint), cast('051001' as VARCHAR(8)));
Call customer_registration(cast(update_customer_no() as smallint), cast('Mary Brown' as varchar(25)), cast('2 Parliment Street' as varchar(25)), cast('Gardens' as varchar(25)), cast('Cape Town' as varchar(25)), cast(8001 as smallint), cast('0823728847' as varchar(12)), cast('1989-07-01' as date), cast('074532927' as VARCHAR(20)), cast('Standard Bank' as VARCHAR(20)), cast('45A-47A Mill Street' as VARCHAR(25)), null, cast('Cape Town' as VARCHAR(25)), cast(8001 as smallint), cast('051001' as VARCHAR(8)));
Call customer_registration(cast(update_customer_no() as smallint), cast('Mary Brown' as varchar(25)), cast('2 Parliment Street' as varchar(25)), cast('Gardens' as varchar(25)), cast('Cape Town' as varchar(25)), cast(8001 as smallint), cast('0823728847' as varchar(12)), cast('1989-07-01' as date), cast('074532927' as VARCHAR(20)), cast('Standard Bank' as VARCHAR(20)), cast('45A-47A Mill Street' as VARCHAR(25)), cast('Oranjezicht' as VARCHAR(25)), null, cast(8001 as smallint), cast('051001' as VARCHAR(8)));
Call customer_registration(cast(update_customer_no() as smallint), cast('Mary Brown' as varchar(25)), cast('2 Parliment Street' as varchar(25)), cast('Gardens' as varchar(25)), cast('Cape Town' as varchar(25)), cast(8001 as smallint), cast('0823728847' as varchar(12)), cast('1989-07-01' as date), cast('074532927' as VARCHAR(20)), cast('Standard Bank' as VARCHAR(20)), cast('45A-47A Mill Street' as VARCHAR(25)), cast('Oranjezicht' as VARCHAR(25)), cast('Cape Town' as VARCHAR(25)), null, cast('051001' as VARCHAR(8)));
Call customer_registration(cast(update_customer_no() as smallint), cast('Mary Brown' as varchar(25)), cast('2 Parliment Street' as varchar(25)), cast('Gardens' as varchar(25)), cast('Cape Town' as varchar(25)), cast(8001 as smallint), cast('0823728847' as varchar(12)), cast('1989-07-01' as date), cast('074532927' as VARCHAR(20)), cast('Standard Bank' as VARCHAR(20)), cast('45A-47A Mill Street' as VARCHAR(25)), cast('Oranjezicht' as VARCHAR(25)), cast('Cape Town' as VARCHAR(25)), cast(8001 as smallint), null);
--Next call will register the client. Look at the customer number in the customer table - it gets updated automatically.
Select * From customer;
Call customer_registration(cast(update_customer_no() as smallint), cast('Mary Brown' as varchar(25)), cast('2 Parliment Street' as varchar(25)), cast('Gardens' as varchar(25)), cast('Cape Town' as varchar(25)), cast(8001 as smallint), cast('0823728847' as varchar(12)), cast('1989-07-01' as date), cast('074532927' as VARCHAR(20)), cast('Standard Bank' as VARCHAR(20)), cast('45A-47A Mill Street' as VARCHAR(25)), cast('Oranjezicht' as VARCHAR(25)), cast('Cape Town' as VARCHAR(25)), cast(8001 as smallint), cast('051001' as VARCHAR(8)));
Select * From customer;
--Entering the call again will show how the code deals with user repitition
Call customer_registration(cast(update_customer_no() as smallint), cast('Mary Brown' as varchar(25)), cast('2 Parliment Street' as varchar(25)), cast('Gardens' as varchar(25)), cast('Cape Town' as varchar(25)), cast(8001 as smallint), cast('0823728847' as varchar(12)), cast('1989-07-01' as date), cast('074532927' as VARCHAR(20)), cast('Standard Bank' as VARCHAR(20)), cast('45A-47A Mill Street' as VARCHAR(25)), cast('Oranjezicht' as VARCHAR(25)), cast('Cape Town' as VARCHAR(25)), cast(8001 as smallint), cast('051001' as VARCHAR(8)));


--ORDERING A PRODUCT

--Trigger deals with delivery time errors
CREATE OR REPLACE FUNCTION delivery_time_error() RETURNS TRIGGER
LANGUAGE 'plpgsql'
AS
$BODY$
BEGIN
RAISE EXCEPTION 'We cannot deliver at this time. Working hours are between 8am-5pm.';
END;
$BODY$

DROP TRIGGER check_delivery_time ON purchase;

CREATE TRIGGER check_delivery_time
BEFORE INSERT ON purchase
FOR EACH ROW
WHEN (new.delivery_time BETWEEN '17:01' AND '24:00' OR 
	  new.delivery_time BETWEEN '00:00' AND '07:59')
EXECUTE PROCEDURE delivery_time_error();


--Trigger deals with delivery date errors
CREATE OR REPLACE FUNCTION delivery_date_error() RETURNS TRIGGER
LANGUAGE 'plpgsql'
AS
$BODY$
BEGIN
RAISE EXCEPTION 'We cannot deliver on this day. A delivery can only be made from one day after purchase.';
END;
$BODY$

DROP TRIGGER check_delivery_day ON purchase;

CREATE TRIGGER check_delivery_day
BEFORE INSERT ON purchase
FOR EACH ROW
WHEN (new.delivery_date <= new.purchase_date)
EXECUTE PROCEDURE delivery_date_error();


--function automatically updates the purchase number
CREATE OR REPLACE FUNCTION update_purchase_no()
RETURNS smallint
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
mypurchase_no smallint;
BEGIN
  SELECT max(purchase_no)+1
  INTO mypurchase_no  
  FROM purchase; 
  RETURN mypurchase_no;
END
$BODY$;


--function automatically enters the customer number as the customer enters their name
CREATE OR REPLACE FUNCTION name_to_customer_no(_customer_name varchar(25))
RETURNS smallint
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
mycustomer_no smallint;
BEGIN
  SELECT customer_no
  INTO mycustomer_no
  FROM customer
  WHERE _customer_name=customer_name; 
  RETURN mycustomer_no; 
END
$BODY$;

--Procedure allows an existing customer to purchase a product
CREATE OR REPLACE PROCEDURE customer_purchases(
	_customer_no smallint,
	_purchase_no smallint,
	_product_no smallint,
	_store_no smallint,
	_purchase_date DATE, 
	_delivery_date DATE,
	_delivery_time TIME)	
LANGUAGE 'plpgsql'
AS $BODY$

BEGIN
--code first deals with null values
IF _customer_no IS NULL 
	THEN
	RAISE NOTICE 'Your name is needed, or given name does not exist in database';

ELSIF _purchase_no IS NULL 
	THEN
	RAISE NOTICE 'A purchase number is needed and should be automated using the update_purchase_no() function';

ELSIF _product_no IS NULL 
	THEN
	RAISE NOTICE 'A product number is needed to purchase a product';

ELSIF _purchase_date IS NULL 
	THEN
	RAISE NOTICE 'The purchase date is needed and should be automated in call';
	
ELSIF _delivery_date IS NULL 
	THEN
	RAISE NOTICE 'Delivery date is needed';
	
ELSIF _delivery_time IS NULL 
	THEN
	RAISE NOTICE 'Delivery time is needed';

--code deals with non-existant products 
ELSIF NOT EXISTS(SELECT product_no 
		  FROM product 
		  WHERE _product_no=product_no) 
		  THEN
		  RAISE NOTICE 'Product is not stocked.';
		  
--code determines if store exists
ELSIF NOT EXISTS(SELECT store_no 
		  FROM store
		  WHERE _store_no=store_no) 
		  THEN
		  RAISE NOTICE 'Store does not exist. Possible store numbers are 1,2,3';

--code checks to see if product is stocked in chosen store
ELSIF NOT EXISTS(SELECT store_no
		 FROM warehouse
		 WHERE _product_no=product_no
		 AND _store_no=store_no
		AND product_quantity>0)			 
		THEN 
		RAISE NOTICE 'The product you have chosen, product no: %, is not stocked in store no: %. Try chosing another store for delivery.', _product_no, _store_no;	

--if all of the above errors are ok, then codes purchases chosen product from specified store
--code automatically updates the chosen product's store quantity
ELSE
		  INSERT INTO purchase(customer_no, purchase_no, product_no, store_no, purchase_date, delivery_date, delivery_time)
		  VALUES(_customer_no, _purchase_no, _product_no, _store_no, _purchase_date, _delivery_date, _delivery_time);
		  UPDATE warehouse
		  SET product_quantity=product_quantity-1
		  WHERE product_no=_product_no
		  AND store_no=_store_no;		  
		  RAISE NOTICE 'Customer no: % has ordered product no: % from store no : % and it will be delivered on: % at time: %',_customer_no, _product_no, _store_no, _delivery_date, _delivery_time; 
		  
END IF;
END
$BODY$;

--Each call shows how each error is handled
Call customer_purchases(null, cast(update_purchase_no() as smallint), cast(111 as smallint), cast(2 as smallint), cast(current_date as DATE), cast(to_date('16-08-2021', 'DD-MM-YYYY') as DATE), cast('17:00'as TIME));
Call customer_purchases(cast(name_to_customer_no('Sarah Brown') as smallint), cast(update_purchase_no() as smallint), cast(111 as smallint), cast(2 as smallint), cast(current_date as DATE), cast(to_date('16-08-2021', 'DD-MM-YYYY') as DATE), cast('17:00'as TIME));
Call customer_purchases(cast(name_to_customer_no('Sarah Smith') as smallint), null, cast(111 as smallint), cast(2 as smallint), cast(current_date as DATE), cast(to_date('16-08-2021', 'DD-MM-YYYY') as DATE), cast('17:00'as TIME));
Call customer_purchases(cast(name_to_customer_no('Sarah Smith') as smallint), cast(update_purchase_no() as smallint), null, cast(2 as smallint), cast(current_date as DATE), cast(to_date('16-08-2021', 'DD-MM-YYYY') as DATE), cast('17:00'as TIME));
Call customer_purchases(cast(name_to_customer_no('Sarah Smith') as smallint), cast(update_purchase_no() as smallint), cast(111 as smallint), cast(2 as smallint), null, cast(to_date('16-08-2021', 'DD-MM-YYYY') as DATE), cast('17:00'as TIME));
Call customer_purchases(cast(name_to_customer_no('Sarah Smith') as smallint), cast(update_purchase_no() as smallint), cast(111 as smallint), cast(2 as smallint), cast(current_date as DATE), null, cast('17:00'as TIME));
Call customer_purchases(cast(name_to_customer_no('Sarah Smith') as smallint), cast(update_purchase_no() as smallint), cast(111 as smallint), cast(2 as smallint), cast(current_date as DATE), cast(to_date('16-08-2021', 'DD-MM-YYYY') as DATE), null);
Call customer_purchases(cast(name_to_customer_no('Sarah Smith') as smallint), cast(update_purchase_no() as smallint), cast(1111 as smallint), cast(2 as smallint), cast(current_date as DATE), cast(to_date('16-08-2021', 'DD-MM-YYYY') as DATE), cast('17:00'as TIME));
Call customer_purchases(cast(name_to_customer_no('Sarah Smith') as smallint), cast(update_purchase_no() as smallint), cast(111 as smallint), cast(4 as smallint), cast(current_date as DATE), cast(to_date('1-10-2021', 'DD-MM-YYYY') as DATE), cast('17:00'as TIME));
Call customer_purchases(cast(name_to_customer_no('Sarah Smith') as smallint), cast(update_purchase_no() as smallint), cast(111 as smallint), cast(2 as smallint), cast(current_date as DATE), cast(to_date('1-10-2021', 'DD-MM-YYYY') as DATE), cast('17:00'as TIME));
Call customer_purchases(cast(name_to_customer_no('Sarah Smith') as smallint), cast(update_purchase_no() as smallint), cast(111 as smallint), cast(1 as smallint), cast(current_date as DATE), cast(to_date('16-08-2021', 'DD-MM-YYYY') as DATE), cast('17:00'as TIME));
Call customer_purchases(cast(name_to_customer_no('Sarah Smith') as smallint), cast(update_purchase_no() as smallint), cast(111 as smallint), cast(1 as smallint), cast(current_date as DATE), cast(to_date('16-09-2021', 'DD-MM-YYYY') as DATE), cast('18:00'as TIME));
--look at purchase numbers. The next entry will be added to the column
select * From purchase;
-- look at product no. 111 for store no. 1 in the warehouse table. The quanity for this product will be updated from 1 to 0 in the next entry.
select * From warehouse;
Call customer_purchases(cast(name_to_customer_no('Sarah Smith') as smallint), cast(update_purchase_no() as smallint), cast(111 as smallint), cast(1 as smallint), cast(current_date as DATE), cast(to_date('1-10-2021', 'DD-MM-YYYY') as DATE), cast('17:00'as TIME));
select * From purchase;
select * From warehouse;
--if the same order is purchased again the error will pop up to say that there is no more stock in that store 
Call customer_purchases(cast(name_to_customer_no('Sarah Smith') as smallint), cast(update_purchase_no() as smallint), cast(111 as smallint), cast(1 as smallint), cast(current_date as DATE), cast(to_date('1-10-2021', 'DD-MM-YYYY') as DATE), cast('17:00'as TIME));



