USE store_tires_and_car_service_stations;

CREATE TABLE IF NOT EXISTS Покупатель (
    id_buyer INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    FIO VARCHAR(60) NOT NULL, 
    telephone VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Услуги_автосервиса (
	id_service INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL, 
	Name_ VARCHAR(40)   NOT NULL,
    Count_ INTEGER  NOT NULL  
);
Alter table Услуга_автосервиса
ADD check (Count_ > 1 and Count_< 100);


CREATE TABLE IF NOT EXISTS Магазин (
    id_store INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    address VARCHAR(40) NOT NULL
);

Alter table Услуги_автосервиса
ADD Column id_stories INTEGER;
Alter table Услуги_автосервиса
ADD FOREIGN KEY (id_stories) REFERENCES Магазин (id_store);


CREATE TABLE IF NOT EXISTS Сотрудники (
    id_employer INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    FIO VARCHAR(40) NOT NULL,
    Post VARCHAR(40) NOT NULL,
    Work_expirience DECIMAL,
    id_stores INTEGER NOT NULL,
    FOREIGN KEY (id_stores) REFERENCES Магазин (id_store)
);

CREATE TABLE IF NOT EXISTS Заказ (
    id_record INTEGER  AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    дата DATE NOT NULL, 
    id_employer INTEGER NOT NULL,
    id_buyer INTEGER NOT NULL ,
    FOREIGN KEY (id_buyer) REFERENCES Покупатель (id_buyer)
    );




    
CREATE TABLE IF NOT EXISTS Запись (
    id_record INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    дата DATE NOT NULL, 
    id_buyer INTEGER NOT NULL,
    id_employer INTEGER NOT NULL,
    FOREIGN KEY (id_employer) REFERENCES Сотрудники(id_employer)
);



CREATE TABLE IF NOT EXISTS Производитель_шин (
    id_vendor_psh INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    Имя VARCHAR(40)  NOT NULL,
    Страна VARCHAR(40)  NOT NULL 

);



CREATE TABLE IF NOT EXISTS Тип_резины (
    id_rubber INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    Winter INTEGER NOT NULL,
    Spikes INTEGER NOT NULL,
    Summer INTEGER NOT NULL,
    Velcro INTEGER NOT NULL 
);
CREATE TABLE IF NOT EXISTS Размеры_дисков (
    id_size_rd INTEGER AUTO_INCREMENT  PRIMARY  KEY NOT NULL, 
    Rim_Diametr INTEGER NOT NULL,
    Rim_Width INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Производитель_дисков (
    id_vendor_pd INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    Имя VARCHAR(40)  NOT NULL,
    Страна VARCHAR(40)  NOT NULL 
);
CREATE TABLE IF NOT EXISTS Размеры_шин (
    id_size_rsh INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    Weight INTEGER NOT NULL,
    Diametr INTEGER NOT NULL,
    Width INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS Шины (
    id_shin INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    id_vendor_psha INTEGER  NOT NULL,
    id_rubber INTEGER NOT NULL,
    id_size_rsh INTEGER NOT NULL,
    FOREIGN KEY (id_rubber) REFERENCES Тип_резины(id_rubber),
    FOREIGN KEY (id_size_rsh) REFERENCES Размеры_шин(id_size_rsh),
    FOREIGN KEY (id_vendor_psha) REFERENCES Производитель_шин(id_vendor_psh)
);

CREATE TABLE IF NOT EXISTS Товар (
    id_product INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    Description_ VARCHAR(40) NOT NULL,
    Cost DECIMAL NOT NULL,
    id_store INTEGER NOT NULL
);


CREATE TABLE  IF NOT EXISTS Диски (
    id_disk INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    id_vendor_pd INTEGER  NOT NULL,
    id_size_rd INTEGER NOT NULL,
    FOREIGN KEY (id_vendor_pd) REFERENCES Производитель_дисков(id_vendor_pd),
	FOREIGN KEY (id_size_rd) REFERENCES Размеры_дисков(id_size_rd),
    FOREIGN KEY (id_disk) REFERENCES Товар (id_product)
);


CREATE TABLE IF NOT EXISTS Отзыв (
    Advantage VARCHAR(40)   NOT NULL, 
	Disadvantages VARCHAR(40) NOT NULL, 
    Rating INTEGER,
    Comment_  VARCHAR(40),
   id_product INTEGER NOT NULL,
   id_buyer INTEGER NOT NULL,   
   FOREIGN KEY (id_product) REFERENCES Товар (id_product),
   FOREIGN KEY (id_buyer) REFERENCES Покупатель (id_buyer)
);

CREATE TABLE IF NOT EXISTS Услуга_запись (
	id_record INTEGER   NOT NULL,
    id_service INTEGER   NOT NULL,
    FOREIGN KEY (id_record) REFERENCES Запись (id_record),
    FOREIGN KEY (id_service) REFERENCES Услуги_автосервиса (id_service)
);

CREATE TABLE IF NOT EXISTS Услуга_магазин (
	id_store INTEGER  NOT NULL,
    id_service INTEGER   NOT NULL,
    FOREIGN KEY (id_store) REFERENCES Магазин (id_store),
    FOREIGN KEY (id_service) REFERENCES Услуги_автосервиса (id_service)
);



CREATE TABLE IF NOT EXISTS Заказ_товар (
  id_booking INTEGER NOT NULL, 
  id_product INTEGER    NOT NULL, 
  Count_ INTEGER NOT NULL,
  FOREIGN KEY (id_booking) REFERENCES Заказ (id_record),
  FOREIGN KEY (id_product) REFERENCES Товар (idТовар)
);

START TRANSACTION;
INSERT INTO magazine_and_autoservise.Услуга_автосервиса (Name_,Count_) VALUES ('Чистка салона', '3');
INSERT INTO magazine_and_autoservise.Услуга_автосервиса (Name_,Count_) VALUES ('Смена шин', '2');
INSERT INTO magazine_and_autoservise.Услуга_автосервиса (Name_,Count_) VALUES ('Замена стекла', '4');
INSERT INTO magazine_and_autoservise.Услуга_автосервиса (Name_,Count_) VALUES ('Чистка капота', '6');
INSERT INTO magazine_and_autoservise.Услуга_автосервиса (Name_,Count_) VALUES ('Замена автомобильного масла', '5');
INSERT INTO magazine_and_autoservise.Услуга_автосервиса (Name_,Count_) VALUES ('Проверка технического состояния', '2');

COMMIT;

START TRANSACTION;
INSERT INTO magazine_and_autoservise.Производитель_шин (Имя,Страна) VALUES ('Кузнецов Дмитрий Саввич', 'Великобритания');
INSERT INTO magazine_and_autoservise.Производитель_шин (Имя,Страна) VALUES ('Андреев Адам Владиславович', 'Черногория');
INSERT INTO magazine_and_autoservise.Производитель_шин (Имя,Страна) VALUES ('Власов Даниил Даниилович', 'Молдавия');
INSERT INTO magazine_and_autoservise.Производитель_шин (Имя,Страна) VALUES ('Новиков Максим Андреевич','Албания');
INSERT INTO magazine_and_autoservise.Производитель_шин (Имя,Страна) VALUES ('Исаев Александр Андреевич','Македония');
INSERT INTO magazine_and_autoservise.Производитель_шин (Имя,Страна) VALUES ('Козловский Александр Кириллович','Швейцария');
COMMIT;
START TRANSACTION;
INSERT INTO magazine_and_autoservise.Магазин (address) VALUES ('улица Хиросимы, 16');
INSERT INTO magazine_and_autoservise.Магазин(address) VALUES ('Пражская улица, 17');
INSERT INTO magazine_and_autoservise.Магазин (address) VALUES ('Коммунистическая улица, 54');
INSERT INTO magazine_and_autoservise.Магазин (address) VALUES ('улица Ткачёва, 5');
INSERT INTO magazine_and_autoservise.Магазин (address) VALUES ('Двинская улица, 13');
INSERT INTO magazine_and_autoservise.Магазин (address) VALUES ('улица Рокоссовского, 58');
COMMIT;



START TRANSACTION;
INSERT INTO magazine_and_autoservise.покупатель (FIO, telephone) VALUES ('Фролов Кондратий Авдеевич', 79878972005);
INSERT INTO magazine_and_autoservise.покупатель (FIO, telephone) VALUES ('Кисельев Андрей Петрович', 79615574081);
INSERT INTO magazine_and_autoservise.покупатель (FIO, telephone) VALUES ('Захаров Владислав Степанович', 79138866898);
INSERT INTO magazine_and_autoservise.покупатель (FIO, telephone) VALUES ('Козин Кирилл Сергеевич', 79135839459);
INSERT INTO magazine_and_autoservise.покупатель (FIO, telephone) VALUES ('Дмитриев Михаил Миронович', 79729594076);
INSERT INTO magazine_and_autoservise.покупатель (FIO, telephone) VALUES ('Пономарев Даниил Михайлович', 79724154062);
COMMIT;
SHOW CREATE TABLE Шины;

Alter table Шины
DROP foreign key шины_ibfk_3,
DROP COLUMN id_vendor_psha;
CREATE TABLE Шины_to_производитель_шин (
id_shini INTEGER  NOT NULL ,
id_vendor_pshi INTEGER   NOT NULL ,
 primary key (id_shini,id_vendor_pshi),
 FOREIGN KEY (id_vendor_pshi) REFERENCES производитель_шин(id_vendor_psh),
FOREIGN KEY (id_shini) REFERENCES шины(id_shin)
);-- Модификация 2
Alter table Сотрудники
ADD FOREIGN KEY (id_employer) REFERENCES Покупатель (id_buyer);

Alter table Заказ
ADD FOREIGN KEY (id_employer) REFERENCES Сотрудники(id_employer);

Alter table Запись
ADD FOREIGN KEY (id_buyer) REFERENCES Покупатель (id_buyer);

Alter table Услуга_запись
ADD primary key (id_record,id_service);

Alter table Товар
ADD FOREIGN KEY (id_store) REFERENCES Магазин (id_store);

Alter table Шины
ADD  FOREIGN KEY (id_shin) REFERENCES Товар (id_product);


Alter table Заказ_товар
ADD primary key (id_booking,id_product);

Alter table Диски
RENAME COLUMN id_disk to id_disс;

Alter table Производитель_шин
RENAME COLUMN Имя to FIO_employer ;

Alter table Производитель_шин
RENAME COLUMN Страна to Country ;

RENAME TABLE Диски TO Диски_шин;
RENAME TABLE Товар TO Товар_доступный;
RENAME TABLE Отзыв TO Отзыв_покупателя;

DROP table Услуга_магазин;

Alter table Магазин
ADD FOREIGN KEY (id_store)
    REFERENCES Услуга_автосервиса (id_service);
     -- Модификация 1




