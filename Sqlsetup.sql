create database ATM;

use ATM;

 create table admin 
 ( adminID int not null primary key,
 admin_name varchar(100) not null,
 account_no varchar(100) not null,
 PINcode int not null,
 attempts int default 0);

 create table Manager
 ( managerID int not null primary key,
 manager_name varchar(100) not null,
 account_no varchar(100) not null,
 PINcode int not null,
 attemps int default 0 );
 

 create table client_details
 ( userID int not null primary key,
  client_name varchar(100) not null,
 account_no varchar(100) not null,
 PINcode int not null,
 contact_no bigint not null,
 balance bigint,
 attempts int default 0
 );

 
 create table transaction_history
 ( transID int not null primary key,
 transdate date not null,
 total_amount bigint not null,
 status varchar(100) not null,
 transtype varchar(100) not null);

 create table ATM_cash
(cash_available bigint not null,
transID int not null foreign key references transaction_history(transID),
transtime datetime not null
);

create table transferer
(
transID not null foreign key references transaction_history(transID),
userID int foreign key references client_details(userID),
managerID int foreign key references manager(managerID)
);

insert into Admin values( 1,'adminname','admin',1234,0);

select * from Manager;
select * from admin;
select * from transaction_history;
select * from client_details;
select * from ATM_cash;
select * from Transferer;
