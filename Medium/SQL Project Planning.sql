SELECT start_date, 
	min(end_date) 
FROM
	(SELECT start_date
		FROM PROJECTS
		WHERE start_date NOT IN(SELECT end_date FROM PROJECTS)
		ORDER BY start_date) s,

	(SELECT end_date
		FROM PROJECTS
		WHERE end_date NOT IN(SELECT start_date FROM PROJECTS)
		ORDER BY end_date) e
WHERE start_Date < end_date
GROUP BY start_date
ORDER BY datediff(min(end_date),start_Date)