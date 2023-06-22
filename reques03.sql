"""
Знайти середній бал у групах з певного предмета.
"""
SELECT gr.name, ROUND( AVG(g.grade), 2) AS average, sbj.name 
FROM grades g 
JOIN students s ON g.id  = s.id 
JOIN groups gr ON s.group_id = gr.id  
JOIN subjects sbj ON g.subject_id  = sbj.id 
WHERE sbj.id = 2
GROUP BY gr.name  
ORDER BY average DESC 
LIMIT 4