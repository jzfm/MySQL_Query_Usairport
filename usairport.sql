-- Selecting the database
USE usairlineflights;
-- 1) Registers quantity
SELECT COUNT(*) 
FROM flights;
-- 2) Departure and arrival delay order by departure airport
SELECT Origin, avg(ArrDelay) AS Arrival_delay, avg(DepDelay) AS Departure_Delay
FROM flights 
GROUP BY Origin;
-- 3) Average arrival delay grouped by month and airport in the order AIRPORT/year/month/delay
SELECT origin AS Airport, colYear AS year1, colMonth AS month1, avg(ArrDelay) AS Delay 
FROM flights 
GROUP BY airport, month1, year1
ORDER BY Airport;
-- 4) Average arrival delay grouped by month and airport in the order AIRPORT/year/month/delay but airport must show the city name
SELECT usairports.city AS city, colYear AS year1, colMonth AS month1, avg(ArrDelay) AS Delay 
FROM flights 
INNER JOIN usairports ON flights.Origin = usairports.IATA 
GROUP BY city, month1, year1
ORDER BY city;
-- 5) The companies with the most cancel flights overall ordered from highest to lowest
SELECT carriers.Description AS Company_name, SUM(flights.Cancelled) AS Cancel_flights 
FROM flights 
INNER JOIN carriers ON flights.UniqueCarrier = carriers.CarrierCode
GROUP BY Company_name 
ORDER BY flights.Cancelled DESC;
-- 6) Average delay from companies with arrival dealys over 10 minutes
SELECT carriers.Description AS Company_name, AVG(flights.ArrDelay) AS Average_delay 
FROM flights 
INNER JOIN carriers ON flights.UniqueCarrier = carriers.CarrierCode 
GROUP BY company_name
HAVING Average_delay > 10;
-- 7) ID from the top 10 planes with most flight time
SELECT carriers.CarrierCode AS carrier, flights.Distance AS miles
FROM flights 
INNER JOIN carriers ON flights.UniqueCarrier = carriers.CarrierCode 
ORDER BY flights.AirTime DESC limit 10;