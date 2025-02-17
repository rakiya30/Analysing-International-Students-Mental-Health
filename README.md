# Analysing-International-Students-Mental-Health
This repository analyzes data from a 2018 study conducted by a Japanese international university, which found that international students face higher risks of mental health challenges compared to the general population. 

## TABLE OF CONTENTS
-  Project Overview
  
- Dataset Description
  
-  Methodology

- Key Findings
  
- Recommendations
  
- SQL Scripts



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

    - The dataset contains survey responses from 268 students (201 international, 68 domestic) collected in 2018 by a japanese university. The dataset has a total of 50 columns with 268 rows, however for this analysis we used only eight columnns relevant to the questions that this project aims to answer. Here is a descriptions of the columms:
   
  
 
    - inter_dom  -   Types of students(international or domestic)
   
    - japanese_cate - japanese language proficiency
   
    - english_cate - English language proficiency
   
    - academic - Current academic level undergraduate or graduate
   
    - age   -   Current age of students
   
    - stay -  Current length of stay in years
   
    - todep - Total score of social connectedness (scs) test
   
    - toas  - Total score of acculturative stress
   
    
