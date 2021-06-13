use store_tires_and_car_service_stations;
insert into тип_резины (Наименование,Сезон) values ('обычные','лето') ,
('шипы','зима'),
('липучка','зима'), 
('обычные','всесезонные') ,
('спортивные','лето'), 
('смешаннные','зима'), 
('симметричный протектор','лето') ,
('ассимметричный протектор','лето'), 
('узкий профиль','лето'),
('широкий профиль','лето') ;

INSERT INTO Услуги_автосервиса (Name_,Count_) VALUES ('Чистка салона', '3');
INSERT INTO Услуги_автосервиса (Name_,Count_) VALUES ('Смена шин', '2');
INSERT INTO Услуги_автосервиса (Name_,Count_) VALUES ('Замена стекла', '4');
INSERT INTO Услуги_автосервиса (Name_,Count_) VALUES ('Чистка капота', '6');
INSERT INTO Услуги_автосервиса (Name_,Count_) VALUES ('Замена автомобильного масла', '5');
INSERT INTO Услуги_автосервиса (Name_,Count_) VALUES ('Проверка технического состояния', '2');

INSERT INTO Магазин (address) VALUES ('улица Хиросимы, 16');
INSERT INTO Магазин(address) VALUES ('Пражская улица, 17');
INSERT INTO Магазин (address) VALUES ('Коммунистическая улица, 54');
INSERT INTO Магазин (address) VALUES ('улица Ткачёва, 5');
INSERT INTO Магазин (address) VALUES ('Двинская улица, 13');
INSERT INTO Магазин (address) VALUES ('улица Рокоссовского, 58');


INSERT INTO покупатель (FIO, telephone) VALUES ('Фролов Кондратий Авдеевич', 79878972005);
INSERT INTO покупатель (FIO, telephone) VALUES ('Кисельев Андрей Петрович', 79615574081);
INSERT INTO покупатель (FIO, telephone) VALUES ('Захаров Владислав Степанович', 79138866898);
INSERT INTO покупатель (FIO, telephone) VALUES ('Козин Кирилл Сергеевич', 79135839459);
INSERT INTO покупатель (FIO, telephone) VALUES ('Дмитриев Михаил Миронович', 79729594076);
INSERT INTO покупатель (FIO, telephone) VALUES ('Пономарев Даниил Михайлович', 79724154062);

select * from покупатель;

LOAD DATA INFILE 'D:\\test.csv' 
INTO TABLE покупатель 
FIELDS TERMINATED BY ',' 
IGNORE 1 ROWS 
(FIO, telephone);
 
LOAD DATA INFILE 'D:\\tires.csv' 
INTO TABLE параметры_шин 
FIELDS TERMINATED BY ',' 
IGNORE 1 ROWS 
(высота, ширина, диаметр);


LOAD DATA INFILE 'D:\\records.csv' 
INTO TABLE запись 
FIELDS TERMINATED BY ',' 
IGNORE 1 ROWS 
(Date, id_buyer, id_employer);

LOAD DATA INFILE 'D:\\records.csv' 
INTO TABLE заказ 
FIELDS TERMINATED BY ',' 
IGNORE 1 ROWS 
(Date, id_buyer, id_employer);

LOAD DATA INFILE 'D:\\product.csv' 
INTO TABLE товар 
FIELDS TERMINATED BY ',' 
IGNORE 1 ROWS 
(стоимость, id_магазина, id_шины, id_диски);

LOAD DATA INFILE 'D:\\otz.csv' 
INTO TABLE отзывы
FIELDS TERMINATED BY ',' 
IGNORE 1 ROWS 
(Достоинства, Недостатки, Оценка, Комментарий, id_товара, id_покупателя);

LOAD DATA INFILE 'D:\\count.csv' 
INTO TABLE заказ_товар
FIELDS TERMINATED BY ',' 
IGNORE 1 ROWS 
(id_booking, id_product, Count_);

LOAD DATA INFILE 'D:\\us.csv' 
INTO TABLE услуга_запись
FIELDS TERMINATED BY ',' 
IGNORE 1 ROWS 
(id_record, id_service);

LOAD DATA INFILE 'D:\\dol.csv' 
INTO TABLE сотрудники
FIELDS TERMINATED BY ',' 
IGNORE 1 ROWS 
(FIO, Work_expirience, idstore,id_post);


-- выводит всю информацию по дискам
SELECT товар.idТовар, товар.стоимость, диски.idДиски, диски.idvendor, производитель_дисков.Наименование
FROM товар INNER JOIN диски  ON диски.idДиски = товар.idТовар
INNER JOIN производитель_дисков  ON производитель_дисков.id = диски.idvendor;

