# Database Management for Retail Application
### Problem Statement:
* A Retail business organization (target) is not able to handle and maintain the details of potential market.
* It is unable to manage various employees who belong to various departments, information about the customers and sold products their defects, quality and Voucher details etc.
### Scope of Project: 
*	This project aims to build a database for retail application for an organization like Target where customers buy projects online and offline.
*	Retail application database is mainly used by the retail store administrators to improve their sales by analyze the product sales, customer and employees working in their organization
*	This project helps in designing unique database which holds the information of the business model to properly store, analyze the data that company is looking for  
*	Products list with minimum defects and maximum quality can be know which helps the organization to maintain good quality products in their store and increase their sales
*	This project helps the organization to store and analyze customers, employee, product sales details.
*	This Database design helps in analyzing which product is highly rated by customers, Total revenue earned by online and offline payment modes. 
### Identification of Entities:
* Employee
* Customer
* Address
* Zip Code
* Bill
* Payment Mode
* Order 
* Order Item
* Order Product
* Product 
* Voucher
* Product Group
* Product Description
* Reviews

⇾ Employee-Any person who is employed as a part of company staff
Attributes: EmployeeID, EmpFirst_Name, EmpLast_SSN, EmpMail_Address, Designation, Department, Salary, Employee_Type.

⇾ Customer -A person who buys products with cash or card basis. He may be internal or external customer.
Attributes: CustomerID, First_Name, Last_Name, Mail_Address, Phone_Number, Category

⇾ Bill -Bill includes the total bill for the purchased products and amount that customer paid
Attributes: Billing_ID, Amount_Paid

⇾ Address -Address to with a particular order must be delivered.
Attributes: AddressID, Address_line1, Address_line2

⇾ Zip Code -Zip details of customers address is included 
Attributes: ZipCode, City, State

⇾ Payment- This table hold Date of customer visit number, payment and payment type whether the customer bought directly from store or purchased online. It also includes the customer card details
Attributes: Payment_ID, Payment_Type, CreditCard_Number,Card_Type, CVV_Number, ExpiryDate, CardHolder_Name

⇾ Orders – This table hold the status of the order whether the order is delivered or not and the shipment option given by the customer.
Attributes: Order_ID,Shippment_Duration, Order_Date,Status.

⇾ Order Item-OrderItem contains the details like date and quantity of items purchased.
Attributes: Date of Order, Quantity

⇾ Order Product- This contains the details of quantity of product that customer ordered
Attributes: OrderProduct_ID, Quantity

⇾ Voucher- Voucher includes priority of customers so based on that customers are given discount on their purchase.
Attributes: Voucher_Number, Description, Priority, Quantity_Item

⇾ Product -It is a form of good that is purchased by customer.
Attributes: ProductID, Product_Name, Available_Number

⇾ Product Details – Product details contains the description of particular product
Attributes:  Weight, Width, Colour, Height

⇾ Product Group – Product group tells to which category the product belongs to (Ex. Electronics)
Attributes:  Group_ID, Group_Name

⇾ Review-Reviews are the feedback given to the product by customers.
Attributes: Quality, Defect%, Review_ID, Review_Date

### ER Diagram for Retail Application
#### ER Diagram for Retail Application Before Normalization:
![111](https://user-images.githubusercontent.com/25045759/27304876-866e2f90-550d-11e7-944a-695b7d39b45a.jpg)
![222](https://user-images.githubusercontent.com/25045759/27304877-86769478-550d-11e7-9e25-878464cf6d56.jpg)

#### After Normalization
![333](https://user-images.githubusercontent.com/25045759/27304878-8679f712-550d-11e7-8dd3-d2ad92ee5289.jpg)

