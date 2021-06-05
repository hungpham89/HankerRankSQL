# First step is to query the id, name and number of challenges of each hacker
SELECT 
    c.hacker_id,
    name,
    count(distinct(c.challenge_id)) num_chal
FROM 
    challenges c,
    hackers h
WHERE 
    c.hacker_id = h.hacker_id
GROUP BY
    c.hacker_id,
    name
#Filter out with 2 conditions:

# Keep only hackers that has maximum number of challenges.
HAVING
    num_chal = 	(SELECT MAX(cnt)
                FROM(
					SELECT(COUNT(hacker_id)) cnt
					FROM challenges
					GROUP BY hacker_id) count_table ) 
	OR
# Or does not have any one having the same number of challenge (duplicated)
    num_chal in   (SELECT cnt2 #Creating temp table with the count and how many time it get duplicated
					FROM(
						SELECT
						hacker_id,
						(COUNT(hacker_id)) cnt2
						FROM challenges
						GROUP BY hacker_id) group_table
					GROUP BY cnt2
					HAVING count(cnt2) =1) #Filter out and keep only the number of challenges that has no duplicate
              
ORDER BY 
    num_chal DESC,
    c.hacker_id