"""
Знайти список студентів у певній групі.
"""

SELECT s.fullname, gr.name 
FROM grades g 
JOIN students s ON g.student_id = s.id 
JOIN groups gr ON s.group_id = gr.id 
WHERE gr.id = 1
