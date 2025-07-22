-- Прибираємо попередню процедуру, якщо була
DROP PROCEDURE IF EXISTS SeedData;

DELIMITER //
CREATE PROCEDURE SeedData()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE prod_name VARCHAR(255);  -- <--- Додано змінну для збереження назви продукту

    WHILE i <= 100000 DO
        -- Спершу визначаємо назву в змінну
        IF i = 42 THEN
            SET prod_name = 'AwersomeProduct42';
        ELSE
            SET prod_name = CONCAT('Product', i);
        END IF;

        -- Потім вставляємо значення змінної
        INSERT INTO Products1 (Name) VALUES (prod_name);

        SET i = i + 1;
    END WHILE;
END;
//
DELIMITER ;
