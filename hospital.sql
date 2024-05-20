use [master];
go

if db_id('Hospital') is not null
begin
    drop database [Hospital];
end
go

create database [Hospital];
go

use [Hospital];
go

create table [Departments]
(
    Id int not null identity(1,1) primary key,
    Building int not null check ([Building] between 1 and 5),
    Financing money not null default 0 check ([Financing] >= 0),
    Floor int not null check ([Floor] >= 1),
    Name nvarchar(100) not null unique check ([Name] != '')
);
go

create table [Diseases]
(
    Id int not null identity(1,1) primary key,
    Name nvarchar(100) not null unique check ([Name] != ''),
    Severity int not null default 1 check ([Severity] >= 1)
);
go

create table [Doctors]
(
    Id int not null identity(1,1) primary key,
    Name nvarchar(max) not null check ([Name] != ''),
    Phone char(10),
    Premium money not null default 0 check ([Premium] >= 0),
    Salary money not null check ([Salary] > 0),
    Surname nvarchar(max) not null check ([Surname] != '')
);
go

create table [Examinations]
(
    Id int not null identity(1,1) primary key,
    DayOfWeek int not null check ([DayOfWeek] between 1 and 7),
    EndTime time not null,
    Name nvarchar(100) not null unique check ([Name] != ''),
    StartTime time not null check ([StartTime] between '08:00' and '18:00')
);
go

create table [Wards]
(
    Id int not null identity(1,1) primary key,
    Building int not null check ([Building] between 1 and 5),
    Floor int not null check ([Floor] >= 1),
    Name nvarchar(20) not null unique check ([Name] != '')
);
go

insert into [Departments] ([Building], [Financing], [Floor], [Name])
values 
    (1, 100000.00, 3, 'Cardiology'),
    (2, 150000.00, 2, 'Neurology'),
    (3, 120000.00, 1, 'Orthopedics'),
    (4, 90000.00, 4, 'Pediatrics'),
    (5, 110000.00, 1, 'Dermatology');

insert into Diseases (Name, Severity)
values 
    ('Influenza', 2),
    ('Arthritis', 3),
    ('Concussion', 4),
    ('Asthma', 2),
    ('Diabetes', 3)

insert into Doctors (Name, Phone, Premium, Salary, Surname)
values 
    ('Illia Bondar', '1234567890', 500.00, 2000.00, 'Doe'),
    ('Alisa Smith', '2345678901', 600.00, 2200.00, 'Smith'),
    ('Max Johnson', null, 550.00, 2100.00, 'Johnson'),
    ('Patricia Lee', '3456789012', 650.00, 2300.00, 'Lee'),
    ('Michael Jackson', null, 700.00, 2400.00, 'Jackson')

insert into Examinations (DayOfWeek, EndTime, Name, StartTime)
values 
    (1, '10:00', 'Routine Check', '08:30'),
    (3, '11:00', 'MRI Scan', '09:45'),
    (5, '15:00', 'Ultrasound', '14:00'),
    (2, '16:00', 'Blood Test', '15:15'),
    (4, '12:00', 'X-ray', '11:00')


insert into Wards (Building, Floor, Name)
values 
    (1, 2, 'Ward A'),
    (2, 1, 'Ward B'),
    (3, 3, 'Ward C'),
    (4, 1, 'Ward D'),
    (5, 2, 'Ward E')




