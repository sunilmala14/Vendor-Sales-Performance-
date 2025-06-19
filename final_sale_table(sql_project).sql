select * from purchases limit 2;
select * from purchase_prices limit 2;
select * from sales where brand=5255 limit 10 ;
select * from vendor_invoice limit 2;
select brand,purchaseprice,sum(quantity),sum(dollars) from purchases group by brand,purchaseprice;
select brand,sum(salesdollars),sum(salesprice) from sales group by brand;

CREATE TABLE vendor_freight_summary AS
SELECT vendornumber, SUM(freight) AS total_freight
FROM vendor_invoice
GROUP BY vendornumber;

#CREATE TABLE purchase_summary AS
#select p.vendornumber,p.vendorname,p.brand,p.purchaseprice,pp.volume,pp.price as actual_price,
#sum(p.quantity) as totalpurchasequantity, sum(p.dollars) as totalpurchasedollars
#from purchases p
#join purchase_prices pp 
#on p.brand=pp.brand
#group by p.vendornumber,p.vendorname,p.brand,p.purchaseprice

CREATE TABLE purchase_summary AS
SELECT 
    p.vendornumber,
    p.vendorname,
    p.brand,
    p.purchaseprice,
    pp.volume,
    pp.price AS actual_price,
    SUM(p.quantity) AS totalpurchasequantity,
    SUM(p.dollars) AS totalpurchasedollars
FROM purchases p
JOIN purchase_prices pp 
ON p.brand = pp.brand
where p.purchaseprice>0
GROUP BY 
    p.vendornumber,
    p.vendorname,
    p.brand,
    p.purchaseprice,
    pp.volume,
    pp.price;

    
select * from purchase_summary order by totalpurchasedollars limit 10;
select count(*) from purchase_summary;

CREATE TABLE sales_summary AS
SELECT
vendorno,
brand,
description,
sum(salesdollars) as totalsaledollars,
sum(salesprice) as totalsaleprice,
sum(salesquantity) as totalsalequantity,
sum(excisetax) as totalexcisetas
from sales
group by vendorno,brand,description;


create table final_sale_table as
select 
ps.vendornumber,ps.vendorname,ps.brand,ps.volume,ps.purchaseprice,ps.actual_price,ps.totalpurchasequantity,ps.totalpurchasedollars,
ss.description,ss.totalsaledollars,ss.totalsaleprice,ss.totalsalequantity,ss.totalexcisetas,
fs.total_freight
from purchase_summary as ps
left join  sales_summary as ss 
on ps.vendornumber=ss.vendorno and ps.brand=ss.brand
left join vendor_freight_summary as fs
on ps.vendornumber=fs.vendornumber
order by ps.totalpurchasedollars desc;

select * from final_sale_table;




