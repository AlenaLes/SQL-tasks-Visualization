-- Task_top_countries
-- Цель: Найти топ-10 стран по объемам продаж.
-- Построить line chart за весь период.

SELECT
    Country,
    toStartOfMonth(InvoiceDate) as no_month,
    Sum(Quantity) as  Quantity 
FROM default.retail
WHERE 
    Country IN ('Netherlands', 'EIRE', 'Germany', 'France', 'Australia', 'Sweden', 'Norway', 'Switzerland', 'Japan', 'Spain')
    AND no_month IN ('2011-07-01', '2011-08-01', '2011-09-01', '2011-10-01', '2011-11-01')
GROUP BY Country, no_month
ORDER BY Quantity DESC