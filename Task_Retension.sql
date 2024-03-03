-- Task_Retension
-- Цель: Вывести когорты по дате первого входа
-- Определить Retension
-- Визуализировать результаты

SELECT
    cohort,
    days_distance,
    uniqExact(DeviceID) as devices
FROM
    (
    SELECT 
        l.AppPlatform               AppPlatform,
        l.events                    events,
        CAST(l.EventDate as Date)   EventDate,
        l.DeviceID                  DeviceID,
        r.birthday                  birthday,
        CAST(l.EventDate as Date) - r.birthday as days_distance
    FROM events AS l
    LEFT JOIN
        (
        SELECT
            DeviceID,
            MIN(CAST(EventDate AS Date)) as birthday
        FROM events
        GROUP BY 1
        ) AS r ON l.DeviceID = r.DeviceID
    )
WHERE 
    days_distance <= 10 AND birthday <= CAST('2019-01-10' AS Date)
-- В параметр WHERE рассмотрим только первые 10 дней января 2019 года для удобства визуализации
GROUP BY
    birthday as cohort,
    days_distance
ORDER BY
    cohort ASC,
    6 ASC
LIMIT 1000

DRAW_HEATMAP
"days_distance.cohort.devices"
