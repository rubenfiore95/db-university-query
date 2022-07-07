
-- Contare quanti iscritti ci sono stati ogni anno (la data di iscrizione sulla tabella students è enrolment_date)
-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
-- Selezionare tutti i corsi in cui insegna Fulvio Amato
-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
-- Contare quanti corsi di laurea ci sono per ogni dipartimento e mostrare nome dipartimento e numero di corsi

SELECT YEAR(students.enrolment_date), COUNT(students.id) as enrolment_count
FROM students
GROUP BY YEAR(students.enrolment_date);

SELECT *
FROM degrees d INNER JOIN students s
ON s.degree_id = d.id
WHERE d.name  = 'Corso di Laurea in Economia';

SELECT t.name, t.surname, c.name as 'nome corso'
FROM teachers t 
INNER JOIN course_teacher ct 
ON ct.teacher_id = t.id
INNER JOIN courses c 
ON ct.course_id = c.id
WHERE t.name = 'Fulvio'

SELECT s.name, s.surname, s.registration_number, d.name, dep.name
FROM students s 
INNER JOIN degrees d 
ON s.degree_id = d.id
INNER JOIN `departments` dep
ON d.department_id = dep.id 
ORDER BY s.surname, s.name;

SELECT COUNT(d.id) as n_cdl_per_dipartimento, dep.name FROM `degrees` d
INNER JOIN departments dep
ON d.department_id = dep.id
GROUP BY d.department_id ;