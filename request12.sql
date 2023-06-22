"""
Оцінки студентів у певній групі з певного предмета на останньому занятті.
"""
SELECT s.fullname, gr.name, g.grade, g.date_of
FROM grades g 
JOIN students s ON g.student_id = s.id 
JOIN groups gr ON s.group_id = gr.id 
JOIN subjects sbj ON g.subject_id = sbj.id 
WHERE gr.id = 1 AND sbj.id = 8 AND g.date_of = 
(
	SELECT MAX(g.date_of)
	FROM grades g
	JOIN subjects sbj ON g.subject_id = sbj.id 
	JOIN students s ON s.id = g.student_id 
	JOIN [groups] gr ON gr.id = s.group_id 
	WHERE gr.id = 1 AND sbj.id = 8
	)
ORDER by s.fullname ASC;