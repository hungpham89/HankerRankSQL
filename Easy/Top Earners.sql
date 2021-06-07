SELECT MIN(salary*months), #The min here is just to have an agg function for the group by made by count(*)
	count(*)
FROM EMPLOYEE
WHERE (salary*months) = (SELECT MAX(salary*months) 
						 FROM EMPLOYEE)