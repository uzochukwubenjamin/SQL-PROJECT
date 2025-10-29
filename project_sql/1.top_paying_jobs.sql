SELECT
    job_id,
    job_location,
    job_title,
    job_schedule_type,
    salary_year_avg,
    name AS company_name,
    job_posted_date::DATE AS posted_date 
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title = 'Data Analyst' AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
