
#For this challenge, I used MySQL that doesnt have pivot as well as Full Outer Join, so I have to manually create new column to act as index
#link to challenge: https://www.hackerrank.com/challenges/occupations/problem?isFullScreen=true
SELECT 
    min(case when occupation = 'Doctor' then Name else Null end),
    min(case when occupation = 'Professor' then Name else Null end),
    min(case when occupation = 'Singer' then Name else Null end),
    min(case when occupation = 'Actor' then Name else Null end)
FROM
(SELECT OCCUPATION, 
    NAME, 
    ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) temp
FROM OCCUPATIONS) as main
GROUP BY temp