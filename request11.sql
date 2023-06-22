"""
Середній бал, який певний викладач ставить певному студентові.
"""
SELECT s.fullname AS stdent, ROUND( AVG(g.grade), 2) AS average, t.fullname AS teacher
FROM grades g 
JOIN subjects sbj ON g.subject_id = sbj.id
JOIN students s ON g.student_id = s.id  
JOIN teachers t ON sbj.teacher_id = t.id 
WHERE s.id = 56 AND t.id = 3
ORDER BY average DESC 
