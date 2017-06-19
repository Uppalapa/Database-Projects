--QUERIES
____________________________________________________________________________________________________________________________________________________________________
--Query1
--Find how many customers are there group by category

SELECT Customer_Type, count(Customer_Type) as Total
FROM anra.customer
GROUP BY Customer_Type;

--Query2
--Find 2 appartments whose name is emerald or their id is 11003
SELECT Address_ID, Appartment_Name, Zipcode_ID
  FROM   anra.address
  WHERE (Appartment_Name= 'Emerald' OR Zipcode_ID = '11003')
  ORDER BY Zipcode_ID DESC
  Limit 2;

--Query3
--Find the supplied product count and their group for each product 

select anra.supplier.Supplier_ID,anra.supplier.Supplier_Name, Count(anra.product.Group_ID) AS `Product Count`, anra.`product group`.Group_Name
from
    anra.supplier
        inner join 
    anra.product
        on  anra.supplier.Supplier_ID=anra.product.Supplier_ID 
        inner join 
    anra.`product group`
        on anra.product.Group_ID=anra.`product group`.Group_ID
        
Group by Supplier_ID Asc

--Query4
--Total number of orders to be shipped immediate and is partially Shipped

  SELECT Order_ID, Order_Date,`Status`,count(Order_ID) as Total
  FROM   anra.orders
  WHERE (Shippent_Duration= 'Immediate' and`Status`='Partially Shipped')
  ORDER BY Order_ID DESC;

--Query5
--List of products by department which has high defect%

SELECT anra.reviews.Product_ID,anra.product.Product_Name,
MAX(anra.reviews.`Defect%`) As `Defect%`, anra.`product group`.Group_Name
from
    anra.reviews
        inner join 
    anra.product
        on  anra.reviews.Product_ID=anra.product.Product_ID
        inner join 
    anra.`product group`
        on anra.product.Group_ID=anra.`product group`.Group_ID
 Group by `product group`.Group_ID
 
 --Query6
 --Total amount of revenue earned with respect to their purchasing modes
 
Select  count(Payment_Mode) As Total_Cutomers, anra.payment.Payment_Mode,Sum(anra.bill.Amount_Paid) 
As Total_Amount
from anra.payment 
inner join
anra.bill
on anra.payment.Payment_ID=anra.bill.Payment_ID
group by Payment_Mode



 --Query7
 --Find The quantity of products available whose status is in progress and shipment duration is immediate
 
 
 SELECT anra.product.Product_Name,anra.product.Available_Number,`order product`.Quantity,orders.Order_Date, orders.`Status`,orders.Shippent_Duration
from
    anra.orders
        inner join 
    anra.`order product`
        on  anra.orders.Order_ID=anra.`order product`.Order_ID
        inner join
       anra.product
       on  anra.`order product`.Product_ID=anra.product.Product_ID
   where 
   orders.`Status`='In Progress' and orders.Shippent_Duration='Immediate';

--Query8
--Find the names and defect% order by defect% 
SELECT Product_Name,`Defect%`
FROM anra.product
INNER JOIN anra.reviews
ON anra.reviews.Product_ID=anra.product.Product_ID
ORDER BY `Defect%` Desc;

--Query9
--Find Customers payment ID,mode, vocher applied and their visist number
SELECT anra.bill.Voucher_id, anra.payment.Payment_ID, anra.payment.Payment_Mode, anra.payment.Visit_Number 
FROM   anra.bill,anra.payment
WHERE anra.payment.Payment_ID=anra.bill.Payment_ID 
AND anra.bill.Amount_Paid> 1000;

--Query10
--Find product and their respective colour
SELECT Product_Name, Colour
FROM anra.`product details`
INNER JOIN anra.product
ON anra.`product details`.Product_ID=anra.product.Product_ID order by colour

--Query11
--Find the product Names their respective groups
SELECT
Group_Name, Product_Name
FROM anra.`product group`
INNER JOIN anra.product
ON anra.`product group`.Group_ID=anra.product.Group_ID Order by Group_Name




--TRIGGERS
_________________________________________________________________________________________________________________________________________________
--Trigger1
--Find Customer name and updated time on customers table 
create table 
UpdateCustomerDetails
(Customer_id int, First_Name varchar(20), update_time Datetime)


