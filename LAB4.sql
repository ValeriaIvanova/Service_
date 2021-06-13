use  store_tires_and_car_service_stations;
-- Добавление записи
INSERT INTO запись (Дата, ID_покупателя,ID_сотрудника) VALUES ('2021-05-18','25','38');
SELECT *FROM запись;

-- Добавление товара
INSERT INTO товар(стоимость, описание, id_магазина) VALUES ('6000','Диски для мерседес','3');
INSERT INTO товар(стоимость, описание, id_магазина) VALUES ('7000','Шины для мерседес','3');
select *from товар;

-- Удалить неактуальные товары
DELETE FROM товар WHERE idТовар="21";
DELETE FROM товар WHERE idТовар="20";

-- Изменить цену товара
UPDATE товар SET стоимость = 8000 WHERE idТовар="22";
UPDATE товар SET стоимость = 16000 WHERE idТовар="1";

-- Показать описание товаров стоимостью >10000
SELECT стоимость, описание FROM товар where стоимость >10000;
-- показать страну произовдителя дисков и их бренд, если страна - Китай
SELECT страна, наименование from производитель_дисков where страна="Китай";

-- Показать отзывы о товаре где оценка 4
SELECT достоинства, недостатки, комментарий FROM отзыв WHERE оценка =4;
-- Показать отзывы о товаре где оценка 5
SELECT достоинства, недостатки, комментарий FROM отзыв WHERE оценка =5;
-- Показать отзывы о товаре где оценка 1
SELECT достоинства, недостатки, комментарий,оценка FROM отзыв WHERE оценка =1 or оценка=2;

create table марка_авто(
id int not null auto_increment primary key,
наименование varchar(30) not null,  
тип varchar(30) not null);
INSERT INTO марка_авто(наименование, тип) VALUES ('Ford','Sedan'), ('Ford','hechback'), ('Tayota','liftback');

-- запросы UPDATE

UPDATE магазин SET Адрес ='ул.Мира, 5' WHERE idМагазин=1 ;
UPDATE параметры_шин SET диаметр ='16' WHERE id_параметров=1 ;
UPDATE отзыв SET оценка = '5'  WHERE 'Недостатки'='нет';
UPDATE марка_авто SET тип='cabriolet' WHERE 'наименование'='Tayota';
UPDATE марка_авто SET тип='lifback' WHERE 'тип'='sedan';



-- запросы DELETE
DELETE FROM типрезины WHERE 'Сезон'='всесезонные';
DELETE FROM марка_авто WHERE id=1;
DELETE FROM марка_авто WHERE id=2;
DELETE FROM марка_авто WHERE id=3;
DELETE FROM сотрудник WHERE idСотрудник=49;

-- запросы SELECT
-- DISTINCT
SELECT DISTINCT ФИО FROM сотрудник ;
SELECT DISTINCT стаж FROM сотрудник ;
SELECT DISTINCT ФИО FROM покупатель ;
SELECT DISTINCT ФИО,телефон FROM покупатель ;

-- WHERE
SELECT описание, стоимость FROM товар WHERE стоимость > 10000;
SELECT страна, наименование from производитель_дисков where (страна="Германия" and страна="Япония") ;
SELECT страна, наименование from производитель_дисков where (страна="Германия" or страна="Китай") ;
SELECT наименование, сезон FROM типрезины WHERE сезон="лето" ;
SELECT наименование, стоимость FROM услуги_автосервиса  WHERE стоимость BETWEEN 2000 AND 4000;
SELECT диаметр,ширина FROM `размер дисков`  WHERE ширина BETWEEN 200 AND 220;
SELECT диаметр,ширина,высота FROM параметры_шин  WHERE ширина IN (200,215);
SELECT наименование, стоимость FROM услуги_автосервиса  WHERE стоимость IN (1000,3000);
SELECT наименование, стоимость FROM услуги_автосервиса  WHERE стоимость NOT IN (1000,3000);
SELECT описание, стоимость FROM товар WHERE NOT (стоимость=6000 or стоимость=7000) ;
SELECT *FROM товар WHERE стоимость  IS NOT NULL;
SELECT *FROM товар WHERE стоимость  IS NULL;
-- AS
SELECT idТовар AS ID, стоимость AS цена FROM товар;
SELECT недостатки AS минусы, достоинства AS плюсы FROM отзыв;
SELECT idЗапись AS id FROM запись;
SELECT idПокупатель AS id FROM покупатель;

-- LIKE
SELECT наименование, страна FROM производитель_дисков WHERE страна LIKE 'Германия';
SELECT наименование, страна FROM `производитель шин` WHERE страна LIKE 'Япония';
SELECT Адрес FROM магазин WHERE Адрес LIKE 'Ул. Ленина, 55';
SELECT телефон, ФИО FROM покупатель WHERE ФИО LIKE 'Иванов Иван Иванович';
SELECT наименование, страна FROM производитель_дисков WHERE страна  LIKE 'Г%';
SELECT наименование, страна FROM производитель_дисков WHERE страна  LIKE '%я';

