"""
Знайти середній бал, який ставить певний викладач зі своїх предметів.
"""
SELECT t.fullname, ROUND(AVG(g.grade), 2) as avg_grade, sbj.name 
FROM grades g 
JOIN subjects sbj ON g.subject_id = sbj.id
JOIN teachers t ON sbj.teacher_id = t.id 
WHERE t.id = 1
GROUP BY sbj.id
ORDER BY avg_grade DESC 
