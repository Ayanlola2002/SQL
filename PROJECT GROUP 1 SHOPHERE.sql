create database ShopHere
use ShopHere
go
---------------------------------TABLE: ITEMS.ITEM DETAILS------------------------------------------

Create table Items.ItemDetails
(
               ItemID int identity(001,1) not null,
               ItemName char(30)not null,
               ItemDescription varchar(50)not null,
               UnitPrice money,
               QuantityInHand smallint,
               Reorderlevel int,
               ReorderQuantity smallint,
               CategoryID int,
               SupplierID int
)
------------------------------------------------alter item details--------------------------------------------------
------making ItemID  primary key--------------
alter table Items.ItemDetails
add constraint pk_ItemDetails_IteamID primary key(ItemID)

-----QuantityInHand should be greater than zero-------------
alter table Items.ItemDetails
add constraint ck_ItemDetails_QuantityInHand check(QuantityInHand >0)
go


--------unitprice should be greater than zero---------
alter table Items.ItemDetails
add constraint ck_ItemsDetails_UnitPrice check(UnitPrice >0)

------ReORDErQuantity should be greater than zero------
alter table Items.ItemDetails
add constraint ck_ItemsDetails_ReorderQuantity check(ReorderQuantity >0)

---------ReorderLevel should be greater than zero----------------
alter table Items.ItemDetails
add constraint ck_ItemsDetails_Reorderlevel check(Reorderlevel >0)

----------categoryID should be the foreign key of productcategory table
alter table Items.ItemDetails
add constraint fk_ItemsDetails_CategoryID foreign key(CategoryID) References Items.ProductCategory(CategoryID)
-------------------Inserting data into rows---------------------------------------------------------------------------------
Insert Items.ItemDetails (ItemName,ItemDescription,UnitPrice,QuantityInHand,Reorderlevel,ReorderQuantity)
Values ('Hand Drier','It is used for drying hair',1500,5000,50,10000)
Insert Items.ItemDetails (ItemName,ItemDescription,UnitPrice,QuantityInHand,Reorderlevel,ReorderQuantity)
Values('Piriton Syrup','Cough medicine',500,10000,90,20000)
Insert Items.ItemDetails (ItemName,ItemDescription,UnitPrice,QuantityInHand,Reorderlevel,ReorderQuantity)
Values('Tissue Paper','Toiletries',200,5000,40,25000)
Insert Items.ItemDetails (ItemName,ItemDescription,UnitPrice,QuantityInHand,Reorderlevel,ReorderQuantity)
Values(004,'Laptops','Official Stationery',1000,20000,20,27000)
Insert Items.ItemDetails (ItemName,ItemDescription,UnitPrice,QuantityInHand,Reorderlevel,ReorderQuantity)
Values('Toothpaste','Healthcare',50,1000,80,5000)

---------------------------TABLE: ITEMS.PRODUCTCATEGORY--------------------------------------------------------------------------------------------
create table Items.ProductCategory
(
CategoryID int identity (001,1) not null,
CategoryName char(20) not null,
CategoryDescription varchar(40)
)
------------ALTER ProductCategory------------------------------------------------------
alter table Items.ProductCategory
add constraint pk_ProductCategory_CategoryID primary key(CategoryID)

--------CATEGORY name should be Household,Sports, Accessories, or clothing---------------------------
alter table items.productcategory
add constraint ck_categoryname check (categoryname In ('Household','Sports','Accessories','Clothing'))

--------------------------Inserting Data into Items.ProductCategory table-----------------------------
Insert Items.ProductCategory(categoryname,CategoryDescription)
values ('Household','Domestic use')
Insert Items.ProductCategory(categoryname,CategoryDescription)
values ('Sports','Outdoor and Aesthetic use')
Insert Items.ProductCategory(categoryname,CategoryDescription)
values ('Accessories','Personal and Official Use')
Insert Items.ProductCategory(categoryname,CategoryDescription)
values ('Clothing','Fashion')

select *
from Items.ProductCategory

---------------------TABLE:SUPPLIER.SUPPLIERDETAILS---------------------------------------------------

Create table Supplier.SupplierDetails
(
              SupplierID int identity(001,1) not null,
              FirstName char(20) not null,
              LastName char(20) not null,
              Address varchar(40) not null,
              Phone char(30) not null,
              Country char(20) not null,
              SupplierLocation geography
)
----------------Alter SupplierDetails----------------------------------------------------------------------------------------------------------------
-------PK constraint---------------------------------------------------------------------------------------------------------------------------------
AlTER table Supplier.SupplierDetails
add constraint pk_SupplierDetails_SupplierID PRIMARY KEY(SupplierID)
-----------------------------altering phone number format--------------------------------------------------------------------------------------------
alter table Supplier.SupplierDetails
add constraint ck_SupplierDetails_Phone check (Phone like '([0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]')

