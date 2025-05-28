--1. Quantidade de horas que cada professor tem comprometido em aulas

SELECT 
    p.id AS professor_id, 
    p.name AS professor_name, 
    SUM(EXTRACT(EPOCH FROM (h.end_time - h.start_time)) / 3600) AS total_hours
FROM 
    professor p
JOIN 
    turma t ON p.id = t.professor_id
JOIN 
    horario_aula h ON t.id = h.class_id
GROUP BY 
    p.id, p.name
ORDER BY 
    total_hours DESC;

--2. Lista de salas com horários livres e ocupados
SELECT 
    s.id AS sala_id,
    s.name AS sala_name,
    h.day_of_week, 
    h.start_time, 
    h.end_time,
    CASE 
        WHEN h.id IS NULL THEN 'Livre'
        ELSE 'Ocupado'
    END AS status
FROM 
    sala s
LEFT JOIN 
    horario_aula h ON s.id = h.room_id
ORDER BY 
    s.id, h.day_of_week, h.start_time;    