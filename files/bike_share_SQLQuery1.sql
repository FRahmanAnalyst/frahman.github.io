

SELECT TOP 50 * FROM Divvy_Trips_2019_Q2
WHERE tripduration LIKE '"%'


SELECT * FROM Divvy_Trips_2019_Q2
WHERE tripduration NOT LIKE '"%'


SELECT end_time, start_time, (end_time - start_time) AS time_interval 
FROM Divvy_Trips_2019_Q2
WHERE trip_id = 22178529;


SELECT * FROM Divvy_Trips_2019_Q2
WHERE trip_id = 22178530;

select 
trip_id,
round((((((CONVERT (float, end_time, 120))-(CONVERT (float, start_time, 120)))*24*60*60))), 1),
tripduration 
from Divvy_Trips_2019_Q2
WHERE trip_id = 22178529;


 




