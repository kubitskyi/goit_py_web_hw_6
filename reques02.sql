"""
Знайти студента із найвищим середнім балом з певного предмета.
"""
SELECT sbj.name, s.fullname, ROUND(AVG(g.grade), 2) as avg_grade
FROM grades g 
LEFT JOIN students s ON s.id  = g.student_id 
LEFT JOIN subjects sbj ON sbj.id = g.subject_id
WHERE sbj.id = 2
GROUP BY s.id 
ORDER BY avg_grade DESC 
LIMIT 1