create table новая_таблица(
id int not null auto_increment primary key,
наименование varchar(30) not null,  
тип varchar(30) not null);
INSERT INTO марка_авто(наименование, тип) VALUES ('Ford','Sedan'), ('Ford','hechback'), ('Tayota','liftback');

-- INSERT 
INSERT INTO новая_таблица (наименование,тип) SELECT наименование, страна FROM производитель_дисков WHERE страна="Германия";
INSERT INTO новая_таблица (наименование,тип) SELECT недостатки, достоинства FROM отзыв WHERE оценка=1;
INSERT INTO новая_таблица (наименование,тип) SELECT стоимость, описание FROM товар WHERE стоимость=40000;

-- GROUP BY
SELECT COUNT(id), страна FROM `производитель шин` GROUP BY страна;
SELECT COUNT(idЗаказ), id_покупателя FROM заказ GROUP BY id_покупателя;
SELECT COUNT(id), страна FROM производитель_дисков GROUP BY страна;
SELECT магазин.idМагазин, сотрудник.ФИО FROM магазин, сотрудник GROUP BY idМагазин;
SELECT товар.стоимость, `производитель шин`.страна FROM товар, `производитель шин` GROUP BY стоимость;
SELECT * FROM услуги_автосервиса WHERE id>0 LIMIT 3;
SELECT * FROM услуги_автосервиса  LIMIT 5;
SELECT * FROM услуги_автосервиса WHERE id>0 ORDER BY id LIMIT 3;
SELECT наименование, SUM(стоимость) as sum FROM услуги_автосервиса GROUP BY стоимость;
SELECT ID_Должность, SUM(Стаж) as сумма_стажа FROM сотрудник GROUP BY ID_Должность;
SELECT страна, count(*) as фирмы_в_стране FROM производитель_дисков GROUP BY страна;
SELECT idтовара, SUM(количество) as кол_во_товара FROM `заказ-товар` GROUP BY idтовара;
SELECT COUNT(idтовара), количество FROM `заказ-товар` GROUP BY количество HAVING COUNT(idтовара)>1;
SELECT ФИО,ID_Должность, MAX(стаж) as max FROM сотрудник GROUP BY ID_Должность;
SELECT ФИО,ID_Должность, MIN(стаж) as min FROM сотрудник GROUP BY ID_Должность;
SELECT стоимость, описание FROM товар WHERE idТовар>0 ORDER BY стоимость;
SELECT стоимость, наименование FROM услуги_автосервиса WHERE id>0 ORDER BY стоимость DESC;
SELECT ID_Должность, AVG(стаж) as средний_стаж FROM сотрудник WHERE ID_Должность=4 ;
SELECT AVG(стоимость), idТовар FROM товар GROUP BY idТовар HAVING AVG(стоимость) > 10000;
SELECT idТовар, SUM(стоимость) FROM товар GROUP BY стоимость;
SELECT ID_Должность, AVG(стаж) as средний_стаж FROM сотрудник GROUP BY ID_Должность HAVING AVG(стаж) < 7 ;

-- JOIN
SELECT сотрудник.idСотрудник, сотрудник.ФИО `Имя сотрудника`, должность.id `id_должности`, должность.имя `Должность`
FROM `сотрудник` сотрудник INNER JOIN `должность` должность ON должность.id = сотрудник.ID_Должность;

SELECT сотрудник.idСотрудник, сотрудник.ФИО `Имя сотрудника`, магазин.idМагазин `id_магазина`, магазин.адрес `Адрес магазина`
FROM `сотрудник` сотрудник INNER JOIN `Магазин` магазин ON магазин.idМагазин = сотрудник.id_магазина;

SELECT товар.idТовар, товар.стоимость, диски.idДиски, диски.id_производителя, производитель_дисков.Наименование
FROM товар INNER JOIN диски  ON диски.idДиски = товар.idТовар
		   INNER JOIN производитель_дисков  ON производитель_дисков.id = диски.id_производителя;

SELECT сотрудник.idСотрудник, сотрудник.ФИО `Имя сотрудника`, должность.id `id_должности`, должность.имя `Должность`
FROM сотрудник RIGHT OUTER JOIN  должность ON должность.id = сотрудник.ID_Должность;

SELECT типрезины.сезон, шины.idшины FROM типрезины LEFT JOIN шины USING(idРезины);
SELECT типрезины.сезон, шины.idшины FROM типрезины RIGHT JOIN шины USING(idРезины);
SELECT товар.idТовар,товар.описание, отзыв.комментарий FROM товар RIGHT JOIN отзыв USING(idтовар);
SELECT сотрудник.ФИО `Сотрудник`, магазин.адрес`место работы`  FROM сотрудник  LEFT JOIN магазин USING(idМагазин);
SELECT * FROM типрезины CROSS JOIN шины;
SELECT * FROM  отзыв CROSS JOIN покупатель;
SELECT * FROM  отзыв CROSS JOIN магазин;
SELECT * FROM  услуги_автосервиса, магазин FULL JOIN `услуга-магазин`;
SELECT стоимость, описание, адрес FROM товар CROSS JOIN магазин ;
SELECT ФИО, адрес "Место работы" FROM сотрудник CROSS JOIN магазин ;
SELECT сезон, наименование, idшины FROM типрезины CROSS JOIN шины ;
SELECT *FROM покупатель NATURAL JOIN отзыв;
SELECT IDПокупатель, ФИО, Дата FROM покупатель NATURAL JOIN запись;
SELECT *FROM должность NATURAL JOIN сотрудник;
SELECT IDПокупатель, ФИО, адрес FROM покупатель NATURAL JOIN магазин;
SELECT * FROM  производитель_дисков CROSS JOIN диски ;

