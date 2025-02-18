-- View the data in the table
SELECT Distinct *
From students.dbo.students;

-- Checking for Null values
SELECT *
FROM students.dbo.students
WHERE inter_dom IS NULL
AND todep IS NULL
AND tosc IS NULL
AND toas IS NULL;

-- Update Null Values
UPDATE students.dbo.students
SET internet = CASE WHEN internet IS NULL THEN 0 
ELSE internet
END;

-- Delete Rows with Null Values
DELETE TOP (18)
FROM students.dbo.students
WHERE apd IS NULL;

-- International students vs Domestic students average depression scores
SELECT 
    inter_dom, english_cate,
    AVG(todep) AS avg_depression
FROM students.dbo.students
GROUP BY inter_dom, english_cate;

--Are international students with both low English and Japanese proficiency at the highest risk of depression?
SELECT 
english_cate, japanese_cate,
AVG(todep) AS avg_depression
FROM students.dbo.students
WHERE english_cate IS NOT NULL
AND japanese_cate IS NOT NULL
AND todep IS NOT NULL
GROUP BY english_cate, japanese_cate
ORDER BY english_cate, japanese_cate;

-- Does longer stay reduce stress or improve social connections
SELECT stay AS total_stay_in_host_country,
AVG(toas) AS avg_stress,
AVG(tosc) AS avg_social_connectedness,
AVG(todep) AS avg_depression
FROM students.dbo.students
WHERE inter_dom = 'inter'
GROUP BY stay
ORDER BY stay DESC;

-- Impact of english proficiency on stress and depression
SELECT DISTINCT 
english_cate,
AVG(toas) AS avg_stress,
AVG(todep) AS avg_dep
FROM students.dbo.students
WHERE inter_dom = 'inter'
GROUP BY english_cate
ORDER BY avg_stress DESC;

--Impact of academic level and length of stay on stress and depression

SELECT academic, stay_cate,
AVG(toas) AS avg_stress,
AVG(todep) AS avg_dep
FROM students.dbo.students
WHERE inter_dom = 'inter'
GROUP BY academic, stay_cate
ORDER BY avg_stress, academic;

-- Average depression score for international and domestic students
SELECT inter_dom AS student_type,
AVG(todep) AS avg_depression,
COUNT(*) AS student_count
FROM students.dbo.students
GROUP BY inter_dom;

-- Compare mental health metric for undergraduate vs graduate students
SELECT academic, inter_dom,
AVG(todep) AS avg_depression,
AVG(tosc) AS avg_soial_connectedness,
AVG(toas) AS avg_stress
FROM students.dbo.students
WHERE inter_dom = 'inter'
GROUP BY academic, inter_dom;

-- Does better language skills and length of stay reduce stress over time
SELECT stay AS total_years_in_host_country,
japanese_cate AS language_proficiency,
AVG(toas) AS avg_stress,
COUNT(*) AS student_count
FROM students.dbo.students
WHERE inter_dom = 'inter'
GROUP BY stay, japanese_cate
HAVING COUNT(*) > 2
ORDER BY student_count;

-- Total count of international students
SELECT COUNT(*) AS inter_students
FROM students.dbo.students
WHERE inter_dom = 'inter'

-- Track Stress Trends by Language Proficiency and Stay Duration
SELECT stay AS years_in_host_country,
english_cate AS english_proficiency,
AVG(toas) AS avg_stress,
COUNT(*) AS student_count
FROM students.dbo.students
WHERE inter_dom = 'inter'
GROUP BY stay, english_cate
Having COUNT(*) > 2
ORDER BY stay, english_cate;

-- Do younger students (<25) with low social connectedness (tosc < 30) have higher depression rates than older peers?
SELECT age,
CASE WHEN age < 25 THEN '<25' ELSE '25+' END AS age_group,
AVG(todep) AS avg_depression
FROM students.dbo.students
WHERE tosc < 30
GROUP BY age;

--Are female students more likely to report higher stress (toas) and (todep) than male students?
SELECT gender, 
AVG(toas) AS avg_stress,
AVG(todep) AS avg_depression
FROM students.dbo.students
WHERE gender IS NOT NULL
GROUP BY gender;

--Does high social connectedness (tosc > 30) mitigate the impact of low language skills on stress?
SELECT english_cate,
AVG(toas) AS avg_stress
FROM students.dbo.students
WHERE tosc > 30


