SELECT N,
    CASE 
        WHEN P is Null then 'Root'
        WHEN N in (SELECT P FROM BST) then 'Inner'
        ELSE 'Leaf'
    END
FROM BST
ORDER BY N