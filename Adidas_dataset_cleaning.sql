create database adidas;

use adidas;

-- getting an overview of the dataset
select * 
from adidas.adidas_sales 
limit 1000;
 

-- setting sql safe updates off so that we can use UPDATE statement without WHERE clause
set sql_safe_updates=0;



-- Removing the $ and ,  from the sales,Profit , Price per unit so we can make them in integers
update adidas_sales
set Operating_Profit = replace(Operating_Profit,",","");

update adidas_sales
set Operating_Profit = replace(Operating_Profit,"$","");

update adidas_sales
set Price_per_Unit = replace(Price_per_Unit,"$","");

update adidas_sales
set Total_Sales = replace(Total_Sales,",","");

update adidas_sales
set Total_Sales = replace(Total_Sales,"$","");


-- Changing the data type of Sales Profit and Price per unit to integer

alter table adidas_sales
modify Price_per_Unit int;

alter table adidas_sales
modify Operating_Profit int;

alter table adidas_sales
modify Total_Sales int;

-- Removing , from values of Unit_Sold column and converting it to integer

update adidas_sales
set Units_Sold = replace(Units_Sold,",","");

alter table adidas_sales
modify Units_Sold int;


-- Changing Operating Margin to integer

update adidas_sales
set Operating_Margin = replace(Operating_Margin,"%","");

alter table adidas_sales
modify Operating_Margin int;

-- Converting Invoice date to date format

select Invoice_date ,str_to_date(Invoice_Date,"%m/%d/%Y")
from adidas_sales
limit 1000;

update adidas_sales
set Invoice_date = str_to_date(Invoice_Date,"%m/%d/%Y");