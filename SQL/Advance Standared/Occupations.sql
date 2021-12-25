/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

Input Format

The OCCUPATIONS table is described as follows
*/
SELECT 
MAX(CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END) AS Doctor,
MAX(CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END) AS Professor,
MAX(CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END) AS Singer,
MAX(CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END) AS Actor
FROM (
  SELECT a.Occupation,
         a.Name,
         (SELECT COUNT(*) 
            FROM Occupations AS b
            WHERE a.Occupation = b.Occupation AND a.Name > b.Name) AS ranks
  FROM Occupations AS a
) AS c
GROUP BY c.ranks ORDER BY c.ranks ;
