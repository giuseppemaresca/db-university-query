-- Selezionare il dipartimento in cui capo è Bernardo Sanna
select *
from departments 
where head_of_department ='Bernardo Sanna' ;

-- Selezionare tutti i corsi di una laurea magistrale 
select *
from  degrees 
where  `level`='magistrale';

--Selezionare tutti i corsi che valgono più di 10 crediti
select *
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