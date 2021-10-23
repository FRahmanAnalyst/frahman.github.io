-- Use Covid-19 database
USE Covid19_Canada;

------------------------------------------------------------------------------------------------------------
--Table to be used in this script 
SELECT * FROM prov_map
SELECT * FROM cases_timeseries_prov
SELECT * FROM mortality_timeseries_prov
SELECT * FROM vaccine_administration_timeseries_prov
SELECT * FROM vaccine_completion_timeseries_prov


------------------------------------------------------------------------------------------------------------
--Joining the tables
--Columns-> province, province_short, population, date_report(cases), month_no, cases, deaths, avaccine, cumulative_avaccine
--Extracted month number from date string to be used later in analysis in python
--Joined the tables on both dates and provinces and excluded 'Repatriated'

DROP VIEW IF EXISTS covid_combined 

CREATE VIEW covid_combined AS 
(
SELECT p.province, p.province_short, p.pop, c.date_report, SUBSTRING(date_report, 4, 2) AS month_no, c.cases, m.deaths, v.avaccine, v.cumulative_avaccine, vc.cumulative_cvaccine
FROM cases_timeseries_prov c
JOIN prov_map p
ON p.province = c.province 
FULL JOIN mortality_timeseries_prov m
ON (m.date_death_report = c.date_report) AND (m.province = c.province)
FULL JOIN vaccine_administration_timeseries_prov v
ON (v.date_vaccine_administered = c.date_report) AND (v.province = c.province)
FULL JOIN vaccine_completion_timeseries_prov vc
ON (vc.date_vaccine_completed = c.date_report) AND (vc.province = c.province)
WHERE pop IS NOT NULL
)

--Check for duplicated
SELECT COUNT (*) FROM covid_combined
SELECT COUNT (*) FROM cases_timeseries_prov WHERE province != 'Repatriated'

------------------------------------------------------------------------------------------------------------
--Display results for export
--Replaced Null values with 0

SELECT * FROM covid_combined
SELECT DISTINCT month_no FROM covid_combined
SELECT DISTINCT cases FROM covid_combined WHERE cases IS NULL

SELECT 
province,
province_short,
pop, 
date_report, 
month_no,
cases,
ISNULL(deaths, 0) AS deaths,
ISNULL(avaccine, 0) AS vaccinations,
ISNULL(cumulative_avaccine, 0) AS cum_total_vaccinations,
ISNULL(cumulative_cvaccine, 0) AS cum_com_vaccinations
FROM covid_combined






