create database jobs;
use jobs;
 CREATE TABLE job_data (
    ds DATE,
    job_id INT NOT NULL,
    actor_id INT NOT NULL,
    event VARCHAR(15) NOT NULL,
    language VARCHAR(15) NOT NULL,
    time_spent INT NOT NULL,
    org CHAR(2)
);
INSERT INTO job_data (ds, job_id, actor_id, event, language, time_spent, org)
VALUES ('2020-11-30', 21, 1001, 'skip', 'English', 15, 'A'),
('2020-11-30', 22, 1006, 'transfer', 'Arabic', 25, 'B'),
('2020-11-29', 23, 1003, 'decision', 'Persian', 20, 'C'),
('2020-11-28', 23, 1005,'transfer', 'Persian', 22, 'D'),
('2020-11-28', 25, 1002, 'decision', 'Hindi', 11, 'B'),
('2020-11-27', 11, 1007, 'decision', 'French', 104, 'D'),
('2020-11-26', 23, 1004, 'skip', 'Persian', 56, 'A'),
('2020-11-25', 20, 1003, 'transfer', 'Italian', 45, 'C');

select * from job_data;

SELECT ds, ROUND(COUNT(job_id) * 3600 / SUM(time_spent)) as jobs_per_hr FROM
job_data WHERE MONTH(ds) = 11 GROUP BY ds order by ds;

SELECT ROUND(avg(throughput),4) as Weekly_Throughput from (select ds, (COUNT(event) / SUM(time_spent))
 as throughput from job_data GROUP BY ds) throughtput_calc;
 
 select ds, ROUND((COUNT(event) / SUM(time_spent)),4) as Day_Throughput from job_data group by ds;
 
SELECT language as `Languages`, (COUNT(language) * 100.0 / total_languages) AS Percentage
FROM job_data, (SELECT COUNT(DISTINCT language) AS total_languages FROM job_data) AS subquery
GROUP BY language, subquery.total_languages;

WITH DuplicateJobIDs AS (
    SELECT 'job' AS TYPE, job_id AS 'DUPLICATE_VALUE', COUNT(job_id) AS ROW_COUNT
    FROM job_data GROUP BY job_id HAVING COUNT(*) > 1
),
DuplicateActorIDs AS (
    SELECT 'actor' AS TYPE, actor_id AS 'DUPLICATE_VALUE', COUNT(actor_id) AS ROW_COUNT
    FROM job_data GROUP BY actor_id HAVING COUNT(*) > 1
)
SELECT TYPE, DUPLICATE_VALUE, ROW_COUNT FROM DuplicateJobIDs
UNION ALL 
SELECT TYPE, DUPLICATE_VALUE, ROW_COUNT FROM DuplicateActorIDs;












