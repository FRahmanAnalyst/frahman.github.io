USE [Bike Share];


SELECT TOP 100 * FROM Trips_2019_all_quarters;

SELECT TOP 100
start_time,
DATENAME(dw, start_time) AS 'day_of_week', 
DATEPART(dw, start_time) AS 'day_no',
DATENAME(MONTH, start_time) AS 'month',
DATEPART(MONTH, start_time) AS 'month_no'
FROM Trips_2019_all_quarters;

--Number of trips each day of the week
SELECT DATEPART(dw, start_time) AS day_no, DATENAME(dw, start_time) AS day_of_week, COUNT(trip_id) AS no_trips 
FROM Trips_2019_all_quarters
GROUP BY DATEPART(dw, start_time), DATENAME(dw, start_time)
ORDER BY day_no;


--Number of trips each month
SELECT DATENAME(MONTH, start_time) AS 'month', COUNT(trip_id) AS no_trips 
FROM Trips_2019_all_quarters
GROUP BY DATENAME(MONTH, start_time), DATEPART(MONTH, start_time)
ORDER BY DATEPART(MONTH, start_time);



--Average trip duration by month
SELECT DATENAME(MONTH, start_time) AS 'month', ROUND((AVG(tripduration)/60),2) AS average_tripduration
FROM Trips_2019_all_quarters
GROUP BY DATENAME(MONTH, start_time), DATEPART(MONTH, start_time)
ORDER BY DATEPART(MONTH, start_time);

--Number of trips each day of the week by usertype
SELECT DATEPART(dw, start_time) AS day_no, DATENAME(dw, start_time) AS day_of_week, usertype, COUNT(trip_id) AS no_trips 
FROM Trips_2019_all_quarters
GROUP BY DATEPART(dw, start_time), DATENAME(dw, start_time), usertype
ORDER BY day_no;


SELECT usertype, DATEPART(dw, start_time) AS day_no, DATENAME(dw, start_time) AS day_of_week, COUNT(trip_id) AS no_trips 
FROM Trips_2019_all_quarters
GROUP BY usertype, DATEPART(dw, start_time), DATENAME(dw, start_time)
ORDER BY usertype, day_no;

--Average trip duration by weekday
SELECT DATENAME(dw, start_time) AS day_of_week, ROUND((AVG(tripduration)/60),2) AS average_tripduration
FROM Trips_2019_all_quarters
GROUP BY DATENAME(dw, start_time), DATEPART(dw, start_time)
ORDER BY DATEPART(dw, start_time);


SELECT TOP 10 trip_id, round((tripduration/60),2) 
FROM Trips_2019_all_quarters
ORDER BY tripduration DESC;


SELECT * FROM Trips_2019_all_quarters
WHERE trip_id = 21920842;