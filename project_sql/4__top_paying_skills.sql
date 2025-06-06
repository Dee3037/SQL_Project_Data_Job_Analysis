/*
Question: What are the top skills based on salary?
- Look at the averange salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve.
*/

WITH skill_salary AS (
    SELECT
        skills_dim.skills,
        Round (AVG(job_postings_fact.salary_year_avg), 0)AS avg_salary
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location = 'Anywhere'
        AND job_work_from_home = 'True'
    GROUP BY
        skills_dim.skills
)
SELECT * FROM skill_salary
ORDER BY avg_salary DESC
LIMIT 25;

/*
Here is a breakdown of the results of top-paying skills for Data Analysts in 2023:
Big Data & ML Tools Drive High Salaries: Top-paying roles value skills in [PySpark, Databricks, Jupyter, scikit-learn, Pandas, DataRobot] for handling large-scale data and advanced analytics.

Developement and Operations(DevOps) & Engineering Crossover is Lucrative: Experience with [GitLab, Bitbucket, Kubernetes, Jenkins] adds value by enabling deployment, automation, and collaboration.

Cloud Skills Remain in High Demand: Platforms like [GCP, Airflow] show that cloud-native data expertise continues to command strong salaries.

[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]
*/