CREATE INDEX наименование ON производитель_дисков(наименование);
-- средняя цена на товар
SELECT описание, стоимость, (SELECT AVG(стоимость) FROM товар) AS ср_цена FROM товар WHERE стоимость > (SELECT AVG(стоимость) FROM товар);



-- к кому больше всего записи и в каком магазине
SELECT сотрудники.FIO `Сотрудник`, магазин.address`место работы`, запись.Date as `Запись на прием`  
FROM сотрудники  Inner JOIN магазин USING(idstore) Inner JOIN запись 
ON запись.id_employer= сотрудники.id_employer GROUP BY address;


-- покупатель сделал заказ, указать сумму товаров заказа, на какую дату
SELECT покупатель.FIO,  SUM(стоимость) as "Общая стоимость товара", GROUP_CONCAT(заказ.Date) AS "Дата заказов",GROUP_CONCAT(товар.описание) as "Описание товара" -- производитель_дисков.Наименование, производитель_шин.наименование
	FROM покупатель JOIN заказ USING (id_buyer)
    JOIN `заказ_товар` on `заказ_товар`.id_booking=заказ.id_record
    JOIN товар on товар.idТовар=заказ_товар.id_product
    WHERE покупатель.FIO LIKE "Penn Klimko"    ;


  -- всю информацию по шинам через товар с описанием+ средняя оценка товара
    SELECT distinct страна, производитель_шин.Имя,
     товар.стоимость ,  параметры_шин.диаметр, параметры_шин.высота, параметры_шин.ширина, тип_резины.Сезон, тип_резины.Наименование,
    AVG(Оценка) as средняя_оценка 
    FROM шины 
	LEFT JOIN тип_резины ON тип_резины.idРезины= шины.id_резины
    RIGHT  JOIN товар ON товар.id_шины=шины.idшины
    JOIN отзывы ON отзывы.id_товара=товар.idТовар
    JOIN производитель_шин ON производитель_шин.id_vendor_psh=шины.id_производителя
	JOIN параметры_шин ON параметры_шин.id_параметров=шины.id_размеры
    GROUP BY idшины;
    
    
-- топ 10 сотрудников определенного магазина за определенный период по записям
select COUNT(id_record) as total, сотрудники.FIO, магазин.address
from сотрудники 
join запись using(id_employer)
join магазин USING (idstore)
group by id_employer order by total desc limit 10;



SELECT Work_expirience, GROUP_CONCAT(FIO SEPARATOR ' - ') as FIO FROM сотрудники GROUP BY Work_expirience;

SELECT товар.idТовар, товар.стоимость, диски.idДиски, диски.idvendor, производитель_дисков.Наименование
FROM товар INNER JOIN диски  ON диски.idДиски = товар.idТовар INNER JOIN производитель_дисков  ON производитель_дисков.id = диски.idvendor;


SELECT сотрудники.id_employer, сотрудники.FIO `Имя сотрудника`, должность.id `id_должности`, должность.Имя `Должность`
FROM `сотрудники` сотрудники INNER JOIN `должность` должность ON должность.id = сотрудники.id_post;

SELECT COUNT(id_record), id_buyer FROM заказ GROUP BY id_buyer;

SELECT диаметр,ширина FROM `размер_дисков`  WHERE ширина BETWEEN 32 AND 55;

SELECT *FROM товар WHERE стоимость  IS NOT NULL;

CREATE INDEX стоимость ON товар(стоимость);
CREATE INDEX id_record on запись(id_record);
CREATE INDEX FIO ON покупатель(FIO); 
CREATE INDEX FIO ON сотрудники(FIO); 
CREATE INDEX ширина ON размер_дисков(ширина);


-- Процедуры
drop procedure booking;
DELIMITER //
-- Процедура, которая показывает группы сотрудников с одинаковым стажем
CREATE PROCEDURE booking()
BEGIN 
	select  Work_expirience,  GROUP_CONCAT(FIO SEPARATOR ' - ') as FIO FROM сотрудники
    GROUP BY Work_expirience;
END //
DELIMITER ; 
Call booking();

drop procedure product;
-- процедура показывает всю информацию  по дискам
DELIMITER // 
CREATE PROCEDURE product()
BEGIN  SELECT товар.idТовар,товар.id_диски, товар.стоимость, диски.idДиски, диски.idvendor, производитель_дисков.Наименование, IFNULL(Описание, 'нет описания')
FROM товар INNER JOIN диски  ON диски.idДиски = товар.id_диски
INNER JOIN производитель_дисков  ON производитель_дисков.id = диски.idvendor;
END //
DELIMITER ;
call product();
-- Дает нечеткое характеристику о товаре 
drop procedure feedback;
DELIMITER // 
 CREATE PROCEDURE feedback()
