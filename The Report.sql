#When Joining table, we can use condition with <>, beside just =
SELECT 
    CASE WHEN Grade > 7 THEN Name ELSE Null END,
    Grade,
    Marks
FROM students s
JOIN Grades g
ON s.marks between g.Min_mark and max_mark
ORDER BY Grade DESC, Name, Marks ASC