-----------------------------iNSERTING DATA INTO SUPPLIER.SUPPLIERDETAILS----------------------------------------------------------------------------

Insert Supplier.SupplierDetails(FirstName,LastName,Address,Phone,Country)
Values ('Badmus','Farez','3,Creek Avenue. Pakistan','99-342-1781-013-492','Pakistan')
Insert Supplier.SupplierDetails(FirstName,LastName,Address,Phone,Country)
Values ('Cloey','Murrow','Plot 655, Ministry works.Dubai','89-932-5489-101-311','Arab Emirates')
Insert Supplier.SupplierDetails(FirstName,LastName,Address,Phone,Country)
Values ('Barat','Pool','Palm Avenue-Block3. Texas','77-543-2187-117-121','USA')
Insert Supplier.SupplierDetails(FirstName,LastName,Address,Phone,Country)
Values ('Omonigho','Dehsmurk','New Dehli Bank,Sarot Midway','88-654-3217-967-744','India')
Insert Supplier.SupplierDetails(FirstName,LastName,Address,Phone,Country)
Values ('Frank','Bandel','546 Maryland Turn, off Laneburk','75-657-322-221-114','UK')

Select*
From Supplier.SupplierDetails

------------------------------------HumanResources------------------------------------------
use ShopHere
create table HumanResources.Employee
(
              EmployeeID int identity (001,1) not null,
              FirstName char(20) not null,
              LastName char(20)not null,
              City char(20)not null,
              Phone char(20) not null
)
---primary key----
alter table HumanResources.Employee
add constraint pk_Employee_EmployeeID PRIMARY KEY (EmployeeID)
-----adding constraint to phone_no--------------------------------------------
alter table HumanResources.Employee
add constraint ck_Employee_Phone_no 
check (Phone_no like '([0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]')

--------alter employee---------------------------------------------------------------------------
Insert HumanResources.Employee (FirstName,LastName,City,Phone)
values ('Ifeoma','Chukwuka','Lagos,Nigeria','44-222-7355-222-114')
Insert HumanResources.Employee (FirstName,LastName,City,Phone)
values ('Favour','Bishmurk','Cotonou,Benin','31-498-7182-666-421')
Insert HumanResources.Employee (FirstName,LastName,City,Phone)
values ('Savitar','Soham','Dakar ,Senegal', '22-471-6285-774-201')
Insert HumanResources.Employee (FirstName,LastName,City,Phone)
values ('Sachen','Tejuswala','Bamako, Mali', '18-792-3854-221-885')
Insert HumanResources.Employee (FirstName,LastName,City,Phone)
values ('Archana','Darmish','Johannesburg,SA', '22-771-8532-515-999')
Insert HumanResources.Employee (FirstName,LastName,City,Phone)
values ('Purvi','Swarez','Calabar,Nigeria', '23-480-7724-851-920')

select *
from HumanResources.Employee


-----------Table: HumanResources.EmpPhoto----------------------------------------------------------------------------------------------

create table HumanResources.EmpPhoto
(
PhotoID uniqueidentifier rowguidcol not null unique,
EmployeeID int not null,
EmployeePhoto varbinary(max)FILESTREAM
)
----primary key-----------------------------------------------------------------------------------
ALTER TABLE HumanResources.EmpPhoto
add constraint pk_EmpPhoto_EmployeeID primary key (EmployeeID)

-----------foreign key employeeid-----------------------------------------------------------------
alter table HumanResources.Employee
add constraint fk_Employee_EmployeeID foreign key(EmployeeID) references HumanResources.EmpPhoto(EmployeeID)

-------------ALTERING empPhoto----------------------------------------------------------------------
INSERT HumanResources.EmpPhoto (employeeId,PhotoID,EmployeePhoto)
VALUES(001,NEWID(),CAST('C:\Users\Sister Dorcas\Desktop\EMP PHOTO\DSC_0120' AS VARBINARY (MAX)))

INSERT HumanResources.EmpPhoto (employeeId,PhotoID,EmployeePhoto)
VALUES(002,NEWID(),CAST('C:\Users\Sister Dorcas\Desktop\EMP PHOTO\DSC_0134' AS VARBINARY (MAX)))

