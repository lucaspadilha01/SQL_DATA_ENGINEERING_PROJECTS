/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing
how common those skills are, providing a more complete picture for skill development priorities
*/
SELECT
    sd.skills
    ,
    ROUND(median(salary_year_avg),0) as median_salary
    ,
    count (jpf.*)                    as demand_count
FROM
    job_postings_fact as jpf
INNER JOIN
    skills_job_dim as sjd
ON
    jpf.job_id = sjd.job_id
INNER JOIN
    skills_dim as sd
ON
    sjd.skill_id = sd.skill_id
Where
    jpf.job_title_short    = 'Data Engineer'
and jpf.job_work_from_home = true
group by
    sd.skills
HAVING
    count (jpf.*) > 1000
order by
    median_salary desc
LIMIT 25;
/*
The demand vs. salary tradeoff
Terraform stands out: it pays nearly as well as Rust but has 13x the demand (3,248 postings vs. 232) — by far the most in-demand skill on this list. That combination (high pay + high demand) makes it arguably the strongest skill to have.
Rust and Zoom sit at the opposite extreme: high pay but low demand (232 and 127 postings respectively) — lucrative if you land a role, but fewer roles to land.
GDPR has decent demand (582) at a solid $169.6K, suggesting compliance/privacy expertise is quietly well-compensated.
Narrow salary band
Excluding Rust, the other 9 skills cluster tightly between $157.5K–$184K — only a ~17% spread — suggesting that once you're in this "high-value skill" tier, the specific skill matters less than being in the tier at all.
┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ terraform  │      184000.0 │         3248 │
│ kubernetes │      150500.0 │         4202 │
│ airflow    │      150000.0 │         9996 │
│ kafka      │      145000.0 │         6415 │
│ git        │      140000.0 │         4641 │
│ spark      │      140000.0 │        12799 │
│ pandas     │      140000.0 │         2929 │
│ go         │      140000.0 │         1997 │
│ pyspark    │      140000.0 │         4898 │
│ aws        │      137320.0 │        17823 │
│ scala      │      137290.0 │         6304 │
│ gcp        │      136000.0 │         6446 │
│ dynamodb   │      136000.0 │         1082 │
│ looker     │      136000.0 │         1574 │
│ mongodb    │      135750.0 │         3512 │
│ snowflake  │      135500.0 │         8639 │
│ bigquery   │      135000.0 │         3523 │
│ jenkins    │      135000.0 │         1867 │
│ hadoop     │      135000.0 │         5447 │
│ java       │      135000.0 │         7267 │
│ python     │      135000.0 │        28776 │
│ docker     │      135000.0 │         4316 │
│ github     │      135000.0 │         1987 │
│ r          │      134775.0 │         2336 │
│ nosql      │      134415.0 │         4514 │
└────────────┴───────────────┴──────────────┘


*/