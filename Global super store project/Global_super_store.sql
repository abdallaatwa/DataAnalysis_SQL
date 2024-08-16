-- Sum of sales
SELECT 
Round(sum(Sales),0) as Sum_of_sales
 FROM `Global_Super_Store.Global_Super_Store`;

___
-- Sum of sales by segment,category and sub cateogry
SELECT 
Segment,
Category,
`Sub-Category`,
Round(sum(Sales),0) as Sum_of_sales
 FROM `Global_Super_Store.Global_Super_Store`
 Group by Segment,Category,`Sub-Category`
 Order by Sum_of_sales DESC;
___
-- Sum of sales by Market,Region and country
SELECT 
Market,
Region,
Country,
Round(sum(Sales),0) as Sum_of_sales
 FROM `Global_Super_Store.Global_Super_Store`
 Group by 
 Market,
Region,
Country
 Order by Sum_of_sales DESC;
____

--Average shipping duration for each Ship Mode
SELECT
`Ship Mode`,
  ROUND(AVG(DATE_DIFF(`Ship Date`, `Order Date`, Day)),0) AS avg_shipping_duration
FROM 
  `Global_Super_Store.Global_Super_Store`
  Group by `Ship Mode`;
____

--Top 100 customers
SELECT
`Customer ID`,
`Customer Name`,
ROUND(Sum(Sales),0) as Sum_of_sales
FROM 
  `Global_Super_Store.Global_Super_Store`
  Group by `Customer ID`,`Customer Name`
  ORDER BY Sum_of_sales DESC
  LIMIT 100
  ;
___________
