"""
Знайти, які курси читає певний викладач.
"""

SELECT t.fullname, sbj.name 
FROM subjects sbj  
JOIN teachers t ON t.id = sbj.teacher_id  
WHERE t.id = 3
ORDER BY sbj.name ASC