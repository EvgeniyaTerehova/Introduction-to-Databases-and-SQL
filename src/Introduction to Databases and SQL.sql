
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
 VALUES ('Sokolov', 'Nikolay', 'man', 29);
 INSERT INTO employee (
    first_name, last_name, gender, age)
 VALUES ('Kotov', 'Anton', 'man', 25);
 INSERT INTO employee (
    first_name, last_name, gender, age)
 VALUES ('Strokov', 'Nikolay', 'man', 31);


2. Получите все записи из базы.
    SELECT * FROM employee;
3. Измените одну запись полностью.
    UPDATE book SET first_name = 'Ivanov', last_name = 'Klim', age = 27  WHERE id = 1;
4. Получите все записи из базы.
     SELECT * FROM employee;
5. Удалите одну запись из базы.
    DELETE FROM employee WHERE id = 1;
6. Получите все записи из базы.
     SELECT * FROM employee;


        