INSERT HumanResources.EmpPhoto (employeeId,PhotoID,EmployeePhoto)
VALUES(003,NEWID(),CAST('C:\Users\Sister Dorcas\Desktop\EMP PHOTO\DSC_0004' AS VARBINARY (MAX)))

INSERT HumanResources.EmpPhoto (employeeId,PhotoID,EmployeePhoto)
VALUES(004,NEWID(),CAST('C:\Users\Sister Dorcas\Desktop\EMP PHOTO\DSC_0010' AS VARBINARY (MAX)))

INSERT HumanResources.EmpPhoto (employeeId,PhotoID,EmployeePhoto)
VALUES(005,NEWID(),CAST('C:\Users\Sister Dorcas\Desktop\EMP PHOTO\DSC_0028' AS VARBINARY (MAX)))

INSERT HumanResources.EmpPhoto (employeeId,PhotoID,EmployeePhoto)
VALUES(006,NEWID(),CAST('C:\Users\Sister Dorcas\Desktop\EMP PHOTO\DSC_0043' AS VARBINARY (MAX)))

INSERT HumanResources.EmpPhoto (employeeId,PhotoID,EmployeePhoto)
VALUES(007,NEWID(),CAST('C:\Users\Sister Dorcas\Desktop\EMP PHOTO\DSC_0055' AS VARBINARY (MAX)))

INSERT HumanResources.EmpPhoto (employeeId,PhotoID,EmployeePhoto)
VALUES(008,NEWID(),CAST('C:\Users\Sister Dorcas\Desktop\EMP PHOTO\DSC_0066' AS VARBINARY (MAX)))

INSERT HumanResources.EmpPhoto (employeeId,PhotoID,EmployeePhoto)
VALUES(009,NEWID(),CAST('C:\Users\Sister Dorcas\Desktop\EMP PHOTO\DSC_0069' AS VARBINARY (MAX)))

INSERT HumanResources.EmpPhoto (employeeId,PhotoID,EmployeePhoto)
VALUES(010,NEWID(),CAST('C:\Users\Sister Dorcas\Desktop\EMP PHOTO\DSC_0071' AS VARBINARY (MAX)))


-------------table: Transaction.Orderdetails--------------------------------------------------

create table Transactions.OrderDetails
(
PurchaseOrderID int identity (001,1) not null,
EmployeeID int,
OrderDate datetime,
RecievingDate datetime null,
ItemID int,
QuantityOrdered int,
QuantityRecieved smallint null,
UnitPrice money,
ShipMethod char (20),
OrderStatus char(40)
)
---------------------------------------Altering ORDERDETAILS----------ALTERING-----
Alter table Transactions.OrderDetails
add constraint pk_PurchaseOrderID primary key (PurchaseOrderID)
-----------------order date should be greater than 0----------------- 
ALTER TABLE Transactions.OrderDetails
add constraint ck_OrderDate check(OrderDate < getdate())

ALTER TABLE Transactions.OrderDetails
add constraint ck_OrderDetails_QuantityOrdered check(QuantityOrdered > 0)
--------------------------------------
ALTER TABLE Transactions.OrderDetails
add constraint ck_OrderDetails_QuantityRecieved check(QuantityRecieved > 0)
------------------------------------------
ALTER TABLE Transactions.OrderDetails
add constraint ck_OrderDetails_UnitPrice check(UnitPrice > 0)
------------------------------------------
ALTER TABLE Transactions.OrderDetails
add constraint ck_OrderDetails_Quantities check(QuantityRecieved < QuantityOrdered)
-------------------------------------
alter table Transactions.OrderDetails
add constraint ck_OrderDetails_recievingdate_orderdate check(RecievingDate>OrderDate)
------------------------------------------
---INSERTING DATA INTO TRANSACTION.ORDERDETAILS-------------------------------------
Insert Transactions.OrderDetails (OrderDate,RecievingDate,QuantityOrdered,QuantityRecieved,UnitPrice,ShipMethod,OrderStatus)
values ('2013-07-09 10:18:02.870', '2014-01-10 09:18:02.870',15000,10000,200,'Airfreight','Received')

Insert Transactions.OrderDetails (OrderDate,RecievingDate,QuantityOrdered,QuantityRecieved,UnitPrice,ShipMethod,OrderStatus)
values ('2013-04-08 09:18:01.557','2014-01-10 09:18:02.870',870,5000,500,'Seafreight','In Transit')

