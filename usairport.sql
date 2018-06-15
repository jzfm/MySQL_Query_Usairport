-- Registers quantity
SELECT COUNT(*) FROM flights;
-- Departure and arrival delay order by departure airport
SELECT avg(ArrDelay) AS Arrival_delay, avg(DepDelay) AS Departure_Delay, Origin FROM flights GROUP BY Origin;
-- Average arrival delay grouped by month and airport in the order AIRPORT/year/month/delay
SELECT origin AS Airport, colYear AS year1, colMonth AS month1, avg(ArrDelay) AS Delay FROM flights group by airport, month1, year1;
-- Average arrival delay grouped by month and airport in the order AIRPORT/year/month/delay but airport must show the city name
SELECT usairports.city AS city, colYear AS year1, colMonth AS month1, avg(ArrDelay) AS Delay FROM flights INNER JOIN 
usairports ON flights.Origin = usairports.IATA group by city, month1, year1;
-- The companies with the most cancel flights overall ordered from highest to lowest
SELECT carriers.Description AS Company_name, flights.Cancelled AS Cancel_flights FROM flights INNER JOIN carriers ON
flights.UniqueCarrier = carriers.CarrierCode order by flights.Cancelled DESC;
-- Average delay from companies with arrival dealys over 10 minutes
SELECT carriers.Description AS Company_name, AVG(flights.ArrDelay) AS Average_delay FROM flights INNER JOIN carriers ON
flights.UniqueCarrier = carriers.CarrierCode WHERE flights.ArrDelay > 10 group by company_name;
-- ID from the top 10 planes with most flight time
SELECT carriers.CarrierCode AS carrier, flights.AirTime AS travel_time FROM flights INNER JOIN carriers ON
flights.UniqueCarrier = carriers.CarrierCode order by flights.AirTime DESC limit 10;