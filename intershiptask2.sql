use project1;

SELECT *
FROM `corona virus dataset (1)`
WHERE Date  NULL;


UPDATE `corona virus dataset (1)`
SET Province = IFNULL(Province, 0),
Latitude = IFNULL(Latitude, 0)
WHERE Province IS NULL ;


SELECT COUNT(*) FROM `corona virus dataset (1)`;


SELECT DISTINCT start_date, end_date FROM `corona virus dataset (1)` LIMIT 0, 1000;




SELECT COUNT(DISTINCT MONTH(Date)) AS num_months FROM `corona virus dataset (1)`;



SELECT COUNT(DISTINCT MONTH(Date)) AS num_months 
FROM `corona virus dataset (1)`;


SELECT 
    MONTH(Date) AS month,
    AVG(Confirmed) AS avg_confirmed,
    AVG(Deaths) AS avg_deaths,
    AVG(Recovered) AS avg_recovered
FROM 
    `corona virus dataset (1)`
GROUP BY 
    MONTH(Date);



WITH monthly_stats AS (
    SELECT 
        MONTH(Date) AS month,
        confirmed,
        deaths,
        recovered,
        ROW_NUMBER() OVER (PARTITION BY MONTH(Date) ORDER BY COUNT(*) DESC) AS rn
    FROM 
        `corona virus dataset (1)`
    GROUP BY 
        MONTH(Date), confirmed, deaths, recovered)
SELECT 
    month,
    confirmed AS most_frequent_confirmed,
    deaths AS most_frequent_deaths,
    recovered AS most_frequent_recovered
FROM 
    monthly_stats
WHERE 
    rn = 1;


SELECT 
    YEAR(Date) AS year,
    MIN(confirmed) AS min_confirmed,
    MIN(deaths) AS min_deaths,
    MIN(recovered) AS min_recovered
FROM 
    `corona virus dataset (1)`
GROUP BY 
    YEAR(Date);



SELECT 
    YEAR(Date) AS year,
    MAX(confirmed) AS max_confirmed,
    MAX(deaths) AS max_deaths,
    MAX(recovered) AS max_recovered
FROM 
    `corona virus dataset (1)`
GROUP BY 
    YEAR(Date);
    
    
SELECT 
    MONTH(Date) AS month,
    SUM(Confirmed) AS total_confirmed,
    SUM(Deaths) AS total_deaths,
    SUM(Recovered) AS total_recovered
FROM 
    `corona virus dataset (1)`
GROUP BY 
    MONTH(Date);
    


SELECT 
    SUM(Confirmed) AS total_confirmed_cases,
    AVG(Confirmed) AS average_confirmed_cases,
    VARIANCE(Confirmed) AS variance_confirmed_cases,
    STDDEV(Confirmed) AS stddev_confirmed_cases
FROM 
    `corona virus dataset (1)`;

    
SELECT 
    YEAR(Date) AS year,
    MONTH(Date) AS month,
    SUM(Deaths) AS total_death_cases,
    AVG(Deaths) AS average_death_cases,
    VARIANCE(Deaths) AS variance_death_cases,
    STDDEV(Deaths) AS stddev_death_cases
FROM 
    `corona virus dataset (1)`
GROUP BY 
   YEAR(Date), MONTH(Date);
    
    
SELECT 
    YEAR(Date) AS year,
    MONTH(Date) AS month,
    SUM(Confirmed) AS total_confirmed_cases,
    AVG(Confirmed) AS average_confirmed_cases,
    VARIANCE(Confirmed) AS variance_confirmed_cases,
    STDDEV(Confirmed) AS stddev_confirmed_cases,
    SUM(Deaths) AS total_death_cases,
    AVG(Deaths) AS average_death_cases,
    VARIANCE(Deaths) AS variance_death_cases,
    STDDEV(Deaths) AS stddev_death_cases
FROM 
    `corona virus dataset (1)`
GROUP BY 
   YEAR(Date), MONTH(Date);


SELECT 
    YEAR(Date) AS year,
    MONTH(Date) AS month,
    SUM(Confirmed) AS total_confirmed_cases,
    AVG(Confirmed) AS average_confirmed_cases,
    VARIANCE(Confirmed) AS variance_confirmed_cases,
    STDDEV(Confirmed) AS stddev_confirmed_cases,
    SUM(Recovered) AS total_recovered_cases,
    AVG(Recovered) AS average_recovered_cases,
    VARIANCE(Recovered) AS variance_recovered_cases,
    STDDEV(Recovered) AS stddev_recovered_cases
FROM 
    `corona virus dataset (1)`
GROUP BY 
    YEAR(Date), MONTH(Date);
    


SELECT `Country/Region`, MAX(Confirm//ed) AS max_confirmed_cases
FROM `corona virus dataset (1)`
GROUP BY `Country/Region`
ORDER BY max_confirmed_cases DESC
LIMIT 1;


SELECT `Country/Region`, MIN(Deaths) AS min_death_cases
FROM `corona virus dataset (1)`
GROUP BY `Country/Region`
ORDER BY min_death_cases ASC
LIMIT 1;


SELECT `Country/Region`, MAX(Recovered) AS max_recovered_cases
FROM `corona virus dataset (1)`
GROUP BY `Country/Region`
ORDER BY max_recovered_cases DESC
LIMIT 5;


