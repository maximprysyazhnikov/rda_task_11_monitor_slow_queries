-- Створюємо БД ShopDB
CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

-- Створюємо тільки таблицю Products1 (InnoDB), бо вона працює швидше
CREATE TABLE Products1 (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255)
) ENGINE=InnoDB;

-- Заповнюємо 100 000 записів
DELIMITER //
CREATE PROCEDURE SeedData()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 100000 DO
        INSERT INTO Products1 (Name)
        VALUES (
            CASE
                WHEN i = 42 THEN 'AwersomeProduct42'
                ELSE CONCAT('Product', i)
            END
        );
        SET i = i + 1;
    END WHILE;
END;
//
DELIMITER ;

CALL SeedData();
