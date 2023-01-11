create database med1
go

use med1

create table Patient
(
	Id int identity primary key,
	Name nvarchar(50) not null,
	Sex nvarchar(10) check(Sex = 'male' or Sex = 'female') not null,
	Birthday date check(Birthday < getdate()) not null,
	Address nvarchar(20) not null
)

create table Doctor
(
	Id int identity primary key,
	Name nvarchar(50) not null,
	Position nvarchar(20) not null
)

create table Medicine
(
	Id int identity primary key,
	Name nvarchar(50) not null,
	Effect nvarchar(50) not null,
	Side_Effect nvarchar(50) not null,
    Method_Of_Taking nvarchar(20) not null
)

create table Location
(
	Id int identity primary key,
	Name nvarchar (10) not null
)

create table Diagnosis
(
	Id int identity primary key,
	Name nvarchar(20) not null
)

create table Appointment
(
	Id int identity primary key,
	Patient_Id int references Patient(Id) on delete cascade not null,
	Doctor_Id int references Doctor(Id) on delete cascade not null,
	Location_Id int references Location(Id) on delete cascade not null,
	Begin_Date date default(getdate()) not null,
	Begin_Time time not null,
	End_Date date not null,
	End_Time time not null,
	Symptoms nvarchar(100) not null,
	Prescription nvarchar(100) not null,
	Diagnosis_Id int references Diagnosis(Id) on delete cascade not null
)

create table Appointment_Medicine
(
	Appointment_Id int not null,
	Medicine_Id int not null,
	primary key(Appointment_Id, Medicine_Id),
	foreign key (Appointment_Id) references Appointment(Id) on delete cascade,
	foreign key (Medicine_Id) references Medicine(Id) on delete cascade,
)
