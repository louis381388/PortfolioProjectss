SELECT *
FROM [Portfolio Projects]..['covid-deaths$']
ORDER BY 3,4;
-- Checked data to ensure complete import
--SELECT data to be used
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM [Portfolio Projects]..['covid-deaths$']
ORDER BY 1,2

--Looking at total cases vs total deaths
--Shows the likelihood of dying from Covid overtime in the US (Jan 28,2020 - Jun 28,2021)
SELECT Location, total_cases AS Total_Amount_Cases, (total_deaths/total_cases)*100 AS Death_Percentage_of_Total_cases
FROM [Portfolio Projects]..['covid-deaths$']
WHERE Location LIKE '%states%'
ORDER BY 1,2 DESC

--looking at total cases vs total population
--shows what percentage of population got covid in the US (JAN 28,2020 - Jun 28,2021)
SELECT Location, total_cases,population, (total_cases/population)*100 AS Case_Percentage_of_Population
FROM [Portfolio Projects]..['covid-deaths$']
WHERE Location LIKE '%states%' AND continent is not null
ORDER BY 1,2 DESC

-- Looking at country with highest infection rate compared to population
SELECT Location, MAX(total_cases) AS Total_Amount_Cases_to_date,MAX(population) AS population_to_date, (MAX(total_cases)/MAX(population))*100 AS Infection_Percentage
FROM [Portfolio Projects]..['covid-deaths$']
WHERE continent is not null
GROUP BY Location
ORDER BY Infection_Percentage DESC
-- As of Jun 28,2021, Andorra has the highest infection rate comparted to population with 17.966737%
-- 31 countries did not have sufficient data to be included.

-- Looking at country with highest death rate compared to population
SELECT Location, MAX(CAST(total_deaths AS int)) AS Total_Amount_Deaths_to_date,MAX(population) AS population_to_date, (MAX(CAST(total_deaths AS int))/MAX(population))*100 AS Death_Rate
FROM [Portfolio Projects]..['covid-deaths$']
WHERE continent is not null
GROUP BY Location
ORDER BY Death_Rate DESC

--Looking at continents with highest death counts
SELECT location, MAX(CAST(total_deaths AS int)) AS Total_deaths_to_date
FROM [Portfolio Projects]..['covid-deaths$']
WHERE continent is null
GROUP BY continent,location
ORDER BY Total_deaths_to_date DESC
--Shows that Europe currently has the highest amount of deaths compared to other continents

-- Global numbers
SELECT date, SUM(new_cases) AS total_cases_in_date, SUM(CAST(new_deaths AS int)) AS total_deaths_in_date, (SUM(CAST(new_deaths AS int))/SUM(new_cases))*100 AS percentage_of_deaths_per_case
FROM [Portfolio Projects]..['covid-deaths$']
WHERE continent is not null
GROUP BY date
ORDER BY percentage_of_deaths_per_case DESC

--Looking for death percentage for world (JAN 28,2020 - Jun 28,2021)
SELECT SUM(new_cases) AS total_cases_in_date, SUM(CAST(new_deaths AS int)) AS total_deaths_in_date, (SUM(CAST(new_deaths AS int))/SUM(new_cases))*100 AS percentage_of_deaths_per_case
FROM [Portfolio Projects]..['covid-deaths$']
WHERE continent is not null
ORDER BY percentage_of_deaths_per_case DESC

-- joining two tables to see total Population vs vaccination
--creating a rolling count of new vaccination
SELECT deaths.continent, deaths.location, population,vacs.new_vaccinations,deaths.date,
SUM(CAST(vacs.new_vaccinations AS int)) OVER (PARTITION BY deaths.location ORDER BY deaths.location,deaths.date) AS Rolling_Count_of_vaccination

FROM [Portfolio Projects]..['covid-deaths$'] deaths
FULL OUTER JOIN
 [Portfolio Projects]..['covid-vaccinations$'] vacs
 ON deaths.location = vacs.location
  AND deaths.date = vacs.date
WHERE deaths.continent is not null
ORDER BY 2,3

--USE CTE to show rolling percentage of vaccination 
WITH Population_VS_Vaccination (continent,location,population,new_vaccinations,date,Rolling_Count_of_vaccination) AS 
(
SELECT deaths.continent, deaths.location,deaths.population,vacs.new_vaccinations,deaths.date,
SUM(CAST(vacs.new_vaccinations AS int)) OVER (PARTITION BY deaths.location ORDER BY deaths.location,deaths.date) AS Rolling_Count_of_vaccination
FROM [Portfolio Projects]..['covid-deaths$'] deaths
FULL OUTER JOIN
 [Portfolio Projects]..['covid-vaccinations$'] vacs
 ON deaths.location = vacs.location
  AND deaths.date = vacs.date
WHERE deaths.continent is not null
)
SELECT*, (Rolling_Count_of_vaccination/population)*100
FROM Population_VS_Vaccination


--USE temp table
DROP TABLE IF EXISTS #PercentPopVaccinated
CREATE TABLE #PercentPopVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
Rolling_Count_of_vaccination numeric
)

INSERT INTO #PercentPopVaccinated
SELECT deaths.continent, deaths.location,deaths.date, deaths.population,vacs.new_vaccinations,
SUM(CAST(vacs.new_vaccinations AS bigint)) OVER (PARTITION BY deaths.location ORDER BY deaths.location,deaths.date) AS Rolling_Count_of_vaccination
FROM [Portfolio Projects]..['covid-deaths$'] deaths
JOIN
 [Portfolio Projects]..['covid-vaccinations$'] vacs
 ON deaths.location = vacs.location
  AND deaths.date = vacs.date


SELECT *,(Rolling_Count_of_vaccination/population)*100
FROM #PercentPopVaccinated

--Creating View to store data for visualization
CREATE VIEW populationview1 AS
SELECT deaths.continent, deaths.location,deaths.date, deaths.population,vacs.new_vaccinations,
SUM(CAST(vacs.new_vaccinations AS bigint)) OVER (PARTITION BY deaths.location ORDER BY deaths.location,deaths.date) AS Rolling_Count_of_vaccination
FROM [Portfolio Projects]..['covid-deaths$'] deaths
JOIN
 [Portfolio Projects]..['covid-vaccinations$'] vacs
 ON deaths.location = vacs.location
  AND deaths.date = vacs.date
WHERE deaths.continent is not null