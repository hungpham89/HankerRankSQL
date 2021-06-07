SELECT hacker_id,
    name,
    SUM(max_score) total_score
FROM
    (SELECT h.hacker_id,
        name,
        s.challenge_id,
        MAX(s.score) max_score
    FROM hackers h, 
		submissions s
    WHERE h.hacker_id = s.hacker_id
    GROUP BY h.hacker_id, 
		name,
        s.challenge_id
    ) max_table #filter out only max score of each challenge
GROUP BY hacker_id, name
HAVING total_score >0
ORDER BY total_score DESC, 
	hacker_id ASC