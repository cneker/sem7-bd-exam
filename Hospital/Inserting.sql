use med1
go

insert into Doctor
values
	('Doctor1', 'Position1'),
	('Doctor2', 'Position2')

insert into Patient
values
	('Patient1', 'male', '19991111', 'Address1'),
	('Patient2', 'female', '19901010', 'Address2'),
	('Patient3', 'male', '19911010', 'Address3'),
	('Patient4', 'female', '19921010', 'Address4')

insert into Location
values
	('home'),
	('hospital')

insert into Medicine
values
	('Medicine1', 'Effect1', 'Side effect1', 'Method1'),
	('Medicine2 3% Medicine2', 'Effect2', 'Side effect2', 'Method2'),
	('Medicine3 Medicine3', 'Effect3', 'Side effect3', 'Method3')

insert into Diagnosis
values
	('First'),
	('Second'),
	('Third')

insert into Appointment
values
	(1, 1, 1, '20191010', '12:45:00', '20191010', '12:55:00', 'Symptoms1', 'Prescription1', 1),
	(2, 2, 1, '20191015', '15:40:00', '20191015', '16:00:00', 'Symptoms2', 'Prescription2', 1),
	(1, 2, 2, '20191017', '13:23:00', '20191017', '13:30:00', 'Symptoms3', 'Prescription3', 3),
	(3, 2, 2, '20191018', '14:23:00', '20191018', '14:30:00', 'Symptoms4', 'Prescription4', 1),
	(3, 1, 1, '20191019', '15:23:00', '20191019', '15:30:00', 'Symptoms5', 'Prescription5', 2),
	(3, 2, 1, '20191020', '16:23:00', '20191020', '16:30:00', 'Symptoms3', 'Prescription6', 3),
	(2, 1, 2, '20191020', '17:23:00', '20191020', '17:30:00', 'Symptoms6', 'Prescription7', 3)

insert into Appointment_Medicine
values
	(1, 1),
	(2, 2),
	(3, 2),
	(3, 3),
	(4, 1),
	(5, 1)