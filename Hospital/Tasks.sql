--task2
create proc task2 
	@var nvarchar(3)
as
select *
from Medicine
where Name like '%' + @var + '!%%' escape '!'

exec task2 3

--task3
create proc task3
	@var int
as
select Name, Position
from Doctor
where Id = @var

exec task3 1

--task4
create trigger task4
on Patient
after delete
as
delete Appointment
where Patient_Id = (select Id from deleted)

delete Patient
where Id = 4

--task5
create view task5
as
select P.Name, P.Birthday, P.Sex, P.Address, D.Name Diagnosis
from Patient P
join Appointment A on A.Patient_Id = P.Id
join Diagnosis D on D.Id = A.Diagnosis_Id

select * 
from task5 
order by Name asc

--task6
select D.Name, D.Position, T.avg
from
	(
	select Doctor_Id , 
		avg(datediff(minute, (CAST(Begin_Date as datetime) + cast(Begin_Time as datetime)), 
			CAST(End_Date as datetime) + cast(End_Time as datetime))) [avg]
	from Appointment
	group by Doctor_Id
	) T
join Doctor D on D.Id = T.Doctor_Id 

--task7
select P.Name, P.Birthday, P.Sex, P.Address
from
	(
	select P.Id
	from Appointment A
	join Patient P on P.Id = Patient_Id
	where Diagnosis_Id = ANY
		(
			select Diagnosis_Id
			from Appointment
			join Patient P on P.Id = Patient_Id
			where P.Name = 'Patient2'
		) and P.Name <> 'Patient2'
	group by P.Id
	having count(P.Id) = (select count(*) from Appointment where Patient_Id = P.Id)
		and count(P.Id) = (select count(*) from Appointment 
			join Patient P on P.Id = Patient_Id where P.Name = 'Patient2')
	) temp
join Patient P on P.Id = temp.Id