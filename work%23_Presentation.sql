use supply_chain;
#supplier,product,orders,orderitem,customer
show tables;
#1. Company sells the product at different discounted rates. Refer actual product price 
#in product table and selling price in the order item table. Write a query to find out 
#total amount saved in each order then display the orders from highest to lowest amount saved. 
#supplier,product,orders,orderitem,customer
select * from product;
select id,unitprice from product;
select * from orderitem;
create table sell(select productid,orderid,unitprice as selling_price from orderitem order by orderid);
create table `real`(select  id as productid,unitprice as real_price from product);
create table final_cost(select s.*,r.real_price  from sell s left join `real` r on s.productid=r.productid);
alter table final_cost drop column productid;
create table orderid_cost(select orderid,sum(selling_price)as sellingprice,sum(real_price) as realprice from final_cost group by orderid);
select orderid,sellingprice,realprice,(realprice-sellingprice) as discountedprice from orderid_cost order by (realprice-sellingprice) desc;

#2. Mr. Kavin want to become a supplier. He got the database of "Richard's Supply" for reference. Help him to pick: 
#a. List few products that he should choose based on demand.
#b. Who will be the competitors for him for the products suggested in above questions.
#supplier,product,orders,orderitem,customer
select * from supplier;
select * from orderitem;
select * from orders;
select * from existing_products;
create table existing_products(select * from product where isdiscontinued=0);
create table kavin_products(select productid,sum(quantity) from orderitem group by productid order by sum(quantity) desc limit 10);
select * from kavin_products;
alter table kavin_products change `sum(quantity)` demand varchar(10);
alter table existing_products change id productid int(10);
alter table kavin_products modify demand  int;
#a)
select k.*,e.productname from kavin_products k left join existing_products e on 
e.productid=k.productid order by k.demand desc;
#b)
select k.*,e.productname,e.supplierid as competitor_id from kavin_products k left join existing_products e on 
e.productid=k.productid;

#3. 
#Create a combined list to display customers and suppliers details considering the following criteria 
#Both customer and supplier belong to the same country
#Customer who does not have supplier in their country
#Supplier who does not have customer in their country
#supplier,product,orders,orderitem,customer
select * from supplier;
select * from customer;
select count(distinct(country)) from supplier;
select c.firstname,c.lastname,c.country,s.companyname,s.contactname,s.country from customer c
 left join  
supplier s
on s.country=c.country;

#4. 
#Every supplier supplies specific products to the customers. Create a view of suppliers and total sales 
#made by their products and write a query on this view to find out top 2 suppliers (using windows function) in 
#each country by total sales done by the products.
#supplier,product,orders,orderitem,customer
select * from supplier;
create table pro(select id,supplierid from product order by id) ;
create table item (select productid,sum(quantity) from orderitem group by productid);
alter table item change `sum(quantity)`  quantity int;
alter table pro change id  productid int;
create table quantity(select p.*,i.quantity from pro p left join item i on p.productid=i.productid);
create table quantity1(select supplierid,sum(quantity) from quantity group by supplierid);
alter table quantity1 change `sum(quantity)` quantity int;
#4)answer
(select s.id as supplierid,s.companyname,s.contactname,s.country,a.quantity from supplier s left join quantity1 a on s.id=a.supplierid order by quantity desc);

#5. Find out for which products, UK is dependent on other countries for 
#the supply. List the countries which 
#are supplying these products in the same list.
#supplier,product,orders,orderitem,customer
select s.id,s.contactname,s.companyname,s.country,p.productname 
from supplier s left join product p on s.id=p.supplierid;
select * from orderitem;
select * from product;
select * from supplier;
select * from orders;
select * from customer;
create table ukcustomer (select id as customerid from customer where country='uk');
select c.customerid,o.id as orderid from ukcustomer c left join orders o on o.customerid=c.customerid;

#6. ‘customer’ table attributes -Id, FirstName,LastName,Phone ‘customer_backup’ table attributes -Id, 
#FirstName,LastName,Phone Create a trigger in such a way that It should insert the details into the  
#‘customer_backup’ table when you delete the record from the ‘customer’ table automatically.
#supplier,product,orders,orderitem,customer
DELIMITER //
CREATE TRIGGER trg_customer_delete
AFTER DELETE ON customer
FOR EACH ROW
BEGIN
    INSERT INTO customer_backup (Id, FirstName, LastName, Phone)
    VALUES (OLD.Id, OLD.FirstName, OLD.LastName, OLD.Phone);
END;
//
DELIMITER ;