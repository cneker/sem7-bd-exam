--task2
create proc task2
as
select *
from Commissions
where Profile like '%��%'

exec task2

--task3
create proc task3
	@var int
as
select Surname, Name, Patronymic, Home_number
from Members
where Id = @var

exec task3 4

--task4
create trigger task4
on Members
instead of delete
as
delete Commissions
where Chairman_Id = (select Id from deleted)
delete Members
where Id = (select Id from deleted)

delete Members
where Surname = 'Surname'

--task5
create view task5
as
select C.Profile, CONCAT(Begin_Time, ' - ', End_Time) Timing, DATEDIFF(minute, Begin_Time, End_Time) Duration
from Meetings
join Commissions C on C.Id = Commission_Id

select * 
from task5 
order by Profile asc

--task6
create view task6
as
select Id Commission_Id, Chairman_Id Member_Id
from Commissions
union
select MC.Commission_Id, MC.Member_Id
from Commissions C
join Member_Commission MC on MC.Commission_Id = C.Id

select Surname, Name, Patronymic, Commissions, Meetings
from Members M
left outer join 
	(
	select task6.Member_Id, count(*) Commissions
	from task6
	group by task6.Member_Id
	) temp1 on temp1.Member_Id = M.Id
left outer join
	(
	select task6.Member_Id, count(*) Meetings
	from Meetings M
	join task6 on task6.Commission_Id = M.Commission_Id
	group by task6.Member_Id
	) temp2 on temp2.Member_Id = M.Id
order by Surname desc, Name desc, Patronymic desc

--task7
select Surname, Name, Patronymic, Address, Home_number, Work_number
from
	(
	select Member_Id Member
	from Meetings M
	join task6 MCC on MCC.Commission_Id = M.Commission_Id
	join Members Mem on Mem.Id = MCC.Member_Id
	where M.Id = any
		(
		select M.Id
		from Meetings M
		join task6 MC on MC.Commission_Id = M.Commission_Id
		join Members Mem on Mem.Id = MC.Member_Id
		where Mem.Surname = 'Surname1'
		) and Mem.Surname <> 'Surname1'
	group by Member_Id
	having count(*) =
		(
		select count(*)
		from Meetings M
		join task6 MC on MC.Commission_Id = M.Commission_Id
		join Members Mem on Mem.Id = MC.Member_Id
		where MC.Member_Id = MCC.Member_Id
		) and count(*) =
			(
			select count(*)
			from Meetings M
			join task6 MC on MC.Commission_Id = M.Commission_Id
			join Members Mem on Mem.Id = MC.Member_Id
			where Mem.Surname = 'Surname1'
			)
	) temp
join Members on Id = Member