-- Task_compare_quanity
-- Цель: Сравнить объемы продаж между UK и остальными странами.
-- Построить line chart за весь период.

SELECT
    l.no_month AS no_month,
    l.Quantity AS Quantity_UK,
    r.Quantity AS Quantity_other
FROM 
    (
    SELECT
        toStartOfMonth(InvoiceDate) AS no_month,
        Sum(Quantity) AS Quantity 
    FROM default.retail
    WHERE Country == 'United Kingdom'
    GROUP BY no_month
    ORDER BY Quantity DESC
    LIMIT 20
    ) AS l
join 
    (
    SELECT
        toStartOfMonth(InvoiceDate) AS no_month,
        Sum(Quantity) AS Quantity 
    FROM default.retail
    WHERE Country != 'United Kingdom'
    GROUP BY no_month
    ORDER BY Quantity DESC
    LIMIT 20
    ) AS r
    ON l.no_month = r.no_month
LIMIT 20