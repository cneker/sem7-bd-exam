--task2
create proc task2
	@var nvarchar(3)
as
select *
from Medicine
where Name like '%' + @var + '!%%' escape '!'

--task3
create proc task3
	@var int
as
select Name, Category
from Pharmacist
where Id = @var

exec task3 2

--task4
create trigger task4
on Pharmacist
after delete
as
delete Sale
where Pharmacist_Id = (select Id from deleted)

delete Pharmacist
where Id = 3

--task5
create view task5
as
select Name Medicine_Name, temp.Analog_Name
from
	(
	select Medicine_Id, Name Analog_Name
	from Analogue
	join Medicine on Id = Analogue_Id
	) temp
join Medicine on Id = temp.Medicine_Id

select *
from task5
order by Medicine_Name asc

--task6
select Name, Count
from
	(
	select Medicine_Id, sum(Count) Count
	from Medicine_Sale
	group by Medicine_Id
	) temp
join Medicine on Id = Count
order by Count desc

--task7
select Name, Price
from
	(
	select Medicine_Id
	from Analogue A
	join Medicine on Id = Medicine_Id
	where Analogue_Id = any
		(
		select Analogue_Id
		from Analogue
		join Medicine on Id = Medicine_Id
		where Name = 'MedicineA2'
		) and Name <> 'MedicineA2'
	group by Medicine_Id 
	having count(*) = (select count(*) from Analogue where Medicine_Id = A.Medicine_Id)
		and count(*) = (select count(*) from Analogue join Medicine on Id = Medicine_Id
			where Name = 'MedicineA2')
	) temp
join Medicine on Id = Medicine_Id