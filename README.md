# Job-Data-Analysis
##  Case Study 1: Job Data Analysis

job_id: Unique identifier of jobs
actor_id: Unique identifier of actor
event: The type of event (decision/skip/transfer).
language: The Language of the content
time_spent: Time spent to review the job in seconds.
org: The Organization of the actor
ds: The date in the format yyyy/mm/dd (stored as text).

## Tasks:
1. Jobs Reviewed Over Time:
Objective: Calculate the number of jobs reviewed per hour for each day in November 2020.
2. Throughput Analysis:
Objective: Calculate the 7-day rolling average of throughput (number of events per second).
3. Language Share Analysis:
Objective: Calculate the percentage share of each language in the last 30 days.
4. Duplicate Rows Detection:
Objective: Identify duplicate rows in the data.
Your Task: Write an SQL query to display duplicate rows from the job_data table.
