SELECT h.hacker_id,
    h.name
FROM hackers h,
    difficulty d,
    challenges c,
    submissions s
WHERE h.hacker_id = s.hacker_id AND
    d.score = s.score AND
    d.difficulty_level = c.difficulty_level AND
    c.challenge_id = s.challenge_id
GROUP BY h.hacker_id, 
	h.name
HAVING COUNT(h.hacker_id)>1
ORDER BY COUNT(h.hacker_id) DESC, 
	hacker_id ASC;