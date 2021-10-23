USE [Bike Share]

CREATE VIEW combine_tables AS 
(
(SELECT * FROM Divvy_Trips_2019_Q1)
UNION
(SELECT * FROM Divvy_Trips_2019_Q2)
UNION
(SELECT * FROM Divvy_Trips_2019_Q3)
UNION
(SELECT * FROM Divvy_Trips_2019_Q4)
)



SELECT TOP 50 * FROM Trips_2019_all_quarters;


CREATE VIEW trial_combine AS 
(
(SELECT TOP 100 * FROM Divvy_Trips_2019_Q1)
UNION
(SELECT TOP 100 * FROM Divvy_Trips_2019_Q2)
)




SELECT
trip_id,
start_time,
end_time,
bikeid,
tripduration,
from_station_id,
from_station_name,
to_station_id,
to_station_name,
usertype,
ISNULL(gender, '') AS gender,
ISNULL(birthyear, '') AS birthyear
FROM combine_tables
;
