-- WORLD DATA ON POPULATION 

DROP TABLE population_total;
DROP TABLE ItaJap_population CASCADE;
DROP TABLE TotalGDPPerCountry CASCADE;
DROP TABLE ItaJap_GDP CASCADE;

CREATE TABLE population_total(
	country_name TEXT,
	indicator_name TEXT,
	YR_2008 NUMERIC,
	YR_2009 NUMERIC, 
	YR_2010 NUMERIC,
	YR_2011 NUMERIC,
	YR_2012 NUMERIC,
	YR_2013 NUMERIC, 
	YR_2014 NUMERIC,
	YR_2015 NUMERIC,
	YR_2016 NUMERIC,
	YR_2017 NUMERIC,
	YR_2018 NUMERIC
);

SELECT * FROM population_total;
ALTER TABLE population_total ADD PRIMARY KEY(country_name);

-- CREATED TABLE WITH JAPAN & ITALY POPULATION DATA BETWEEN 2008-2018

SELECT * INTO ItaJap_population
FROM population_total
WHERE 
	country_name = 'Japan'
	OR country_name = 'Italy';
	
SELECT * FROM population_total;
SELECT * FROM ItaJap_population;

ALTER TABLE ItaJap_population
ADD CONSTRAINT constraint_fk 
FOREIGN KEY (country_id) 
REFERENCES population_total(country_id);


-- WORLD DATA ON GDP 

DROP TABLE TotalGDPPerCountry;

CREATE TABLE TotalGDPPerCountry(
	country_name TEXT,
	indicator_name TEXT,
	YR_2008 NUMERIC,
	YR_2009 NUMERIC, 
	YR_2010 NUMERIC,
	YR_2011 NUMERIC,
	YR_2012 NUMERIC,
	YR_2013 NUMERIC, 
	YR_2014 NUMERIC,
	YR_2015 NUMERIC,
	YR_2016 NUMERIC,
	YR_2017 NUMERIC,
	YR_2018 NUMERIC
);

ALTER TABLE TotalGDPPerCountry ADD PRIMARY KEY(country_name);

SELECT * FROM TotalGDPPerCountry;

SELECT * INTO ItaJap_GDP
FROM TotalGDPPerCountry
WHERE 
	country_name = 'Japan'
	OR country_name = 'Italy';

SELECT * FROM ItaJap_GDP;

-- add primary key, return indicator 
-- ALTER TABLE ItaJap_GDP
-- ADD CONSTRAINT constraint_fk 
-- FOREIGN KEY (country_id) 
-- REFERENCES TotalGDPPerCountry(country_id);

-- Merge Japan Population & GDP Data 


-- SELECT City, Country FROM Customers
-- WHERE Country='Germany'
-- UNION ALL
-- SELECT City, Country FROM Suppliers
-- WHERE Country='Germany'
-- ORDER BY City;

SELECT *
FROM ItaJap_population
WHERE country_name ='Japan'
UNION
SELECT *
FROM ItaJap_GDP
WHERE country_name ='Japan';

SELECT *
FROM ItaJap_population
WHERE country_name ='Italy'
UNION
SELECT *
FROM ItaJap_GDP
WHERE country_name ='Italy';