--Count Number of entries in each table
--2019 Q1 -> 365,069 (No duplicates compared against distinct trip_id and no null values for trip_id)
SELECT COUNT(*) FROM Divvy_Trips_2019_Q1;
SELECT COUNT(DISTINCT trip_id) FROM Divvy_Trips_2019_Q1;
SELECT * FROM Divvy_Trips_2019_Q1 WHERE trip_id IS NULL;

--2019 Q2 -> 1,108,163 (No duplicates compared against distinct trip_id and no null values for trip_id))
SELECT COUNT(*) FROM Divvy_Trips_2019_Q2;
SELECT COUNT(DISTINCT trip_id) FROM Divvy_Trips_2019_Q2;
SELECT * FROM Divvy_Trips_2019_Q2 WHERE trip_id IS NULL;

--2019 Q3 -> 1,640,718 (No duplicates compared against distinct trip_id and no null values for trip_id))
SELECT COUNT(*) FROM Divvy_Trips_2019_Q3;
SELECT COUNT(DISTINCT trip_id) FROM Divvy_Trips_2019_Q3;
SELECT * FROM Divvy_Trips_2019_Q3 WHERE trip_id IS NULL;

--2019 Q4 -> 704,054 (No duplicates compared against distinct trip_id and no null values for trip_id))
SELECT COUNT(*) FROM Divvy_Trips_2019_Q4;
SELECT COUNT(DISTINCT trip_id) FROM Divvy_Trips_2019_Q4;
SELECT * FROM Divvy_Trips_2019_Q4 WHERE trip_id IS NULL;

--Total number of rows in all 4 tables -> 365,069 + 1,108,163 + 1,640,718 + 704,054 = < 3,818,004 >
--Needs to be figured out


--No duplicates or null values in trip_id in combined table 
SELECT COUNT(*) FROM Trips_2019_all_quarters;
SELECT COUNT(DISTINCT trip_id) FROM Trips_2019_all_quarters;
SELECT * FROM Trips_2019_all_quarters WHERE trip_id IS NULL;