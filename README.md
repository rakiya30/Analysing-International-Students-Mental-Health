# Analysing-International-Students-Mental-Health
This repository analyzes data from a 2018 study conducted by a Japanese international university, which found that international students face higher risks of mental health challenges compared to the general population. 

## TABLE OF CONTENTS
-  Project Overview
  
- Dataset Description
  
-  Methodology

- Key Findings
  
- Recommendations
  
- SQL Scripts

- download dataset https://github.com/rakiya30/Analysing-International-Students-Mental-Health/blob/main/students.csv



  ## PROJECT OVERVIEW
This project analyzes mental health metrics (depression, social connectedness, and acculturative stress) of international students at a Japanese university. The goal is to identify risk factors and propose interventions to improve student well-being.  

- key questions that this project aims to answer and provide recommendations

  - Are students with both low and japanese proficiency at the highest risk of depression.
 
  - Does longer stay in host country reduce stress or improve social connections.
 
  - What is the impact on english proficiency on stress and depression.
 
  - Impact of academic level and length of stay on stress and depression.
 
  - Average depresion score for international students.
 
  - Compare mental health metric for undergraduate vs graduate students.
 
  - Does better language skills and length of time reduce stress over time.
 
  - track stress trends by language proficiency and stay duration.
 
  - Do younnger students (<25) with low social connectedness (tosc < 30 ) have higher depression rates than older peers.
 
  - Are female students more likely to report higher stress (toas) and (todep) than male students.
 
  - Does high social connectedness (tosc > 30) mitigate the impact of low language skills on stress.
 
    ## DATASET DESCRIPTION

  The dataset contains survey responses from 268 students (201 international, 68 domestic) collected in 2018 by a japanese university. The dataset has a total of 50 columns with 268 rows, however for this analysis we used only eight columnns relevant to the questions that this project aims to answer. Here is a description of the columms:
   
  
 
    - inter_dom  -   Types of students(international or domestic)
   
    - japanese_cate - japanese language proficiency
   
    - english_cate - English language proficiency
   
    - academic - Current academic level undergraduate or graduate
   
    - age   -   Current age of students
   
    - stay -  Current length of stay in years
   
    - todep - Total score of social connectedness (scs) test
   
    - toas  - Total score of acculturative stress
 
  ## METHODOLOGY

  Data Collection & Preparation

  Source: The dataset was downloaded from DataCamp and originates from a 2018 survey of international and domestic students at a Japanese university, approved by ethical review boards.

  Tools:

  Excel: Initial exploration and validation of raw data.

  SQL Server: Data cleaning, Exploratory data analysis.


 ## PROCESS

1. Data Cleaning: Removed 18 rows with missing values, updated Null with 0 in critical columns.  
 
2. Aggregation: Calculated average scores for depression, stress, and social connectedness.
    
3. Segmentation: Analyzed trends by language proficiency, academic level, and stay duration.  


  ## KEY FINDINGS

1. Domestic VS International Students average depression scores
   
The results did not reveal any difference in depression scores between International and Domestic students as they both reported an average of 8. Investigating further using english proficiency, the data revealed that International students with high english proficiency reported a lower depression score of 7 compare to their japanese colleagues.

SELECT 
    inter_dom,
    
    AVG(todep) AS avg_depression
    
   FROM students.dbo.students
   
   GROUP BY inter_dom;


   
 ![International vs domestic](https://github.com/user-attachments/assets/bde61134-05e2-4687-b8c8-c2fbe0caa40a)


![inter-dom-english_cate](https://github.com/user-attachments/assets/e201cc2b-8b3a-4fec-a850-5d641b7c5972)



2. Are international students with both low English and Japanese proficiency at the highest risk of depression?
   The results revealead that students with low english and japanese proficiency are not at the highest risk of depression. Infact the results of the analyssi shows that students with average english and 
   japanese proficiency are the highest at risk of depression.
   
SELECT 
english_cate, japanese_cate,

AVG(todep) AS avg_depression

FROM students.dbo.students

WHERE english_cate IS NOT NULL

AND japanese_cate IS NOT NULL

AND todep IS NOT NULL

GROUP BY english_cate, japanese_cate

ORDER BY english_cate, japanese_cate;


![English_japanese](https://github.com/user-attachments/assets/d5c2af00-0edc-4977-8c84-001df31b2bcd)


3. Does longer stay reduce stress or improve social connections?
The data showed that longer stay reduces stress with 10 years being the highest stay with an average stress level of 50. Interestigly longer stay also accounts for the highest level of depression within the dataset.

SELECT stay AS total_stay_in_host_country,

AVG(toas) AS avg_stress,

AVG(tosc) AS avg_social_connectedness,

AVG(todep) AS avg_depression

FROM students.dbo.students

WHERE inter_dom = 'inter'

GROUP BY stay

ORDER BY stay DESC;

![avg_stress](https://github.com/user-attachments/assets/9116ca06-1576-42e2-9a23-aa2f60f1228b)

4. Impact of english proficiency on stress and depression.
   The result shows that english language proficiency does not have an impact on stress and depression levels of international students.
   
SELECT DISTINCT
   
english_cate,

AVG(toas) AS avg_stress,

AVG(todep) AS avg_dep

FROM students.dbo.students

WHERE inter_dom = 'inter'

GROUP BY english_cate

ORDER BY avg_stress DESC;

![depression_levels](https://github.com/user-attachments/assets/1530d8f1-2b07-4ca6-a4c3-4f8000052e4a)




 

