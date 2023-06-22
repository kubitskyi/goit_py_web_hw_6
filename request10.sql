"""
Список курсів, які певному студенту читає певний викладач.нт.

"""
SELECT s.fullname AS student, sbj.name, t.fullname AS teacher
FROM grades g 
JOIN subjects sbj ON g.subject_id = sbj.id
JOIN students s ON g.student_id = s.id  
JOIN teachers t ON sbj.teacher_id = t.id 
WHERE s.id = 56 AND t.id = 3
GROUP BY sbj.id 
