USE [Bike Share];



SELECT TOP 100 * FROM Trips_2019_all_quarters;


--Number of trips by age groups (birthyear)
SELECT birthyear, COUNT(trip_id) AS no_trips 
FROM Trips_2019_all_quarters
WHERE birthyear > 1930
GROUP BY birthyear
ORDER BY birthyear;

--Number of trips by age groups (birthyear)  and usertype
SELECT birthyear, usertype, COUNT(trip_id) AS no_trips 
FROM Trips_2019_all_quarters
WHERE birthyear > 1940
GROUP BY birthyear, usertype 
ORDER BY birthyear, usertype;

--Number of trips by gender -> Males = 2400820, Females = 857978, No data = 559206
SELECT gender, COUNT(trip_id) AS no_trips 
FROM Trips_2019_all_quarters
GROUP BY gender
ORDER BY no_trips;

--Number of types of usertypes
SELECT usertype, COUNT(trip_id) AS no_trips 
FROM Trips_2019_all_quarters
GROUP BY usertype;

--Number of types of usertypes, by gender
SELECT usertype, gender, COUNT(trip_id) AS no_trips 
FROM Trips_2019_all_quarters
--WHERE gender NOT IN ('NULL')
GROUP BY usertype, gender
ORDER BY usertype;


--Most used start_stations
SELECT from_station_id, from_station_name, COUNT(trip_id) AS no_trips
FROM Trips_2019_all_quarters
GROUP BY from_station_id, from_station_name
ORDER BY no_trips DESC;

--Average trip duration by start stations
SELECT from_station_id, from_station_name, ROUND((AVG(tripduration)/60),2) AS average_tripduration, COUNT(trip_id) AS no_trips
FROM Trips_2019_all_quarters
GROUP BY from_station_id, from_station_name
ORDER BY average_tripduration DESC;

--Most used start_stations by usertype
SELECT usertype, from_station_id, from_station_name, COUNT(trip_id) AS no_trips
FROM Trips_2019_all_quarters
GROUP BY usertype, from_station_id, from_station_name
ORDER BY usertype, no_trips DESC;

--Average tripduration by usertype
SELECT usertype, ROUND((AVG(tripduration)/60),2) AS average_tripduration
FROM Trips_2019_all_quarters
GROUP BY usertype
ORDER BY usertype;

--Average tripduration by gender
SELECT gender, ROUND((AVG(tripduration)/60),2) AS average_tripduration
FROM Trips_2019_all_quarters
GROUP BY gender
ORDER BY gender;


--Number of Null values for gender by usertype
SELECT usertype, COUNT(trip_id) AS no_null_values 
FROM Trips_2019_all_quarters
WHERE (gender = 'NULL')
GROUP BY usertype
ORDER BY usertype;

--Number of Null values for birthyear by usertype 
SELECT usertype, COUNT(trip_id) AS no_null_values 
FROM Trips_2019_all_quarters
WHERE (birthyear = 'NULL')
GROUP BY usertype
ORDER BY usertype;