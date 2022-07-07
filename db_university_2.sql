-- Selezionare il dipartimento in cui capo è Bernardo Sanna
select *
from departments 
where head_of_department ='Bernardo Sanna' ;

-- Selezionare tutti i corsi di una laurea magistrale 
select *
from  degrees 
where  `level`='magistrale';

--    Selezionare tutti i corsi che valgono più di dieci crediti
select name,cfu 
from courses 
where cfu >10;

-- Selezionare tutti gli insegnanti che non hanno il numero di telefono
select *
from teachers 
where phone is null  ;

-- Selezionare tutti gli studenti che hanno più di 30 anni
select *
from students 
where TIMESTAMPDIFF(year,date_of_birth,curdate()) >30;

-- Selezionare tutti gli studenti che hanno un indirizzo email gmail o yahoo
select *
from students 
where email like'%gmail%'or email like'%yahoo%';

-- Selezionare tutti gli esami che si sono svolti a luglio 2020
select *
from exams 
where MONTH (`date`) = 7 AND YEAR (`date`) = 2020;

--  Contare quanti iscritti ci sono stati ogni anno (la data di iscrizione sulla tabella students è enrolment_date)

select year (students.enrolment_date),count(students.id) as enrolment_count
from students 
group by year (students.enrolment_date);

-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
select *
from `degrees` d 
inner join `students` s  
on s.degree_id =d.id
where d.`name`='Corso di Laurea in economia';

--Selezionare tutti i corsi in cui insegna fulvio amato

select t.name,t.surname,c.name as'nome corso'
from teachers t 
inner join course_teacher ct 
on ct.teacher_id=t.id 
inner join courses c 
on ct.course_id =c.id 
where t.name ='Fulvio'

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome!

SELECT s.name, s.surname, s.registration_number, d.name, dep.name
FROM students s 
INNER JOIN `degrees` d 
ON s.degree_id = d.id
INNER JOIN `departments` dep
ON d.department_id = dep.id 
ORDER BY s.surname, s.name;

-- Contare quanti corsi di laurea ci sono per ogni dipartimento e mostrare nome dipartimento e numero di corsi
select count(dep.id) as n_c_per_dip,dep.name
from degrees d 
inner join departments dep 
on d.department_id=dep.id
group by dep.id;

