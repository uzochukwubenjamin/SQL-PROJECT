
WITH remote_data_analyst_skills AS (
SELECT
    skill_id,
    COUNT(*) AS skill_count
FROM skills_job_dim AS skills_to_jobs
INNER JOIN job_postings_fact AS jobs ON skills_to_jobs.job_id = jobs.job_id
WHERE
    job_work_from_home = TRUE AND 
    job_title = 'Data Analyst'
GROUP BY skill_id
)
SELECT
    skills AS skill_name,
    remote_data_analyst_skills.skill_count,
    skills.skill_id
FROM remote_data_analyst_skills
INNER JOIN skills_dim AS skills ON remote_data_analyst_skills.skill_id = skills.skill_id
ORDER BY
    remote_data_analyst_skills.skill_count DESC
LIMIT 5;