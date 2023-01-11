use pharmacy1
go

insert into Producer
values 
	('Producer1'),
	('Producer2'),
	('Producer3')

insert into Medicine
values
	('MedicineA1', '20210512', '20240512', 1, 100),
	('MedicineA2', '20200611', '20230611', 1, 125),
	('MedicineB1', '20210820', '20250920', 2, 150),
	('MedicineB2', '20220827', '20260827', 2, 200),
	('MedicineAC1', '20220425', '20240425', 3, 180),

insert into Analogue
values
	(1, 2),
	(1, 5),
	(2, 1),
	(3, 4),
	(4, 3),
	(5, 1)

insert into Supply
values
	(1, '20210710', 80, 100),
	(2, '20200910', 90, 100),
	(3, '20211110', 120, 150),
	(4, '20221010', 150, 80),
	(5, '20220610', 140, 50)

insert into Pharmacist
values
	('Pharmacist1', '19900324', 'category1'),
	('Pharmacist2', '19950728', 'category2')

insert into Sale
values
	(1, '20220911', 325),
	(2, '20220912', 600),
	(1, '20220913', 480)

insert into Medicine_Sale
values
	(1, 1, 2),
	(1, 2, 1),
	(2, 4, 3),
	(3, 3, 2),
	(3, 5, 1)