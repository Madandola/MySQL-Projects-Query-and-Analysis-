USE World;
/*Your first step is to determine the total number of cities within the country to provide a baseline for further analysis.*/

SELECT COUNT(*)
FROM city
WHERE CountryCode = (
   SELECT Code
   FROM country
   WHERE Name = 'United States');

/* You've been assigned to identify the country with the highest life expectancy. This information will be crucial for prioritising healthcare resources and interventions.*/

SELECT Name, LifeExpectancy
FROM country
ORDER BY LifeExpectancy DESC
LIMIT 5;

/*You're tasked with swiftly compiling a list of all cities from around the world. */

SELECT Name
FROM city
WHERE Name LIKE '%New%';

/*You're instructed to list only the first 10 cities by population from the database.*/

SELECT Name, Population
FROM city
ORDER BY Population DESC
LIMIT 10;

/*You're tasked with identifying cities from the database with populations exceeding 2 million to focus their research efforts.*/

SELECT Name, Population
FROM city
WHERE Population > 2000000;


/*You're tasked with compiling a list of cities from the database that start with the prefix 'Be' to assist in the blogger's content creation process.*/

SELECT Name
FROM City
WHERE Name LIKE 'Be%';

/*You're tasked with identifying cities with populations ranging between 500,000 and 1 million to inform their decision-making process.*/

SELECT Name, Population
FROM city
WHERE Population BETWEEN 500000 AND 1000000;

/*You're tasked with providing a sorted list of cities from the database in ascending order by name to support the lesson plan.*/

SELECT Name
FROM city
ORDER BY Name ASC;

/*You're tasked with identifying the most populated city from the database to guide their investment decisions and strategic planning.*/
SELECT Name, Population
FROM city
ORDER BY Population DESC;

/*You're tasked with this sorted list to support the geography teacher.*/

SELECT Name AS cityname, COUNT(Name) AS Frequency
FROM city
GROUP BY Name 
ORDER BY Name ASC;

/*You're tasked with identifying the city with the lowest population from the database to provide a comprehensive overview of demographic trends.*/
SELECT Name, Population
FROM city
ORDER BY Population ASC;

/*You're tasked with identifying the country with the highest population from the database to provide valuable insights into demographic trends.*/
SELECT Name, Population
FROM city
ORDER BY Population DESC;

/*You're tasked with identifying the capital of Spain from the database to ensure itinerary accuracy and provide travellers with essential destination information.*/
SELECT Country.Name AS CountryName, city.Name AS CapitalCity
FROM country
JOIN city ON country.Capital = city.ID
WHERE country.Name = 'Spain';

/*You're tasked with compiling a list of cities located in Europe from the database to facilitate program planning and student engagement.*/
SELECT city.Name AS CityName, country.Name AS CountryName
FROM city
JOIN country ON city.CountryCode = country.Code 
WHERE country.Continent = 'Europe'
ORDER BY city.Population DESC;


/* You're tasked with calculating the average population for each country from the database to provide valuable insights into global population trends.*/
SELECT country.Name AS CountryName, AVG(city.Population) AS AverageCityPopulation
FROM city
INNER JOIN country ON city.CountryCode = country.Code
GROUP BY country.Name
ORDER BY AverageCityPopulation DESC;

SELECT AVG(ci.population), co.Name
FROM city AS ci
JOIN country AS co
ON ci.countrycode = co.code
GROUP BY co.Name;


/*You're tasked with comparing the populations of capital cities from different countries to identify trends and patterns in urban demographics.*/
SELECT country.Name AS CountryName, city.Population AS CapitalPopulation, 
Round((city.Population *100 / country.Population), 2) AS PercentageOfCountryPopulation,
ROUND((country.Population / country.SurfaceArea), 2) As CountryPopupaltionDensity
FROM city
JOIN country ON city.ID = country.Capital
ORDER BY city.Population DESC;



/*You're tasked with identifying countries with sparse populations from the database to support the institute's research efforts.*/
SELECT Name AS CountryName, 
Population AS CountryPopulation,
SurfaceArea,
ROUND((Population / SurfaceArea),2) AS PopulationDensity
FROM country
WHERE SurfaceArea > 0 AND Population > 0
ORDER BY PopulationDensity ASC
LIMIT 10;

/*You're tasked with identifying cities with above-average GDP per capita from the database to assist the firm in identifying potential investment destinations.*/
SELECT ci.name, (co.GNP*1000000/co.Population) AS GDP
FROM country AS co
JOIN city as ci
ON co.code = ci.countrycode
WHERE  (co.GNP*1000000/co.Population) > 
(SELECT avg(GNP*1000000/Population)FROM country) 
-- this is a subquery
ORDER BY GDP DESC;


/*You're tasked with providing data on cities ranked between 31st and 40th by population to ensure a thorough understanding of urban demographics.*/
SELECT Name, Population
FROM city
ORDER BY Population DESC
LIMIT 30,10;



