"""
Знайти оцінки студентів в окремій групі з певного предмета.
"""
SELECT s.fullname, gr.name, sbj.name, g.grade 
FROM grades g 
JOIN subjects sbj ON g.subject_id = sbj.id
JOIN students s ON g.student_id = s.id 
JOIN groups gr ON s.group_id = gr.id 
WHERE gr.id = 1 AND  sbj.id = 7