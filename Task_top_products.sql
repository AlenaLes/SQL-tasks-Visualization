-- Task_top_products
-- Цель: Найти топ-10 товаров по объемам продаж.
-- Построить таблицу, добавить информацию о полученной прибыли по всем странам.

SELECT
    Description, 
    Sum(Quantity) as  Quantity,
    Sum(UnitPrice) as Benefit
FROM default.retail
GROUP BY Description 
ORDER BY Quantity DESC
LIMIT 10