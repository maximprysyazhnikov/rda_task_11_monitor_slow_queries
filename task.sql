-- Створюємо БД ShopDB і одразу використовуємо її
CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

-- Створюємо таблицю Products1 (InnoDB)
CREATE TABLE Products1 (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255)
) ENGINE=InnoDB;

-- Видаляємо процедуру, якщо вона вже існує
DROP PROCEDURE IF EXISTS SeedData;

-- Створюємо процедуру вставки 100 000 продуктів
DELIMITER //
CREATE PROCEDURE SeedData()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE prod_name VARCHAR(255);

    WHILE i <= 100000 DO
        IF i = 42 THEN
            SET prod_name = 'AwersomeProduct42';
        ELSE
            SET prod_name = CONCAT('Product', i);
        END IF;

        INSERT INTO Products1 (Name) VALUES (prod_name);
        SET i = i + 1;
    END WHILE;
END;
//
DELIMITER ;

-- Викликаємо процедуру
CALL SeedData();
