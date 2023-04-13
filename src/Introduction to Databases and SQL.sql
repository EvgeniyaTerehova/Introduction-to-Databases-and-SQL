
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
2. Посчитайте суммарный возраст для каждого имени. Выведите в двух столбцах «имя» и «суммарный возраст».
    Спасибо, делал так:
    SELECT Имя, sum(age) AS Суммарный_возраст
    FROM employee
    WHERE Имя = 'Nikolay'
    OR Имя = 'Klim'
    GROUP BY Имя, age;
3. Выведите имя и самый юный возраст, соответствующий имени.
    SELECT Имя, min(age)
    FROM employee;
4. Выведите имя и максимальный возраст только для неуникальных имен. Результат отсортируйте по возрасту в порядке возрастания.
    SELECT Имя, max(age)
    FROM employee;
        