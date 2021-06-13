create SCHEMA comics;
USE comics;

CREATE TABLE Comic_book
(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Name1 VARCHAR(255) NOT NULL ,
	Format1 VARCHAR(255) NOT NULL ,
	Description1 TEXT NOT NULL,
	Publishing_date DATE NOT NULL,
	FOC DATE NOT NULL,
	Label_ID INT NOT NULL,
    FOREIGN KEY Comic_book(Label_ID) REFERENCES Lable(ID)    
);

CREATE TABLE Lable
(
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Name2 VARCHAR(255) NOT NULL ,
	Description2 VARCHAR(511) NOT NULL ,
    Name_publisher varchar(20) NOT NULL 
);

CREATE TABLE castomer(
ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
EMAIL varchar(100) NOT NULL,
NAME1 varchar(100) NOT NULL,
ADRESS varchar(100) NOT NULL
);

CREATE TABLE Comic_store(
ID INT(255) NOT NULL PRIMARY KEY AUTO_INCREMENT,
Adress varchar(255) not null,
phone_number varchar(12)
);

CREATE TABLE comic_writer(
ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
Name1 varchar(255) NOT NULL
);

CREATE TABLE Genre(
ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
Name1 varchar(255) NOT NULL,
Description2 varchar(255) NOT NULL
);

CREATE TABLE comic_artist(
ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
Name1 varchar(255) NOT NULL
);

CREATE TABLE Availability(
ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
Count int not null,
Price int not null,
Discount int(100) not null,
Comic_book_ID INT NOT NULL,
Shipment_ID INT NOT NULL,
FOREIGN KEY (Comic_book_ID) REFERENCES Comic_book(id),
FOREIGN KEY (Shipment_ID) REFERENCES comic_store(ID)
);

CREATE TABLE cover_artist(
ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
Name1 varchar(255) NOT NULL
);

CREATE TABLE worker(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
comic_shop_adress int not null,
NAME1 VARCHAR(255) NOT NULL,
POST VARCHAR(255) NOT NULL,
FOREIGN KEY (comic_shop_adress) REFERENCES comic_store(ID)
);

CREATE TABLE order_book (
Order_number int not null PRIMARY KEY AUTO_INCREMENT,
Date1 timestamp not null,
Commentary varchar(255) not null,
Type1 varchar(255) not null,
Status1 int not null,
Worker_ID int not null,
Customer_ID int not null,
FOREIGN KEY (Worker_ID) REFERENCES worker(ID),
FOREIGN KEY (Customer_ID) REFERENCES castomer(ID)
);

CREATE TABLE order_avability(
Availability_ID int not null ,
Order_ID int not null,
Count int not null,
primary key(Availability_ID,Order_ID),
FOREIGN KEY (Availability_ID) REFERENCES Availability(ID),
FOREIGN KEY (Order_ID) REFERENCES order_book(Order_number)
);

CREATE TABLE comics_cover
(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Name1 varchar(255) not null,
URL varchar(255) not null,
Description1 varchar(255) not null,
Cover_artist_ID int not null,
Comic_book_ID int not null,
FOREIGN KEY (Cover_artist_ID) REFERENCES Comic_book(id),
FOREIGN KEY (Cover_artist_ID) REFERENCES cover_artist(ID)
);

CREATE TABLE Genres_of_comic_book
(
Genre_ID INT NOT NULL,
Comic_book_ID INT NOT NULL,
primary key(Genre_ID,Comic_book_ID),
FOREIGN KEY (Genre_ID) REFERENCES Genre(ID),
FOREIGN KEY (Comic_book_ID) REFERENCES Comic_book(id)
);

CREATE TABLE Artists_of_comic_book(
Comic_artist_ID INT NOT NULL,
Comic_book_ID INT NOT NULL,
primary key(Comic_artist_ID,Comic_book_ID),
FOREIGN KEY (Comic_artist_ID) REFERENCES comic_artist(ID),
FOREIGN KEY (Comic_book_ID) REFERENCES Comic_book(id)
);

CREATE TABLE Writers_of_comic_book(
Comic_writer_ID INT NOT NULL,
Comic_book_ID INT NOT NULL,
primary key(Comic_writer_ID,Comic_book_ID),
FOREIGN KEY (Comic_writer_ID) REFERENCES comic_writer(ID),
FOREIGN KEY (Comic_book_ID) REFERENCES Comic_book(id)
);

ALTER TABLE order_book DROP COLUMN Status1;
ALTER TABLE order_book ADD Status1 VARCHAR(30);
ALTER TABLE Comic_book ADD  DATE_OF_ENDING date;
ALTER TABLE Comic_book DROP COLUMN  DATE_OF_ENDING;
ALTER TABLE Genre CHANGE Name1 Naimenovanie VARCHAR(250);
ALTER TABLE comic_book CHANGE Name1 Naimenovanie VARCHAR(250);
ALTER TABLE cover_artist ADD Status1 VARCHAR(30);
ALTER TABLE cover_artist DROP COLUMN Status1;
ALTER TABLE cover_artist CHANGE Name1 Naimenovanie VARCHAR(250);
ALTER TABLE lable CHANGE Name2 Naimenovanie VARCHAR(250);


INSERT INTO comics.lable (Name2,Description2,Name_publisher) VALUES ('Label1','Text1','DC comics');
INSERT INTO Comic_book (Name1,Format1,Description1,Publishing_date,FOC, Label_ID) VALUES ('Criminal #12','Single issue','Text','2021-06-24','2021-06-20','1');
INSERT INTO Comic_store(adress, phone_number) VALUES('б-р Победы, 21','+79048889999');
INSERT INTO castomer(EMAIL,NAME1, ADRESS) VALUES ('customerEmail1@mail.com','Ivanov Ivan','Customer1_adress');
INSERT INTO Availability(Count,Price,Discount,Comic_book_ID, Shipment_ID) VALUES ('62','120','10','4','1');
INSERT INTO Genre( Name1, Description2) VALUES ('Pulp fiction','TEXT');
INSERT INTO worker(comic_shop_adress,NAME1,POST) VALUES ('1','Даниил Данилов','ADMIN');
INSERT INTO cover_artist(Name1) VALUES ('Chip Zdarsky');
INSERT INTO order_book(Date1,Commentary,Type1,Status1,Worker_ID,Customer_ID) VALUES ('2021-05-31','Free sheepment','Buy now','Assembled','1','1');
INSERT INTO comics_cover(Name1,URL,Description1 ,Cover_artist_ID,Comic_book_ID ) VALUES ('Incentive coveR','url.com/url.png','SDCC exclusive','4','4');

RENAME TABLE castomer to customer;
RENAME TABLE comic_store to comic_shop;
RENAME TABLE availability to available;















