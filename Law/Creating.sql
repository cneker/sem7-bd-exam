create database law
	COLLATE Cyrillic_General_CS_AS
go

use law
go

begin transaction

create table Members
(
	Id int identity primary key,
	Surname nvarchar(20) not null,
	Name nvarchar(20) not null,
	Patronymic nvarchar(20) not null,
	Address nvarchar(30) not null,
	Home_number nvarchar(10) not null,
	Work_number nvarchar(10) not null
)

create table Commissions
(
	Id int identity primary key,
	Profile nvarchar(20) not null,
	Chairman_Id int references Members(Id)
)

create table Member_Commission
(
	Commission_Id int not null,
	Member_Id int not null,
	primary key(Commission_Id, Member_Id),
	foreign key (Commission_Id) references Commissions(Id) on delete cascade,
	foreign key (Member_Id) references Members(Id) on delete cascade
)

create table Meetings
(
	Id int identity primary key,
	Location nvarchar(20) default('Default_Location') not null,
	Begin_Time time(0) not null,
	End_Time time(0) not null,
	Commission_Id int not null references Commissions(Id) on delete cascade,
	check(End_Time > Begin_Time and Begin_Time < End_Time)
)

commit transaction