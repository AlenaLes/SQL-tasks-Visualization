-- Task_compare_clients
-- Цель: Сравнить приток клиентов между UK и остальными странами.
-- Построить line chart за весь период.

SELECT
    l.no_day AS no_day,
    l.CustomerID AS CustomerID_UK,
    r.CustomerID AS CustomerID_others
FROM 
    (
    SELECT
        Count(CustomerID) AS CustomerID,
        toStartOfDay(InvoiceDate) AS no_day
    FROM default.retail
    WHERE Country == 'United Kingdom' AND toStartOfMonth(InvoiceDate) == '2011-11-01'
    GROUP BY no_day
    ) AS l
JOIN
    (
    SELECT
        Count(CustomerID) AS CustomerID,
        toStartOfDay(InvoiceDate) AS no_day
    FROM default.retail
    WHERE Country != 'United Kingdom' AND toStartOfMonth(InvoiceDate) == '2011-11-01'
    GROUP BY no_day
    ) AS r
    ON l.no_day = r.no_day
LIMIT 30