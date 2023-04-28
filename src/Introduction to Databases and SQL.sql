
### Задание 1

1. Создайте базу данных “skypro”.
2. Переключитесь сразу на созданную базу данных (\c skypro).
CREATE DATABASE database_skypro;
\c database_skypro;

### Задание 2

Создайте таблицу employee со столбцами:

- id(BIGSERIAL, NOT NULL, PRIMARY KEY)
- first_name(VARCHAR(50), NOT NULL)
- last_name(VARCHAR(50), NOT NULL)
- gender(VARCHAR(6), NOT NULL)
- age (INT, NOT NULL)
    CREATE TABLE employee (

      id BIGSERIAL NOT NULL PRIMARY KEY,
      first_name VARCHAR(50) NOT NULL,
      last_name VARCHAR(50) NOT NULL,
      gender VARCHAR(6) NOT NULL,
      age INT NOT NULL
      );

### Задание 3

1. Добавьте в таблицу 3 записи.

 INSERT INTO employee (
 first_name, last_name, gender, age)
 VALUES ('Nikolay', 'Sokolov', 'man', 29);
 INSERT INTO employee (
    first_name, last_name, gender, age)
 VALUES ('Anton', 'Kotov', 'man', 25);
 INSERT INTO employee (
    first_name, last_name, gender, age)
 VALUES ('Nikolay', 'Strokov', 'man', 31);


2. Получите все записи из базы.
    SELECT * FROM employee;
3. Измените одну запись полностью.
    UPDATE employee SET first_name = 'Klim', last_name = 'Ivanov', age = 27
    WHERE id = 1;
4. Получите все записи из базы.
     SELECT * FROM employee;
5. Удалите одну запись из базы.
    DELETE FROM employee WHERE id = 1;
6. Получите все записи из базы.
     SELECT * FROM employee;


## Задание 1

1. Доведите количество записей в таблице до 5.
    INSERT INTO employee (
    first_name, last_name, gender, age)
 VALUES ('Nikolay', 'Komkov', 'man', 21);
INSERT INTO employee (
    first_name, last_name, gender, age)
VALUES ('Nikolay', 'Tuchkov', 'man', 41);
2. Получите информацию об именах и фамилиях по всем сотрудникам. Колонки должны называться «Имя» и «Фамилия».
    SELECT first_name AS Имя, last_name AS Фамилия FROM employee;
3. Получите всю информацию о сотрудниках, которые младше 30 или старше 50 лет.
     SELECT *
    FROM employee
    WHERE age < 30 OR > 50;
4. Получите всю информацию о сотрудниках, которым от 30 до 50 лет.
   SELECT Фамилия, age
    FROM employee
    WHERE age BETWEEN 30 AND 50;
5. Выведите полный список сотрудников, которые отсортированы по фамилиям в обратном порядке.
     SELECT *
    FROM employee
    ORDER BY Фамилия DESC;
6. Выведите сотрудников, имена которых длиннее 4 символов.
    SELECT *
    FROM employee
    WHERE LENGTH (Имя) > 4;

## Задание 2

1. Измените имена у двух сотрудников так, чтобы на 5 сотрудников было только 3 разных имени, то есть чтобы получились
    две пары тезок и один сотрудник с уникальным именем.
   SELECT 'Nikolay' AS 'Klim'
    FROM employee
    WHERE id = 3;
2. Посчитайте суммарный возраст для каждого имени. Выведите в двух столбцах "имя" и "суммарный возраст".
    SELECT first_name AS Имя, sum(age) AS Суммарный_возраст
    FROM employee
    WHERE Имя = 'Nikolay'
    OR Имя = 'Klim'
    GROUP BY Имя, age;
3. Выведите имя и самый юный возраст, соответствующий имени.
    SELECT first_name AS Имя, age
    FROM employee
    WHERE age = (SELECT MIN(age) FROM employee);
4. Выведите имя и максимальный возраст только для неуникальных имен. Результат отсортируйте по возрасту в порядке возрастания.
    SELECT first_name AS Имя, age
    FROM employee
    WHERE age in (SELECT MAX(age) FROM employee GROUP BY first_name HAVING COUNT(first_name) > 1) ORDER BY 2;

    ### Работа с несколькими таблицами
      ### Задание 1

1. Создайте таблицу city с колонками city_id и city_name.
    CREATE TABLE city (city_id BIGSERIAL NOT NULL PRIMARY KEY, city_name VARCHAR (40) NOT NULL);
2.Добавьте в таблицу employee колонку city_id.
Задача для самостоятельного решения: найдите, как добавлять колонки в существующую таблицу.
    ALTER TABLE employee ADD city_id INT;
3.Назначьте эту колонку внешним ключом. Свяжите таблицу employee с таблицей city.
    ALTER TABLE employee ADD CONSTRAINT city_id FOREIGN KEY (city_id) REFERENCES city (city_id);
4.Заполните таблицу city и назначьте работникам соответствующие города.
    INSERT INTO city (city_name) VALUES ('Volgograd');
    INSERT INTO city (city_name) VALUES ('Tambov');
    INSERT INTO city (city_name) VALUES ('Saratov');
    INSERT INTO city (city_name) VALUES ('Kuzbas');
    INSERT INTO city (city_name) VALUES ('Rasskazovo');

    UPDATE employee SET city_id = 1 WHERE id = 1;
    UPDATE employee SET city_id = 3 WHERE id = 3;
    UPDATE employee SET city_id = 4 WHERE id = 4;
    UPDATE employee SET city_id = 5 WHERE id = 5;
    UPDATE employee SET city_id = 5 WHERE id = 8;
    UPDATE employee SET city_id = 5 WHERE id = 9;

     ### Задание 2
  Создайте ряд запросов к созданной таблице.
1.Получите имена и фамилии сотрудников, а также города, в которых они проживают.
    SELECT first_name,last_name, city_name FROM employee
         INNER JOIN city ON employee.city_id = city.city_id;
2.Получите города, а также имена и фамилии сотрудников, которые в них проживают. Если в городе никто из сотрудников не
    живет, то вместо имени должен стоять null.
    SELECT first_name,last_name, city_name FROM city
        LEFT JOIN employee ON city.city_id = employee.city_id;
3.Получите имена всех сотрудников и названия всех городов. Если в городе не живет никто из сотрудников, то вместо имени
    должен стоять null. Аналогично, если города для какого-то из сотрудников нет в списке, должен быть получен null.
    SELECT first_name, city_name FROM employee
        FULL JOIN employee ON employee.city_id = city.city_id;
4.Получите таблицу, в которой каждому имени должен соответствовать каждый город.
    SELECT first_name, city_name FROM employee CROSS JOIN city;
5.Получите имена городов, в которых никто не живет.
    SELECT city_name FROM city LEFT JOIN employee ON city.city_id = employee.city_id WHERE employee.first_name IS NULL;