delimiter \\
create trigger UpdateCustomerDetails_trigger
after update on customer
for each row
begin
declare new_date datetime;
set new_date=now();

insert into UpdateCustomerDetails(Customer_id,First_Name,update_time)
values(old.Customer_ID,old.First_Name, new_date);

end \\

--when customers details are updated the trigger is set
update customer set Email_Address='naynaa@gmail.com'
where Customer_ID=10000

--updates can be seen in the newly created table
select * from UpdateCustomerDetails



--Trigger2
--Trigger3
--Trigger4

--Stored_Procedure
_______________________________________________________________________________________________________________________________________________
--1
--Stored procedure to find most deffective product from each product group
call GetMostDeffective_Product()

delimiter//
Create Procedure GetMostDeffective_Product()
Begin
SELECT anra.reviews.Product_ID,anra.product.Product_Name,MAX(anra.reviews.`Defect%`) As `Defect%`, anra.`product group`.Group_Name
from
    anra.reviews
        inner join 
    anra.product
        on  anra.reviews.Product_ID=anra.product.Product_ID
        inner join 
    anra.`product group`
        on anra.product.Group_ID=anra.`product group`.Group_ID
 Group by `product group`.Group_Name
 end//

--2
--Stored procedure for employee assesment
call GetEmployee_Assesment ()

delimiter//
Create Procedure GetEmployee_Assesment ()
Begin
Select count(anra.customer.Customer_ID) as Total_Cutomers ,anra.customer.Employee_ID,anra.employee.Designation,Salary
from  anra.customer
Inner Join
anra.employee
on
anra.employee.Employee_ID=anra.customer.Employee_ID 
group by Employee_ID
order by count(anra.customer.Customer_ID) ;
end//

--3
--Stored procedure to find customer details of highest Amount_Paid
call findMaxBill()

delimiter//
Create Procedure findMaxBill() 
Begin
	select Max(anra.bill.Amount_Paid) As GreatestPurchase, anra.customer.Customer_ID,anra.customer.First_Name from anra.bill
        inner join 
    anra.payment
        on  anra.payment.Payment_ID=anra.bill.Payment_ID
        inner join 
    anra.Customer
        on anra.payment.Customer_ID=anra.customer.Customer_ID;
end//

--Views
___________________________________________________________________________________________________________________________________________
--1
--Student as customer views

create view StudentAsCustomer as ( select * from customer where Customer_Type = 'Student')

--2
--Product details with minimum defect% and high rating
create view LeastDefectHighRating as
(select product.Product_Name, min(reviews.`Defect%`), max(reviews.Quality_Rating)
from anra.reviews
inner join 
anra.product
on anra.reviews.Product_ID=anra.product.Product_ID)


--3
--Products and the colours available
create view ProductandAvailableColours as
(SELECT Product_Name, Colour
FROM anra.`product details`
INNER JOIN anra.product
ON anra.`product details`.Product_ID=anra.product.Product_ID order by colour)


--4
--Distinct employee departments whose salary is greater than 1200 limit to 4
create view DistinctEmployeeDepartments as
(Select DISTINCT anra.employee.Designation,anra.employee.Employee_Name,anra.employee.Department
From anra.employee
Where anra.employee.salary>1200 limit 4)

--5
--
Create view TotalAmount as Total amount of revenue earned with respect to their purchasing modes
(Select  count(Payment_Mode) As Total_Cutomers, anra.payment.Payment_Mode,Sum(anra.bill.Amount_Paid) 
As Total_Amount
from anra.payment 
inner join
anra.bill
on anra.payment.Payment_ID=anra.bill.Payment_ID
group by Payment_Mode)


--6
Select count(anra.customer.Customer_ID) as Total_Customers, anra.customer.Emploee_ID,anra.emploee.Designation
From anra.customer
Inner Join
anra.employee
on anra.employee.Employee_ID=anra.customer.Employee_ID
group by Employee_ID
order by count(anra.customers.Customer_ID) desc

--7
--View Salary of employee group by type and department
create view SalaryGroupbyType as
(Select Salary, Employee_Type,Department
From anra.employee
Group by Employee_Type,Department)





























