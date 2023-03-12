--About customers
SELECT
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_customers_dataset

--***********************************************************************************************************************************
--How many customers do we have?
--***********************************************************************************************************************************
SELECT
	DISTINCT
	COUNT(customer_id) as CustomerCount
FROM
	Brazilian_Ecommerce_Data.dbo.olist_customers_dataset

--***********************************************************************************************************************************
-- Which state of Brazil has more customers?
--***********************************************************************************************************************************
SELECT
	DISTINCT
	COUNT(customer_id) as CustomerCount
	,customer_state
	,FORMAT(CAST(COUNT(*) AS FLOAT)/CAST((SELECT DISTINCT COUNT(customer_id) FROM Brazilian_Ecommerce_Data.dbo.olist_customers_dataset) AS FLOAT),'P') AS '%ofTotal'
FROM
	Brazilian_Ecommerce_Data.dbo.olist_customers_dataset
GROUP BY
	customer_state
ORDER BY
	COUNT(customer_id) DESC

--***********************************************************************************************************************************
-- Which payment method is used more often?
--***********************************************************************************************************************************
SELECT
	payment_type,
	COUNT(payment_type) AS payment_type_count,
	FORMAT(CAST(COUNT(payment_type) AS FLOAT)/CAST((SELECT COUNT(payment_type) FROM Brazilian_Ecommerce_Data.dbo.olist_order_payments_dataset) AS FLOAT),'P') AS '%ofTotal'
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_payments_dataset
GROUP BY
	payment_type
ORDER BY
	COUNT(payment_type) DESC

--***********************************************************************************************************************************
-- Which state of Brazil has more orders?
--***********************************************************************************************************************************
SELECT
	FORMAT(CAST(COUNT(od.order_id) AS FLOAT)/CAST((SELECT COUNT(order_id) FROM Brazilian_Ecommerce_Data.dbo.olist_orders_dataset) AS FLOAT),'P') AS '%ofTotal' ,
	cd.customer_state
FROM
	Brazilian_Ecommerce_Data.dbo.olist_customers_dataset cd
LEFT JOIN
	Brazilian_Ecommerce_Data.dbo.olist_orders_dataset od
ON
	cd.customer_id = od.customer_id
GROUP BY
	cd.customer_state
ORDER BY
	COUNT(od.order_id) DESC

--***********************************************************************************************************************************
-- Which city of Brazil has more orders?
--***********************************************************************************************************************************
SELECT
	FORMAT(CAST(COUNT(od.order_id) AS FLOAT)/CAST((SELECT COUNT(order_id) FROM Brazilian_Ecommerce_Data.dbo.olist_orders_dataset) AS FLOAT),'P') AS '%ofTotal' ,
	cd.customer_city,
	cd.customer_state
FROM
	Brazilian_Ecommerce_Data.dbo.olist_customers_dataset cd
LEFT JOIN
	Brazilian_Ecommerce_Data.dbo.olist_orders_dataset od
ON
	cd.customer_id = od.customer_id
GROUP BY
	cd.customer_state,
	cd.customer_city
ORDER BY
	COUNT(od.order_id) DESC

--***********************************************************************************************************************************
-- Which city of Brazil has higher freight_value?
--***********************************************************************************************************************************
SELECT
	cd.customer_city,
	cd.customer_state,
	ROUND(AVG(oid.freight_value),2) AS avg_freight_value
FROM
	Brazilian_Ecommerce_Data.dbo.olist_customers_dataset cd
LEFT JOIN
	Brazilian_Ecommerce_Data.dbo.olist_orders_dataset od
ON
	cd.customer_id = od.customer_id
LEFT JOIN
	Brazilian_Ecommerce_Data.dbo.olist_order_items_dataset oid
ON
	od.order_id = oid.order_id
GROUP BY
	cd.customer_city,
	cd.customer_state
HAVING
	AVG(oid.freight_value) > 0
ORDER BY
	AVG(oid.freight_value) DESC