Insert Transactions.OrderDetails (OrderDate,RecievingDate,QuantityOrdered,QuantityRecieved,UnitPrice,ShipMethod,OrderStatus)
values (DATEADD(yy, -2, getDate()), '2014-01-18 02:18:02.870',2500,15000,50,'Airfreight','In Transit')

Insert Transactions.OrderDetails (OrderDate,RecievingDate,QuantityOrdered,QuantityRecieved,UnitPrice,ShipMethod,OrderStatus)
values ('2010-05-15 14:28:01.577','2011-01-10 14:28:02.531',7000,4500,1500,'Seafreight','Received')

Insert Transactions.OrderDetails (OrderDate,RecievingDate,QuantityOrdered,QuantityRecieved,UnitPrice,ShipMethod,OrderStatus)
values ('2014-11-18 10:28:01.577','2014-12-30 14:28:02.531',7810,4000,1800,'Seafreight','Received')

Insert Transactions.OrderDetails (OrderDate,RecievingDate,QuantityOrdered,QuantityRecieved,UnitPrice,ShipMethod,OrderStatus)
values ('2014-11-04 05:28:01.577','2015-01-10 14:28:02.531',8200,500,2000,'Airfreight','Received')

Insert Transactions.OrderDetails (OrderDate,RecievingDate,QuantityOrdered,QuantityRecieved,UnitPrice,ShipMethod,OrderStatus)
values ('2014-11-12 03:18:01.577','2015-07-02 10:11:02.571',15000,8000,3000,'Airfreight','Received')

Insert Transactions.OrderDetails (OrderDate,RecievingDate,QuantityOrdered,QuantityRecieved,UnitPrice,ShipMethod,OrderStatus)
values ('2014-11-23 14:28:01.577','2015-03-10 14:28:02.531',20000,12000,7000,'Seafreight','In Transit')

select * From Transactions.OrderDetails

---alter table Transactions.OrderDetails
---add UnitPrice varbinary(max) null---
--go---
--------------use encrypt_test-------------
create symmetric key symmetrickey1
with algorithm=aes_128
ENCRYPTION BY PASSWORD='pa$$word'
go
------using the key created---------
open symmetric key symmetrickey1
decryption by password='pa$$word'
go

update Transactions.OrderDetails
set UnitPrice=ENCRYPTBYKEY (key_guid('symmetrickey1'),UnitPrice)

select *from Transactions.OrderDetails
go
close symmetric key symmetrickey1
go

-------------------------------------creating procedure--------------------------------------
CREATE PROCEDURE Qtyrecieved_QtyInHand
@itemid int
as
declare @QuantityRecieved smallint, @QuantityInhand smallint
select @QuantityRecieved=(select  QuantityRecieved from Transactions.OrderDetails)
select @QuantityInhand=(select QuantityInHand from Items.ItemDetails) 
set @QuantityInhand=@QuantityRecieved
update Items.ItemDetails
set QuantityInHand = @QuantityInhand
where itemid=@itemid
go
-----creating the trigger--------------------------------------------------------------------
create trigger trgquantity
on items.itemdetails
after insert, update
as 
  begin
  declare @QuantityInhand smallint, @QuantityRecieved smallint, @itemid int
  select @QuantityRecieved = ( select QuantityRecieved from Transactions.OrderDetails)
  select @QuantityInhand =(select QuantityInHand from inserted)
  if (@QuantityRecieved is not null)
  begin
     exec Qtyrecieved_QtyInHand @itemid=@itemid
     end
   end
  go
  
  ---------------------------CREATE APPROPRAITE INDEXES------------------------------------
  CREATE 
  
  --------------------CREATE A PROCEDURE TO SIMPLIFY CALCULATION OF TOTAL COST FOR A PARTICULAR ORDER-------------------------------------------------------------------------
  Create proc totalItemCost @orderid int
  as 
  declare @UnitPrice money
  declare @QuantityOrdered int
  declare @total int
  
  select @UnitPrice = (select UnitPrice from Transactions.OrderDetails where PurchaseOrderID = @orderid)
  select @QuantityOrdered = (select QuantityOrdered from Transactions.OrderDetails where PurchaseOrderID = @orderid)
  
  set @total= @UnitPrice * @QuantityOrdered
  Select @total as 'Total Cost of Order'
  go
  
  exec totalItemCost @orderid=2
  ----------------------------CALCULATE THE TOTAL OF ALL ORDERS PLACED BY A-  