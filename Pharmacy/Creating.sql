create database pharmacy1
COLLATE Cyrillic_General_CS_AS
go

use pharmacy1

create table Producer
(
	Id int identity primary key,
	Name nvarchar(50) not null 
)

create table Medicine
(
	Id int identity primary key,
	Name nvarchar(50) not null,
	Date_Produced date not null,
	Expiration_Date date not null,
	Priducer_Id int references Producer(Id) on delete cascade not null,
	Price real not null
)

create table Analogue 
(
	Medicine_Id int references Medicine(Id) not null,
	Analogue_Id int references Medicine(Id) not null,
	primary key(Medicine_Id, Analogue_Id)
)

create table Supply
(
	Id int identity primary key,
	Medicine_Id int references Medicine(Id) on delete cascade not null,
	Supply_Date date not null,
	Price real not null,
	Count int not null
)

create table Pharmacist
(
	Id int identity primary key,
	Name nvarchar(50) not null ,
	Birthday date check(Birthday < getdate()) not null,
	Category nvarchar(50) not null
)

create table Sale 
(
	Id int identity primary key,
	Pharmacist_Id int references Pharmacist(Id) on delete cascade not null,
	Sale_Date date not null, 
	Cost real not null
)

create table Medicine_Sale 
(
	Sale_Id int references Sale(Id) on delete cascade not null,
	Medicine_Id int references Medicine(Id) on delete cascade not null,
	Count int not null
)