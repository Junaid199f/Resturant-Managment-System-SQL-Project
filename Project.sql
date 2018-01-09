#Resturant Table Creation

create table Resturant(
NAME varchar(20) NOT NULL,
ADDRESS varchar(50) NOT NULL,
CONTACT int NOT NULL,
Primary key (NAME));

#Resturant data insertion

insert into Resturant VALUES('Sheraz Resturant','Saddar Peshawar',03008710203);

#Managers Table Creation

create table Managers(
MGRID int NOT NULL,
NAME varchar(15) NOT NULL,
MGRCONTACT int NOT NULL,
Primary Key (MGRID));

CREATE SEQUENCE MGRID
MINVALUE 1
START WITH 1
INCREMENT BY 2
CACHE 10;

#Managers Table Insertion

insert into Managers VALUES(MGRID.nextval,'Yaseen',0145110203);
insert into Managers VALUES(MGRID.nextval,'Iqbal',0245110203);
insert into Managers VALUES(MGRID.nextval,'Abdullah',0345110203);

#Cashier Table Creation

create table Cashier(
CID int NOT NULL,
CNAME varchar(15) NOT NULL,
Primary Key (CID));

CREATE SEQUENCE CID
MINVALUE 50
START WITH 51
INCREMENT BY 2
CACHE 10;
#Cashier Table Insertion
insert into cashier values((CID.nextval,'Aslam');
#Bill Table Creation
create table bill(
Billno int NOT NULL,
detail varchar(25),
Primary Key(Billno));
#Bill Table Insertion
insert into bill values((select dbms_random.string('X', 6) str from dual),'Chicken Fajita(Pizza)');
insert into bill values((select dbms_random.string('X', 6) str from dual),'Burger');
insert into bill values((select dbms_random.string('X', 6) str from dual),'Italian Pizza');
insert into bill values((select dbms_random.string('X', 6) str from dual),'Qorma');
insert into bill values((select dbms_random.string('X', 6) str from dual),'Alpino Cofee');
insert into bill values((select dbms_random.string('X', 6) str from dual),'Cake');
#Customer Table Creation
create table customer(
Name varchar(10) Not NULL,
custid int not Null,
primary key(custid));
#Customer Table Insertion
insert into customer values((select dbms_random.value(1,10000) num from dual),'Bilal Atiq'); 
insert into customer values((select dbms_random.value(1,10000) num from dual),'Ahsan Raza');
insert into customer values((select dbms_random.value(1,10000) num from dual),'AliRaza');
insert into customer values((select dbms_random.value(1,10000) num from dual),'Nauman'); 
insert into customer values((select dbms_random.value(1,10000) num from dual),'Saadi');
insert into customer values((select dbms_random.value(1,10000) num from dual),'Danish');
# waiter table creation
create table waiter(
wid int  Not Null,
Name varchar(30) Not Null,
primary key (wid));

CREATE SEQUENCE CID
MINVALUE 100
START WITH 1011
INCREMENT BY 3
CACHE 10;

# waiter table insertion
insert into waiter values(WID.nextval,'Aslam');
insert into waiter values(WID.nextval,'Aleem');
insert into waiter values(WID.nextval,'Waleed');
#Item table creation
create table item(
itemno int not null,
quantity int not null,
price int not null,
description varchar(20),
primary key(itemno)); 
CREATE SEQUENCE itemno
MINVALUE 3000
START WITH 3001
INCREMENT BY 2
CACHE 10;
#waiter table insertion
insert into item values(itemno.nextval,5,3000,'Family Size Pizza');
insert into item values(itemno.nextval,5,400,'Zinger Burger');
insert into item values(itemno.nextval,5,600,'Russian Salad');
insert into item values(itemno.nextval,4,1500,'Chicken Macroni');
insert into item values(itemno.nextval,1,500,'Chicken Burger');
insert into item values(itemno.nextval,2,1800,'Mutton Khardai');
#chef table creation
create table chef(
chefid int not null,
chefname varchar(20) not null,
primary key(chefid));

CREATE SEQUENCE chefid
MINVALUE 700
START WITH 702
INCREMENT BY 3
CACHE 10;
#chef table insertion
insert into chef values(chefid.nextval,'Murtaza');
insert into chef values(chefid.nextval,'Kareem');
insert into chef values(chefid.nextval,'Mubeen');

#order table creation
create table orders(
orderid int not null,
noofitem int not null,
primary key(orderid));

CREATE SEQUENCE orderid
MINVALUE 2000
START WITH 2002
INCREMENT BY 8
CACHE 10;

#order table insertion
insert into orders values(orderid.nextval,5);
insert into orders values(orderid.nextval,3);
insert into orders values(orderid.nextval,4);
insert into orders values(orderid.nextval,2);
insert into orders values(orderid.nextval,1);
insert into orders values(orderid.nextval,7);
#cashier and Returant Relationship
alter table cashier 
add NAME varchar(20);
alter table resturant 
add CID int;
alter table cashier add constraint fk_ME foreign key(NAME) references resturant(NAME);
alter table resturant add constraint fk_NE foreign key(CID) references cashier(CID);
 update cashier
 set NAME='Sheraz'
 where CID=111;
 update cashier
 set NAME='Sheraz'
 where CID=91;
update resturant
 set CID=91
 where where NAME='Sheraz';
#Bill and Cashier Relationship
create table paidto(
CID int,
BILLNO varchar(20),
foreign key(CID) references cashier(CID),
foreign key(BILLNO) references BILL(BILLNO));
insert into paidto values(91,'UQ9MJ4');
insert into paidto values(111,'Z94RU5');
insert into paidto values(91,'FEPDC7');
#Bill and Customer Relationship
create table pays(
CUSTID int ,
BILLNO varchar(20),
foreign key(BILLNO) references BILL(BILLNO)
foreign key(CUSTID) references customer(custid));
insert into pays values(387,'UQ9MJ4');
insert into pays values(969,'Z94RU5');
insert into pays values(996,'FEPDC7');
insert into pays values(7825,'LUOSVK');
insert into pays values(279,'0PXDN3');
insert into pays values(7391,'A04UHS');
#Customer and Waiter Relationship
create table deliversto(
CUSTID int,
WID int,
foreign key(CUSTID) references customer(custid),
foreign key(WID) references waiter(WID));
insert into deliversto values(387,1011);
insert into deliversto values(969,1014);
insert into deliversto values(996,1017);
insert into deliversto values(7825,1011);
insert into deliversto values(279,1014);
insert into deliversto values(7391,1017);
#Item and Order relationship
create table contains(
ITEMNO int,
ORDERID int,
foreign key(ITEMNO) references item(ITEMNO),
foreign key(ORDERID) references orders(ORDERID));
insert into contains values(3001,2002);
insert into contains values(3005,2002);
insert into contains values(3003,2010);
insert into contains values(3005,2010);
insert into contains values(3005,2018);
insert into contains values(3021,2082);
insert into contains values(3023,2090);
insert into contains values(3025,2098);
#Order and chef relationship
create table Prepare (
ORDERID int,
CHEFID int,
foreign key(ORDERID) references orders(ORDERID),
foreign key(CHEFID) references chef(CHEFID));

insert into prepare values(2002,702);
insert into prepare values(2010,702);
insert into prepare values(2010,708);
insert into prepare values(2018,705);
insert into prepare values(2082,705);
insert into prepare values(2090,708);
insert into prepare values(2098,702);

#customer and orders relationship


create table places (
custid int,
orderid int,
foreign key(custid) references customer(custid),
foreign key(orderid) references orders(orderid));

insert into places values(969,2010);
insert into places values(996,2018);
insert into places values(387,2002);
insert into places values(7825,2082);
insert into places values(279,2090);
insert into places values(7391,2098);


#waiter and orders relationship

create table taken_by (
wid int,
orderid int,
foreign key(wid) references waiter(wid),
foreign key(orderid) references orders(orderid));

insert into taken_by values(1011,2010);
insert into taken_by values(1011,2018);
insert into taken_by values(1017,2002);
insert into taken_by values(1011,2082);
insert into taken_by values(1011,2090);
insert into taken_by values(1017,2098);

#managers and orders relationship

create table takes (
mgrid int,
orderid int,
foreign key(mgrid) references managers(mgrid),
foreign key(orderid) references orders(orderid));

insert into takes values(31,2010);
insert into takes values(31,2018);
insert into takes values(34,2002);
insert into takes values(34,2082);
insert into takes values(34,2090);
insert into takes values(37,2098);

#managers and chef relationship
create table tells(
mgrid int,
CHEFID int,
foreign key(mgrid) references managers(mgrid),
foreign key(CHEFID) references chef(CHEFID));
insert into takes values(31,702);
insert into takes values(34,705);
insert into takes values(37,708);
#managers and resturant relationship
create table has(
NAME varchar(20),
mgrid int,
foreign key(mgrid) references managers(mgrid),
foreign key(NAME) references resturant(NAME));
#has table insertion
insert into has values('Sheraz',31);
insert into has values('Sheraz',34);
insert into has values('Sheraz',37);
