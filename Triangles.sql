#The tricky part that I need to look at the discussion is for the 'Not A Triangle', the condition should be 'less than or equal' not just less
#lol
SELECT
    CASE 
        WHEN A = B AND A = C THEN 'Equilateral'
        WHEN A+B<=C or A+C<=B or B+C<=A then 'Not A Triangle'
        WHEN A = B or B = C or A = C then 'Isosceles'
        WHEN A!=B AND B!=C AND A!=C then 'Scalene'
        end
FROM triangles