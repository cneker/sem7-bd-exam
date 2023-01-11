create database horses1
COLLATE Cyrillic_General_CS_AS
go

use horses1

create table Jokey
(
	Id int identity primary key,
	Name nvarchar(50) not null,
	Address nvarchar(20) not null,
	Age int not null,
	Rating real not null
)

create table Owner
(
	Id int identity primary key,
	Name nvarchar(50) not null,
	Address nvarchar(20) not null,
	Phone nvarchar(20) not null
)

create table Horse
(
	Id int identity primary key,
	Name nvarchar(50) not null,
	Sex nvarchar(10) check(Sex = 'm' or Sex = 'f') not null,
	Age int not null,
	Owner_Id int references Owner(Id) on delete cascade not null
)

create table Competition
(
	Id int identity primary key,
	Name nvarchar(50) not null,
	Address nvarchar(20) not null,
	Date date not null,
	Begin_Time time(0) not null,
	End_Time time(0) not null
)

create table Race_Member_Results
(
	Id int identity primary key,
	Competition_Id int references Competition(Id) on delete cascade not null,
	Horse_Id int references Horse(Id) on delete cascade not null,
	Jokey_Id int references Jokey(Id) on delete cascade not null,
	Race_Number int not null,
	Place int not null,
	Finish_Time time(0) not null,
)