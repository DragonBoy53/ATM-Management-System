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
 attempts int default 0 );
 

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
transID int not null foreign key references transaction_history(transID),
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

--*****Store Procedure that handles user transactions:******
go
CREATE PROCEDURE Add_Transaction
@user_accno varchar(100),
@transferee_accno varchar(100), --In case of a transfer
@amount bigint,
@transtype varchar(100),
@flag int OUTPUT --1 for successful transaction, 0 for low balance
AS
--Generate a new unique transID
DECLARE @trans_id int;
SET @trans_id=(SELECT ISNULL(MAX(transID),0)+1 FROM transaction_history)
--Fetch the current ATM cash level from ATM_cash
DECLARE @curr_ATMcash bigint;
SET @curr_ATMcash= (SELECT cash_available FROM ATM_cash WHERE transtime=(SELECT MAX(transtime) FROM Atm_cash));
--Fetch the user's current balance from client_details
DECLARE @current_balance bigint;
SET @current_balance = (SELECT balance FROM client_details WHERE account_no=@user_accno);
--Fetch the user's ID from client_details
DECLARE @user_id int;
SET @user_id = (SELECT userID FROM client_details WHERE account_no=@user_accno);
--No check needed in case of deposit
if (@transtype='Deposit')
BEGIN
	INSERT INTO transaction_history 
	VALUES
	(@trans_id,GETDATE(),@amount,'Completed',@transtype);
	--Update the user's balance
	UPDATE client_details
	SET balance=balance+@amount
	WHERE account_no=@user_accno;
	--Enter new ATM cash level
	INSERT INTO ATM_cash
	VALUES
	(@curr_ATMcash+@amount,@trans_id,GETUTCDATE());
	--Set flag
	SET @flag=1;	
END
--In case of withdraw or transfer, first check if user's balance is sufficient
else if (@current_balance>=@amount)
BEGIN 
	--Insert into transaction table
	INSERT INTO transaction_history
	VALUES
	(@trans_id,GETDATE(),@amount,'Completed',@transtype);
	--Update the user's balance
	UPDATE client_details
	SET balance=balance-@amount
	WHERE account_no=@user_accno;
	--If transferee is a registered user in the database, update his/her balance
	if EXISTS (SELECT* FROM client_details WHERE account_no=@transferee_accno)
	BEGIN
		UPDATE client_details
		SET balance=balance+@amount
		WHERE account_no=@transferee_accno;
	END
	else
	BEGIN
		--Enter new ATM cash level
		INSERT INTO ATM_cash
		VALUES
		(@curr_ATMcash-@amount,@trans_id,GETUTCDATE());
	END
	--Set flag
	SET @flag=1;	
END
else --Low Balance
BEGIN 
	INSERT INTO transaction_history
	VALUES
	(@trans_id,GETDATE(),@amount,'Failed! Low Balance',@transtype);
	SET @flag=0;	
END
--Make relevant entry in transferer table
INSERT INTO Transferer
VALUES
(@trans_id,@user_id,NULL);
go
