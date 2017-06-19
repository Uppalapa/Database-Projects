/*
Created: 12/1/2016
Modified: 12/6/2016
Model: MySQL 5.7
Database: MySQL 5.7
*/


-- Create tables section -------------------------------------------------

-- Table Employee

CREATE TABLE `Employee`
(
  `Designation` Varchar(20),
  `Department` Varchar(20),
  `Join_Date` Date,
  `ssn` Int(9) NOT NULL
)
;

CREATE INDEX `IX_Relationship30` ON `Employee` (`ssn`)
;

ALTER TABLE `Employee` ADD  PRIMARY KEY (`ssn`)
;

-- Table Person

CREATE TABLE `Person`
(
  `First_Name` Varchar(20),
  `Last_Name` Varchar(20),
  `Email_Address` Varchar(20),
  `Phone_Number` Int(10),
  `ssn` Int(9) NOT NULL,
  `Date_Of_Birth` Date
)
;

ALTER TABLE `Person` ADD  PRIMARY KEY (`ssn`)
;

-- Table Orders

CREATE TABLE `Orders`
(
  `Order_ID` Char(4) NOT NULL,
  `Order_Date` Date NOT NULL,
  `Status` Char(20),
  `Shippent_Duration` Varchar(20) NOT NULL,
  `Payment_ID` Char(3) NOT NULL
)
;

CREATE INDEX `IX_Relationship15` ON `Orders` (`Payment_ID`)
;

ALTER TABLE `Orders` ADD  PRIMARY KEY (`Order_ID`)
;

-- Table Customer

CREATE TABLE `Customer`
(
  `Customer_ID` Char(5) NOT NULL,
  `First_Name` Varchar(20) NOT NULL,
  `Last_Name` Varchar(20) NOT NULL,
  `Phone_Number` Int(10) NOT NULL,
  `Email_Address` Varchar(20) NOT NULL,
  `Customer_Type` Varchar(20) NOT NULL
)
;

ALTER TABLE `Customer` ADD  PRIMARY KEY (`Customer_ID`)
;

-- Table Zip Code

CREATE TABLE `Zip Code`
(
  `State` Varchar(20) NOT NULL,
  `Zipcode_ID` Char(5) NOT NULL,
  `City` Varchar(20) NOT NULL,
  `Address_ID` Char(2) NOT NULL
)
;

CREATE INDEX `IX_Relationship6` ON `Zip Code` (`Address_ID`)
;

ALTER TABLE `Zip Code` ADD  PRIMARY KEY (`Zipcode_ID`)
;

-- Table Reviews

CREATE TABLE `Reviews`
(
  `Quality_Rating` Int(1) NOT NULL,
  `Defect%` Int(2) NOT NULL,
  `Review_ID` Varchar(4) NOT NULL,
  `Review_Date` Date
)
;

ALTER TABLE `Reviews` ADD  PRIMARY KEY (`Review_ID`)
;

-- Table Product

CREATE TABLE `Product`
(
  `Product_ID` Char(5) NOT NULL,
  `Product_Name` Varchar(20) NOT NULL,
  `Available_Number` Int(200),
  `Group_ID` Int(3) NOT NULL,
  `Supplier_ID` Char(4) NOT NULL,
  `Review_ID` Varchar(4)
)
;

CREATE INDEX `IX_Relationship1` ON `Product` (`Group_ID`)
;

CREATE INDEX `IX_Relationship2` ON `Product` (`Supplier_ID`)
;

CREATE INDEX `IX_Relationship3` ON `Product` (`Review_ID`)
;

ALTER TABLE `Product` ADD  PRIMARY KEY (`Product_ID`)
;

-- Table Supplier

CREATE TABLE `Supplier`
(
  `Supplier_ID` Char(4) NOT NULL,
  `Supplier_Name` Varchar(20) NOT NULL,
  `Supply_Quantity` Varchar(2000) NOT NULL
)
;

ALTER TABLE `Supplier` ADD  PRIMARY KEY (`Supplier_ID`)
;

-- Table Payment

CREATE TABLE `Payment`
(
  `Payment_ID` Char(3) NOT NULL,
  `Payment_Mode` Varchar(20) NOT NULL,
  `Card_Type` Varchar(20) NOT NULL,
  `Card_Number` Int(12) NOT NULL,
  `CVV` Int(11) NOT NULL,
  `Name_On_Card` Varchar(20) NOT NULL,
  `Customer_ID` Char(5) NOT NULL,
  `Visit_Number` Int NOT NULL
)
;

CREATE INDEX `IX_Relationship11` ON `Payment` (`Customer_ID`)
;

ALTER TABLE `Payment` ADD  PRIMARY KEY (`Payment_ID`)
;

-- Table Employees

CREATE TABLE `Employees`
(
  `Employee_ID` Char(3) NOT NULL,
  `Employee_Name` Varchar(20) NOT NULL,
  `SSN` Int(9) NOT NULL,
  `Designation` Varchar(10) NOT NULL,
  `Employee_Type` Varchar(20) NOT NULL,
  `Salary` Varchar(20) NOT NULL,
  `Payment_ID` Char(3) NOT NULL
)
;

