"""
Знайти список курсів, які відвідує студент.

"""
SELECT s.fullname, sbj.name 
FROM grades g 
JOIN subjects sbj ON g.subject_id = sbj.id
JOIN students s ON g.student_id = s.id  
WHERE s.id = 56
GROUP BY sbj.id 
