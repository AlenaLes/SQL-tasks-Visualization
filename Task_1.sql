-- Task_1
-- Посчитайте, сколько покупок приходится на каждого клиента, указав имя столбца как NumChecks. 
-- Вывести сумму выручки по каждому клиенту.
-- Результирующую таблицу с UserID, NumChecks отсортируйте по убыванию (DESC) нового столбца. Ограничение вывода – 10.

SELECT
    UserId,
    COUNT (*) as NumChecks,
    SUM (Rub) as Revenue
from checks 
GROUP BY 1
order by 2 desc
limit 10