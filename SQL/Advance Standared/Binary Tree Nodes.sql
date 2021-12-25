/*
You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.



Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
*/
SELECT distinct(p.n),
    CASE WHEN
        p.p is null THEN 'Root'
    WHEN
        n.n is null THEN 'Leaf'
    ELSE
        'Inner'
    END
FROM BST AS p
LEFT JOIN BST AS n ON p.n = n.p
ORDER BY p.n ASC
