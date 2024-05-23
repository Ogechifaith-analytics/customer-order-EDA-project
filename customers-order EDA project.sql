show databases;
use classicmodels;
#DATA CLEANING AND DATA EXPLORATION
#check table structure,column names and data types
select * from customers;
select * from orders;
select * from orderdetails; 
describe orders;

#missing values
select distinct country from customers;

select * from orders 
where customerNumber is null;
select * from customers 
where customerName is null;
select phone from customers;

#check inconsistency
select * from orderdetails where priceEach =0;
select * from orders where orderDate>curdate();

#Check statistics
select min(priceeach) as min_price,
max(priceeach) as max_price,
AVG(priceeach) as AVG_price,
min(quantityOrdered) as min_quantity,
max(quantityOrdered) as max_quantity,
AVG(quantityOrdered) as AVG_quantity
from orderdetails;

#detect duplicate record
select customerNumber,customerName,phone,
count(*) as dup_record from customers
group by customerNumber,customerName,phone
having count(*)>1;

select orderNumber,productCode,quantityOrdered,priceEach,
count(*) as dup_record from orderdetails
group by orderNumber,productCode,quantityOrdered,priceEach
having count(*)>1;

#relationships between column
select productcode,quantityordered, count(*) as productOrdered
from orderdetails
group by productcode,quantityordered
order by productOrdered desc;

#highest ordered product
select * from orderdetails
order by quantityOrdered desc
limit 5;