CREATE INDEX `IX_Relationship8` ON `Employees` (`Payment_ID`)
;

ALTER TABLE `Employees` ADD  PRIMARY KEY (`Employee_ID`)
;

-- Table Bill

CREATE TABLE `Bill`
(
  `Billing_ID` Char(5) NOT NULL,
  `Billing_Date` Date NOT NULL,
  `Amount_Paid` Double NOT NULL,
  `Voucher_ID` Varchar(2),
  `Payment_ID` Char(3) NOT NULL,
  `Order_ID` Char(4) NOT NULL
)
;

CREATE INDEX `IX_Relationship4` ON `Bill` (`Voucher_ID`)
;

CREATE INDEX `IX_Relationship9` ON `Bill` (`Payment_ID`)
;

CREATE INDEX `IX_Relationship16` ON `Bill` (`Order_ID`)
;

ALTER TABLE `Bill` ADD  PRIMARY KEY (`Billing_ID`)
;

-- Table Voucher

CREATE TABLE `Voucher`
(
  `Voucher_ID` Varchar(2) NOT NULL,
  `Discount%` Int(2) NOT NULL
)
;

ALTER TABLE `Voucher` ADD  PRIMARY KEY (`Voucher_ID`)
;

-- Table Address

CREATE TABLE `Address`
(
  `Address_ID` Char(2) NOT NULL,
  `Apartment_Number` Int NOT NULL,
  `Street` Varchar(20) NOT NULL,
  `Apartment_Name` Varchar(20) NOT NULL,
  `Customer_ID` Char(5) NOT NULL
)
;

CREATE INDEX `IX_Relationship5` ON `Address` (`Customer_ID`)
;

ALTER TABLE `Address` ADD  PRIMARY KEY (`Address_ID`)
;

-- Table Product Group

CREATE TABLE `Product Group`
(
  `Group_ID` Int(3) NOT NULL,
  `Group_Name` Varchar(20) NOT NULL
)
;

ALTER TABLE `Product Group` ADD  PRIMARY KEY (`Group_ID`)
;

-- Table Order Product

CREATE TABLE `Order Product`
(
  `Quantity` Int(200),
  `Product_ID` Char(5) NOT NULL,
  `Order_ID` Char(4) NOT NULL
)
;

CREATE INDEX `IX_Relationship12` ON `Order Product` (`Product_ID`)
;

CREATE INDEX `IX_Relationship13` ON `Order Product` (`Order_ID`)
;

ALTER TABLE `Order Product` ADD  PRIMARY KEY (`Product_ID`,`Order_ID`)
;

-- Table Product Details

CREATE TABLE `Product Details`
(
  `Product_ID` Char(5) NOT NULL,
  `Weight` Varchar(20),
  `Width` Double(2,2),
  `Height` Double(2,2),
  `Colour` Varchar(20)
)
;

ALTER TABLE `Product Details` ADD  PRIMARY KEY (`Product_ID`)
;

-- Table Customer Category

CREATE TABLE `Customer Category`
(
  `Customer_Category` Varchar(20) NOT NULL,
  `Customer_ID` Char(5) NOT NULL
)
;

ALTER TABLE `Customer Category` ADD  PRIMARY KEY (`Customer_ID`)
;

-- Create relationships section ------------------------------------------------- 

ALTER TABLE `Product` ADD CONSTRAINT `belongs to` FOREIGN KEY (`Group_ID`) REFERENCES `Product Group` (`Group_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Product` ADD CONSTRAINT `supplies` FOREIGN KEY (`Supplier_ID`) REFERENCES `Supplier` (`Supplier_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Product` ADD CONSTRAINT `are given` FOREIGN KEY (`Review_ID`) REFERENCES `Reviews` (`Review_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Bill` ADD CONSTRAINT `is included` FOREIGN KEY (`Voucher_ID`) REFERENCES `Voucher` (`Voucher_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Address` ADD CONSTRAINT `will have` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`Customer_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Zip Code` ADD CONSTRAINT `will zip` FOREIGN KEY (`Address_ID`) REFERENCES `Address` (`Address_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Employees` ADD CONSTRAINT `monitors` FOREIGN KEY (`Payment_ID`) REFERENCES `Payment` (`Payment_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Bill` ADD CONSTRAINT `Generates` FOREIGN KEY (`Payment_ID`) REFERENCES `Payment` (`Payment_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Payment` ADD CONSTRAINT `makes` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`Customer_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Order Product` ADD CONSTRAINT `product order relation` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Order Product` ADD CONSTRAINT `contains` FOREIGN KEY (`Order_ID`) REFERENCES `Orders` (`Order_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Orders` ADD CONSTRAINT `Orders` FOREIGN KEY (`Payment_ID`) REFERENCES `Payment` (`Payment_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Bill` ADD CONSTRAINT `is billed` FOREIGN KEY (`Order_ID`) REFERENCES `Orders` (`Order_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Product Details` ADD CONSTRAINT `has details` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Customer Category` ADD CONSTRAINT `belong` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`Customer_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

