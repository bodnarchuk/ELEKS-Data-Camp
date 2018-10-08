
/*
Entyties list of Zoo domain:
	animals
	employees
	cage
	service			an employee do something in a cage (cleaning, desinfection etc.)
	food			for enimals
	feeds			an employee feeds animals in certain cage with some food
	suppliers		of food for animal
	tourType		some kinds of tours for visitors (lenghs, species of animals)
	tours			an instant of TourType. Consists of set of cages to see

*/

/*
This is initial data base (DB) design only. It may me refined with:
I) additional tables for:
	1. Allowed foods for each species of animals
	2. Types of servises/works in cages
	3. Accoubting of bonuses (needs clarification of rules for this)
	4. Discouts for visitors
	5. Supplying of foods (who, when and how much)
	... (all depends on requirements)

II) triggers for:
	1. decreasing of food for each feed action
	2. recalculating of bonuses and discounts for some accumulated sum
	... (all depends on requirements)
*/

create database zoo
COLLATE Ukrainian_100_BIN2;
GO

use zoo;
GO

-- 1
drop table if exists Employees;
create table Employees(
	eID int primary key IDENTITY(1,1),
	eName nvarchar (30) not null
)

--2
drop table if exists TourType;
create table TourType(
	tID int primary key IDENTITY(1,1),
	tPrice money not null,
	tAvailability bit 
);

--3
drop table if exists Cage;
create table Cage(
	cID int not null primary key check (cID >= 0),
	cDescription nvarchar(255) not null,
	cCapacity int not null check (cCapacity >=1),
	cSupervisedBy int,
	cTour int 
);

--4
drop table if exists Tours;
create table Tours(
	tourID int primary key IDENTITY(1,1),
	tourName nvarchar(10) not null,
	tType int,
	tCage int
	
	constraint FK_TypeTour
	foreign key (tType) references TourType on update set null,
	
	constraint FK_TourCage
	foreign key (tCage) references Cage(cID) on update set null
);

--5
drop table if exists Service;
create table Service (
	servID int primary key IDENTITY(1,1),
	servedBy int,
	servedFor int,
	servedWhat nvarchar(15) 
	
	constraint FK_Service_Employee
	foreign key (servedBy) references Employees(eID) on update cascade,
	
	constraint FK_Service_Cage
	foreign key (servedFor) references Cage(cID) on update cascade
);

--6
drop table if exists Animals;
create table Animals(
	aID int primary key IDENTITY(1,1),
	aSpecies nvarchar(30) not null,
	aCage int
	
	constraint FK_Animal_Cage
	foreign key (aCage) references Cage(cID) on update set null
);

--7
drop table if exists Suppliers;
create table Suppliers(
	supID int primary key IDENTITY(1,1),
	sName nvarchar(30),
	sPhone nvarchar(13)
);

--8
drop table if exists Food;
create table Food (
	fID int primary key IDENTITY(1,1),
	fName nvarchar(20),
	fSupplier int
	
	constraint FK_Supplier
	foreign key (fSupplier) references Suppliers(supID) on update set null
);

--9
drop table if exists Feed;
create table Feed(
	feedID int primary key IDENTITY(1,1),
	feedEmp int,
	feedAnimal int,
	feedFood int,
	feedDate Date,
	feedQuantity decimal(5,2)
	
	constraint FK_Feed_Employee
	foreign key (feedEmp) references Employees on update cascade,
	
	constraint FK_Animal
	foreign key (feedAnimal) references Animals on update cascade,

	constraint FK_Food
	foreign key (feedFood) references Food on update cascade
);

GO