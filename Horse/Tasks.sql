--task2
create proc task2
as
select *
from Horse
where Name like '%or%'

exec task2

--task3
create proc task3
	@var int
as
select Name
from Owner
where Id = @var

exec task3 3

--task4
create trigger task4
on Owner
after delete
as
delete Horse
where Owner_Id = (select Id from deleted)

delete Owner
where Id = 4

--task5
create view task5
as
select Name, Address, Date, concat(Begin_Time, ' - ', End_Time) Timing
from Competition

select *
from task5
order by Name asc

--task6
select H.Name, H.Age, O.Name Owner_Name, temp.Count
from
	(
	select Horse_Id, count(*) Count
	from Race_Member_Results
	group by Horse_Id
	) temp
join Horse H on H.Id = temp.Horse_Id
join Owner O on O.Id = H.Owner_Id

--task7
select H.Name, H.Age, H.Sex
from
	(
	select Horse_Id
	from Race_Member_Results RMR
	join Horse H on H.Id = RMR.Horse_Id
	where Competition_Id = any
		(
		select distinct Competition_Id
		from Race_Member_Results
		join Horse H on H.Id = Horse_Id
		where H.Name = 'Horse2'
		) and H.Name <> 'Horse2'
	group by RMR.Horse_Id
	having count(distinct Competition_Id) = (select count(distinct Competition_Id) 
		from Race_Member_Results where Horse_Id = RMR.Horse_Id)
		and count(distinct Competition_Id) = (select count(distinct Competition_Id) 
		from Race_Member_Results join Horse H on H.Id = Horse_Id where H.Name = 'Horse2')
	) temp
join Horse H on H.Id = temp.Horse_Id

