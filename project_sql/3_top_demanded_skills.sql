/*
Question: What are the most in_demand skills for data analysts?
- Join job postings to inner join table similar to query 2.
- Identify the top 5 in_demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrives the top 5 skills with the highest demand in the job market, 
  providing insights into the most valueable skills for job seekers.
*/


SELECT skills,
       count(job_postings_fact.job_id) AS job_count
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
      job_work_from_home = 'True'
GROUP BY skills
ORDER BY job_count DESC
LIMIT 5



/*
Most In-Demand Skills for Data Analysts in Today’s Job Market
Data-related skills dominate: SQL, Python, Tableau, and Power BI all point to high demand for data analysis, data visualization, and data engineering roles.

Excel remains essential: Despite being older tech, Excel’s versatility ensures its continued relevance.

Hybrid skill sets: The top skills suggest employers value professionals who can manage data (SQL), analyze it (Python, Excel), and visualize it (Tableau, Power BI).

[
  {
    "skills": "sql",
    "job_count": "7291"
  },
  {
    "skills": "excel",
    "job_count": "4611"
  },
  {
    "skills": "python",
    "job_count": "4330"
  },
  {
    "skills": "tableau",
    "job_count": "3745"
  },
  {
    "skills": "power bi",
    "job_count": "2609"
  }
]
*/