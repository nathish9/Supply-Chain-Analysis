use project_supply_chain_data;
Select * from supply_chain_table;
-- 1. Which products generate high revenue but have low availability?
SELECT Product_type,
       SUM(Revenue_generated) AS total_revenue,
       AVG(Stock_levels) AS avg_stock
FROM supply_chain_table
GROUP BY Product_type
ORDER BY total_revenue DESC;
-- 2. Which SKUs have high sales but frequent stock-outs?
Select SKU,
   sum(Number_of_products_sold) as High_sales,
   avg(Stock_levels) as avg_stock
from supply_chain_table
group by sku
having avg_stock<50
order by High_sales desc;
-- 3. Which suppliers have the highest manufacturing lead time?
Select Supplier_name,
avg(Manufacturing_lead_time) as avg_mfg_lead_time
from supply_chain_table
group by Supplier_name
order by avg_mfg_lead_time desc;
-- 4. Is higher manufacturing cost linked to higher defect rate?
Select Supplier_name,
avg(Manufacturing_costs) as avg_cost,
avg(Defect_rates) as avg_defect
from supply_chain_table
group by Supplier_name
order by avg_defect desc;
-- 5. Which products have the highest defect rates?
Select Product_type,
avg(Defect_rates) as defect
from supply_chain_table
group by Product_type
order by defect desc;
-- 6. Failed inspection vs production volume
select Inspection_results,
sum(Production_volumes) as pv
from supply_chain_table
group by Inspection_results
having Inspection_results='Fail'
order by pv desc ;
-- 7. Which transportation mode is most expensive?
Select Transportation_modes,
avg (Costs) as Expensive
from supply_chain_table
group by Transportation_modes
order by Expensive desc;
-- 8. Which routes have high cost but long shipping time?
Select Routes,
round(avg (Shipping_costs),2) as Costs,
round(avg(Shipping_times),2) as Times 
from supply_chain_table
group by Routes
order by Times desc;
-- 9. Are order quantities higher than stock levels?
select Product_type,
avg(Order_quantities) as qt,
avg(Stock_levels) as st_level
from supply_chain_table
group by  Product_type
having qt>st_level;
-- 10. Lead time vs customer delivery delay?
Select Location ,
round(avg (Lead_times),2) as Times,
round(avg(Shipping_times),2) as sh_times
from supply_chain_table
group by Location
order by Times desc;
-- 11.Which suppliers have average defect rate greater than 5%?
Select Supplier_name,
round(avg(Defect_rates),2) as Defect
from supply_chain_table
group by Supplier_name
having Defect>5
order by Defect desc;
-- 12. Which product types generate high revenue but have low average stock levels?
Select Product_type,
round(sum(Revenue_generated),2) as High_revenue,
round(avg(Stock_levels),2) as Avg_Stock
from supply_chain_table
group by Product_type
having Avg_Stock<50
order by High_revenue desc;
-- 13. Which transportation mode has the highest average shipping cost?
SELECT Transportation_modes,
       AVG(Shipping_costs) AS avg_shipping_cost
FROM supply_chain_table
GROUP BY Transportation_modes
ORDER BY avg_shipping_cost DESC;