BEGIN
SELECT оценка, Достоинства, недостатки,
CASE
WHEN оценка = 4 THEN 'хороший товар'
WHEN оценка = 5 THEN 'отличный товар'
END AS 'Характеристика товара'
FROM отзывы;
END//
DELIMITER ;
call feedback();

drop function inf_product;
-- Функции
-- Расчет стоимости товара
DELIMITER // 
CREATE FUNCTION inf_product (стоимость int)
RETURNS INT
READS SQL DATA
DETERMINISTIC

BEGIN
DECLARE cost INT;
SET cost = 0;
SELECT стоимость INTO cost FROM `товар` LIMIT 1;
RETURN cost;
END//
 DELIMITER ;
 SELECT inf_product(стоимость) FROM товар;
 
-- Повышение рейтинга, переход к 10 бальной системе оценки
drop function sr_oc; 
 DELIMITER $$ 
CREATE FUNCTION Sr_oc ( оценка INT)
RETURNS  INT
DETERMINISTIC
BEGIN
	IF оценка > 3 AND оценка = 5 THEN
		SET оценка = Оценка/0.5;
	END IF; 
RETURN (оценка); 
END $$ 
DELIMITER ;	
Select Sr_oc (оценка) from отзывы;

-- Расчет стоимости услуг
DELIMITER // 
CREATE FUNCTION inf_serv (cost_ int)
RETURNS INT
READS SQL DATA
DETERMINISTIC

BEGIN
DECLARE cost INT;
SET cost = 0;
SELECT cost_ INTO cost FROM `услуги_автосервиса` LIMIT 1;
RETURN cost;
END//
 DELIMITER ;
 SELECT inf_serv(cost_) FROM услуги_автосервиса;


-- Представления
-- топ 20 сотрудников определенного магазина за определенный период по записям
Create VIEW Info AS select COUNT(id_record) as total, сотрудники.FIO, магазин.address
from сотрудники 
join запись using(id_employer) 
join магазин USING (idstore)
group by id_employer order by total desc limit 20;

SELECT * FROM Info;


-- всю информацию по шинам через товар с описанием+ средняя оценка товара
Create view Info2 as SELECT distinct страна, производитель_шин.имя,
     товар.стоимость ,  параметры_шин.диаметр, параметры_шин.высота, параметры_шин.ширина, тип_резины.сезон, тип_резины.наименование,
    AVG(оценка) as средняя_оценка 
    FROM шины 
	LEFT JOIN тип_резины ON тип_резины.idРезины= шины.id_резины
    RIGHT  JOIN товар ON товар.id_шины=шины.idшины
    JOIN отзывы ON отзывы.id_товара=товар.idТовар
    JOIN производитель_шин ON производитель_шин.id_vendor_psh=шины.id_производителя
	JOIN параметры_шин ON параметры_шин.id_параметров=шины.id_размеры
    GROUP BY idшины;
    
SELECT * FROM Info2;


-- покупатель сделал заказ, указать сумму товаров заказа, на какую дату
Create view Info3 as SELECT покупатель.FIO,  SUM(стоимость) as "Общая стоимость товара", GROUP_CONCAT(заказ.Date) AS "Дата заказов" -- ,GROUP_CONCAT(товар.описание) as "Описание товара" -- производитель_дисков.Наименование, производитель_шин.наименование
	FROM покупатель JOIN заказ USING (id_buyer)
    JOIN `заказ_товар` on `заказ_товар`.id_booking=заказ.id_record
    JOIN товар on товар.idТовар=заказ_товар.id_product
    WHERE покупатель.FIO LIKE "Козин Кирилл Сергеевич"   ;
    SELECT * FROM Info3;

drop procedure Feedback1;
DELIMITER //
CREATE PROCEDURE Feedback1(IN id int, out id_comment int, out Оценка int)

BEGIN
	SELECT COUNT(отзывы.id_comment), AVG(отзывы.Оценка)
	INTO id_comment, Оценка
    FROM отзывы 
	where id = id_товара ;
END//
DELIMITER ;

call Feedback1 (111,@id_comment,@Оценка);
select @id_comment,@Оценка;

SELECT id_товара,COUNT(id_comment) from отзывы GROUP BY id_товара; 
   
SELECT AVG(оценка), id_товара FROM отзывы GROUP BY id_товара ;