-- UNION, EXCEPT, INTERSECT
-- Объединение цен на товары и услуги
SELECT  `Стоимость` FROM  товар UNION SELECT  `Стоимость` FROM услуги_автосервиса ORDER BY  `Стоимость`;
SELECT * FROM производитель_шин WHERE EXISTS(SELECT страна FROM производитель_шин WHERE id>5);
SELECT  `страна` FROM  производитель_шин UNION SELECT  `Страна` FROM производитель_дисков ORDER BY  `страна`;

-- ALL, ANY, EXISTS 
SELECT ALL *FROM производитель_дисков WHERE страна  LIKE 'Г%';
SELECT ALL *FROM покупатель WHERE ФИО  LIKE '%а';
SELECT * FROM товар WHERE EXISTS(SELECT стоимость FROM товар WHERE стоимость > 15000);
SELECT описание, idТовар FROM товар WHERE idТовар = ANY (SELECT idТовар FROM отзыв WHERE оценка = 5);

-- GROUP_CONCAT
SELECT GROUP_CONCAT(страна) as Страны FROM производитель_шин;
SELECT GROUP_CONCAT(стоимость) as Цены FROM товар;
SELECT GROUP_CONCAT(наименование) as Страны FROM производитель_шин;
SELECT GROUP_CONCAT(адрес) as Страны FROM магазин;
SELECT стаж, GROUP_CONCAT(ФИО SEPARATOR ' - ') as ФИО FROM сотрудник GROUP BY стаж;

-- сложные запросы
SELECT товар.idТовар, товар.стоимость, диски.idДиски, диски.id_производителя, производитель_дисков.Наименование
FROM товар INNER JOIN диски  ON диски.idДиски = товар.idТовар
		   INNER JOIN производитель_дисков  ON производитель_дисков.id = диски.id_производителя;

SELECT Описание, Стоимость, (SELECT AVG(Стоимость) FROM товар) AS ср_цена FROM товар
 WHERE стоимость > (SELECT AVG(стоимость) FROM товар);
 
SELECT сотрудник.ФИО `Сотрудник`, магазин.адрес`место работы`, запись.Дата as `Запись на прием`   FROM сотрудник  Inner JOIN магазин USING(idМагазин)
																				Inner JOIN запись ON запись.IDСотрудника= сотрудник.idСотрудник
                                                                                GROUP BY адрес;

-- МОДИФИКАЦИЯ
-- покупатель сделал заказ, указать сумму товаров заказа, на какую дату
SELECT покупатель.ФИО,  SUM(стоимость) as "Общая стоимость товара", GROUP_CONCAT(заказ.дата) AS "Дата заказов",GROUP_CONCAT(товар.описание) as "Описание товара" -- производитель_дисков.Наименование, производитель_шин.наименование
	FROM покупатель JOIN заказ USING (IDПокупателя)
    JOIN `заказ-товар` on `заказ-товар`.idзаказ=заказ.idзаказ
    JOIN товар using (idтовар)
   -- JOIN диски ON диски.idДиски=товар.idтовар
--    JOIN шины ON шины.idшины=товар.idтовар
--    JOIN производитель_дисков ON производитель_дисков.id=диски.idДиски
--    JOIN производитель_шин ON производитель_шин.id=шины.idшины-- 
    WHERE покупатель.ФИО LIKE "Петров Петр Федорович"    ;
    
    -- всю информацию по шинам через товар с описанием+ средняя оценка товара
    SELECT distinct страна, производитель_шин.наименование,
     товар.стоимость ,  параметры_шин.диаметр, параметры_шин.высота, параметры_шин.ширина, типрезины.сезон, типрезины.наименование,
    AVG(оценка) as средняя_оценка 
    FROM шины 
	LEFT JOIN типрезины ON типрезины.idРезины= шины.idРезины
    RIGHT  JOIN товар ON товар.idТовар=шины.idшины
    JOIN отзыв ON отзыв.idтовар=товар.idТовар
    JOIN производитель_шин ON производитель_шин.id=шины.id_производителя
	JOIN параметры_шин ON параметры_шин.id_параметров=шины.id_размеры
    GROUP BY idшины;
    
    
    
    -- топ 5 сотрудников определенного магазина за определенный период по записям
select Запись.IDСотрудника, COUNT(idЗапись) as total, сотрудник.ФИО, магазин.Адрес
from сотрудник 
join запись on  запись.IDСотрудника=сотрудник.idСотрудник 
join магазин USING (idМагазин)
group by IDСотрудника order by total desc limit 5;
    
    
    
    