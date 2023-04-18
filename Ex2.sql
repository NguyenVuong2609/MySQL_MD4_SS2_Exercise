create database sales_management;
use sales_management;
create table customer(
cID int primary key auto_increment,
cName varchar(50),
cAge int
);
create table orders(
oID int primary key auto_increment,
oDate date,
oTotalPrice int,
cID int,
foreign key (cID) references customer(cID)
);
create table product(
pID int primary key auto_increment,
pName varchar(50),
pPrice int
);
create table order_detail(
oID int,
pID int,
primary key(oID,pID),
odQTY int check(odQTY > 0),
foreign key (oID) references orders(oID),
foreign key (pID) references product(pID)
);