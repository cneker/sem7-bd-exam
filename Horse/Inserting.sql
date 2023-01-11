use horses1
go

insert into Jokey
values 
	('Jokey1', 'Address1', 34, 4.5),
	('Jokey2', 'Address2', 28, 4.3),
	('Jokey3', 'Address3', 30, 4.2)

insert into Owner
values
	('Owner1', 'Address1', 'Number1'),
	('Owner2', 'Address2', 'Number2'),
	('Owner3', 'Address3', 'Number3')

insert into Horse
values
	('Horse1', 'm', 3, 1),
	('Horse2', 'f', 4, 2),
	('Horse3', 'f', 3, 3),
	('Horse4', 'm', 4, 1)

insert into Competition
values
	('Competition1', 'Address1', '20200810', '13:00:00', '15:00:00'),
	('Competition2', 'Address2', '20200910', '14:00:00', '16:30:00'),
	('Competition3', 'Address3', '20200915', '12:00:00', '15:00:00')

insert into Race_Member_Results
values
	(1, 1, 3, 1, 1, '00:03:45'),
	(1, 2, 1, 1, 2, '00:03:54'),
	(1, 1, 3, 2, 1, '00:04:56'),
	(1, 2, 1, 2, 2, '00:04:58'),
	(1, 3, 2, 2, 3, '00:05:06'),
	(2, 3, 2, 1, 1, '00:04:45'),
	(2, 2, 1, 1, 2, '00:04:49'),
	(2, 1, 3, 2, 1, '00:06:24'),
	(2, 3, 2, 2, 2, '00:06:34'),
	(3, 2, 1, 1, 1, '00:05:15'),
	(3, 3, 2, 1, 2, '00:05:18')