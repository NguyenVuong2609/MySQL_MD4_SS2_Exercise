create database supplies_management;
use supplies_management;
create table delivery_note(
dnId int primary key auto_increment,
de_date date not null
);
create table import_note(
inId int primary key auto_increment,
in_date	date not null
);
create table supplies(
supId int primary key auto_increment,
supName varchar(50) unique not null
);
create table agency(
agencyId int primary key auto_increment,
agency_name varchar(50) not null unique,
agency_address varchar(100),
agency_phone varchar(10) unique
);
create table order_note(
onId int primary key auto_increment,
on_date date not null,
agencyId int,
foreign key (agencyId) references agency(agencyId)
);
create table delivery_sup(
dnId int,
supId int,
primary key(dnId,supId),
price int check (price >= 0) default(0),
quantity int check (quantity > 0) default(1),
foreign key (dnId) references delivery_note(dnId),
foreign key (supId) references supplies(supId)
);
create table import_sup(
inId int,
supId int,
price int check (price >= 0) default(0),
quantity int check (quantity > 0) default(1),
primary key(inId,supId),
foreign key (inId) references import_note(inId),
foreign key (supId) references supplies(supId)
);
create table order_sup(
onId int,
supId int,
primary key(onId,supId),
foreign key (onId) references order_note(onId),
foreign key (supId) references supplies(supId)
);
-- drop database supplies_management;