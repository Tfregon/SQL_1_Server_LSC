CREATE DATABASE midterm_db

Create Table SUPPLIER(
ID INT NOT NULL PRIMARY KEY,
CompanyName NVARCHAR(100),
ContactName NVARCHAR(100),
City NVARCHAR(100),
Country NVARCHAR(100),
Phone int,
Fax int)

Create Table PRODUCT(
ID INT NOT NULL PRIMARY KEY,
ProductName NVARCHAR(100),
Supllierld NVARCHAR(100),
UnitPrice decimal (38,2),
Package NVARCHAR(100),
IsDiscontinued bit
)

Create Table ORDERITEM(
ID INT NOT NULL PRIMARY KEY,
Orderid int,
Productid int,
UnitPrice decimal (38,2),
Quantity int
)

Create Table ORDER_MD(
ID INT NOT NULL PRIMARY KEY,
OrdeDate date,
Customerid int,
TotalAmount int
)

Create Table Customer(
ID INT NOT NULL PRIMARY KEY,
FirstName NVARCHAR(100),
LastName NVARCHAR(100),
City NVARCHAR(100),
Country NVARCHAR(100),
Phone int
)

CREATE TRIGGER SeeTheDifference ON PRODUCT AFTER UPDATE
AS
BEGIN
SELECT ID,ProductName,Supllierld,UnitPrice,Package,IsDiscontinued FROM deleted
end

INSERT INTO SUPPLIER VALUES 
(001,'DOM BOSCO','NIVALDO','ALTO GARCAS','EUA',55955566,44454455),
(002,'ABC','JOSE','BBU','BRASIL',54445566,44455666),
(003,'OSCO','ROB','ROO','CANADA',45955566,11555999),
(004,'MMC','DONAL','MOTR','EUA',54115566, 44555555),
(005,'UFC','DHANA','TORONT','CANADA',55954565, 44444557)

INSERT INTO PRODUCT VALUES 
(001, 'COCA', 'PEPSICO', 10.99, 'PLASTICBOTTLE', 0),
(002, 'BOTTLE', 'MDN', 15.75, 'BOTTLEGLASS', 1),
(003, 'PC', 'MMM', 8.50, 'BOXSMALL', 0),
(004, 'TV', 'CCC', 20.25, 'BOX', 1),
(005, 'MOBILE', 'ADE', 12.00, 'BOX', 0);

INSERT INTO ORDERITEM VALUES
(001, 1001, 101, 20.99, 3),
(002, 1001, 102, 15.75, 2),
(003, 1002, 103, 8.50, 5),
(004, 1002, 101, 20.25, 1),
(005, 1003, 104, 12.00, 4);

INSERT INTO ORDER_MD VALUES
(001, '2023-01-15', 501, 150.50),
(002, '2023-02-22', 502, 75.25),
(003, '2023-03-10', 503, 200.00),
(004, '2023-04-05', 504, 120.75),
(005, '2023-05-18', 505, 300.00);

INSERT INTO Customer VALUES
(001, 'John', 'Doe', 'New York', 'USA', 12345690),
(002, 'Jane', 'Smith', 'Los Angeles', 'USA', 98763210),
(003, 'Carlos', 'Garcia', 'Mexico City', 'Mexico', 55514567),
(004, 'Sophie', 'Martin', 'Paris', 'France', 33399988),
(005, 'Makoto', 'Tanaka', 'Tokyo', 'Japan', 11122233);

UPDATE PRODUCT
SET Package = 'BIGBOX' WHERE ID=003

--. Implement one stored procedure for each table and they should delete a specific record according to
-- the given id.

CREATE PROCEDURE SupplierDeleteRec 
    @IDToDelete INT
AS
BEGIN
    DELETE FROM SUPPLIER WHERE ID = @IDToDelete
END;

EXEC SupplierDeleteRec @IDToDelete = 005

SELECT * FROM SUPPLIER
---------------------------------------------------
CREATE PROCEDURE ProductDeleteRec 
    @IDToDelete INT
AS
BEGIN
    DELETE FROM PRODUCT WHERE ID = @IDToDelete
END;

EXEC ProductDeleteRec @IDToDelete = 005

SELECT * FROM PRODUCT
-----------------------------------------------------
CREATE PROCEDURE OrderItemDeleteRec 
    @IDToDelete INT
AS
BEGIN
    DELETE FROM ORDERITEM WHERE ID = @IDToDelete
END;

EXEC OrderItemDeleteRec @IDToDelete = 005

SELECT * FROM ORDERITEM
-----------------------------------------------------
CREATE PROCEDURE OrderMDDeleteRec 
    @IDToDelete INT
AS
BEGIN
    DELETE FROM ORDER_MD WHERE ID = @IDToDelete
END;

EXEC OrderMDDeleteRec @IDToDelete = 005

SELECT * FROM ORDER_MD
-----------------------------------------------------
CREATE PROCEDURE CustomerDeleteRec 
    @IDToDelete INT
AS
BEGIN
    DELETE FROM Customer WHERE ID = @IDToDelete
END;

EXEC CustomerDeleteRec @IDToDelete = 005

SELECT * FROM Customer
-----------------------------------------------------
