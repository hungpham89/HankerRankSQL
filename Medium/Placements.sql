SELECT self.name
FROM
	(SELECT s.ID, 
		s.name, 
        f.friend_id, 
        p.salary
	FROM STUDENTS s,
		FRIENDS f,
		PACKAGES p
	WHERE
		s.ID = f.ID AND
		f.friend_ID = p.ID) compare
JOIN
	(SELECT s.id, 
		s.name, 
        p.salary
	FROM students s, 
		packages p
	WHERE 
		s.id = p.id) self
ON 
    self.id = compare.id
WHERE self.salary < compare.salary
ORDER BY compare.salary
    

