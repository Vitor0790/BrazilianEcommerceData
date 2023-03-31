--About customers
SELECT
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_customers_dataset

--About sellers
SELECT
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_sellers_dataset

--About payments
SELECT
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_payments_dataset

--About reviews
SELECT
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_reviews_dataset

--About orders
SELECT
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_orders_dataset

--About order items
SELECT
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_items_dataset


--About order payment
SELECT
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_payments_dataset

--***********************************************************************************************************************************
--How many customers do we have?
--***********************************************************************************************************************************
SELECT
	DISTINCT
	COUNT(customer_id) as CustomerCount
FROM
	Brazilian_Ecommerce_Data.dbo.olist_customers_dataset

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
-- Customer purchase trend in 2017
--***********************************************************************************************************************************
SELECT
	MONTH(order_purchase_timestamp) AS order_month_number,
	DATENAME(MONTH,DATEADD(MONTH, 0, order_purchase_timestamp)) AS order_month_name,
	COUNT(order_id) AS order_count_2017
FROM
	Brazilian_Ecommerce_Data.dbo.olist_orders_dataset
WHERE
	YEAR(order_purchase_timestamp) = 2017
	AND order_status NOT IN ('cancelled', 'unavailable')
GROUP BY
	DATENAME(MONTH,DATEADD(MONTH, 0, order_purchase_timestamp)),
	MONTH(order_purchase_timestamp),
	YEAR(order_purchase_timestamp)
ORDER BY
	YEAR(order_purchase_timestamp),
	MONTH(order_purchase_timestamp) ASC

--***********************************************************************************************************************************
-- How many orders have complains about stolen orders?
--***********************************************************************************************************************************
SELECT
	od.order_id,
	cd.customer_city,
	cd.customer_state,
	rd.review_comment_message
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_reviews_dataset rd
LEFT JOIN
	Brazilian_Ecommerce_Data.dbo.olist_orders_dataset od
ON
	rd.order_id = od.order_id
LEFT JOIN
	Brazilian_Ecommerce_Data.dbo.olist_customers_dataset cd
ON
	cd.customer_id = od.customer_id
WHERE
	rd.review_comment_message LIKE '%roub%' 
	OR rd.review_comment_message LIKE '%assal%' 
	AND rd.review_comment_message IS NOT NULL
	AND od.order_id NOT IN ('14be6c27cfb9d577528738b7bb45139e','a5a854651cfe0d8da9f1669266fd4063')
ORDER BY
	cd.customer_state DESC

--***********************************************************************************************************************************
-- What's the proportion of stolen orders per state?
--***********************************************************************************************************************************
WITH cte_orders_per_state AS (
	SELECT
		COUNT(od.order_id) AS order_count ,
		cd.customer_state
	FROM
		Brazilian_Ecommerce_Data.dbo.olist_customers_dataset cd
	LEFT JOIN
		Brazilian_Ecommerce_Data.dbo.olist_orders_dataset od
	ON
		cd.customer_id = od.customer_id
	GROUP BY
		cd.customer_state
)
SELECT
	ops.customer_state,
	COUNT(od.order_id) AS stolen_orders,
	ops.order_count AS total_orders,
	FORMAT(CAST(COUNT(od.order_id) AS FLOAT) / CAST(ops.order_count AS FLOAT),'P') AS '%_of_stolen_orders',
	ops.order_count/COUNT(od.order_id) AS '1_stolen_order_for_each'
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_reviews_dataset rd
LEFT JOIN
	Brazilian_Ecommerce_Data.dbo.olist_orders_dataset od
ON
	rd.order_id = od.order_id
LEFT JOIN
	Brazilian_Ecommerce_Data.dbo.olist_customers_dataset cd
ON
	cd.customer_id = od.customer_id
INNER JOIN
	cte_orders_per_state ops
ON
	cd.customer_state = ops.customer_state
WHERE
	rd.review_comment_message LIKE '%roub%' 
	OR rd.review_comment_message LIKE '%assal%' 
	AND rd.review_comment_message IS NOT NULL
	AND od.order_id NOT IN ('14be6c27cfb9d577528738b7bb45139e','a5a854651cfe0d8da9f1669266fd4063')
GROUP BY
	--cd.customer_city,
	ops.customer_state,
	ops.order_count
ORDER BY
	FORMAT(CAST(COUNT(od.order_id) AS FLOAT) / CAST(ops.order_count AS FLOAT),'P') DESC

--***********************************************************************************************************************************
-- In how many installments custmers usually pay?
--***********************************************************************************************************************************
SELECT
	ROUND(AVG(payment_installments),2) AS payment_installments_avg,
	payment_type
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_payments_dataset
WHERE
	payment_type = 'credit_card'
GROUP BY
	payment_type


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

--***********************************************************************************************************************************
-- Counting orders purchased per review_score
--***********************************************************************************************************************************
SELECT
	COUNT(order_id) AS order_count,
	FORMAT(CAST(COUNT(order_id) AS FLOAT)/(SELECT CAST(COUNT(order_id) AS FLOAT) FROM Brazilian_Ecommerce_Data.dbo.olist_order_reviews_dataset),'P') AS '%ofTotal',
	review_score
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_reviews_dataset
GROUP BY
	review_score
ORDER BY
	review_score DESC

--***********************************************************************************************************************************
-- Time difference between review creation and review answer per review_score
--***********************************************************************************************************************************
SELECT
	AVG(DATEDIFF(DAY, review_creation_date, review_answer_timestamp)) AS avg_asnwer_days,
	review_score
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_reviews_dataset
GROUP BY
	review_score
ORDER BY
	review_score DESC

--***********************************************************************************************************************************
-- Cities with highest revenue
--***********************************************************************************************************************************
WITH cte_payments AS (
	SELECT DISTINCT
		order_id,
		SUM(payment_value) AS payment_value
	FROM
		Brazilian_Ecommerce_Data.dbo.olist_order_payments_dataset
	GROUP BY
		order_id
)

SELECT
	COUNT(od.order_id) AS order_count,
	ROUND(SUM(p.payment_value),2) AS total_customer_payment,
	cd.customer_state,
	cd.customer_city
FROM
	Brazilian_Ecommerce_Data.dbo.olist_customers_dataset cd
LEFT JOIN
	Brazilian_Ecommerce_Data.dbo.olist_orders_dataset od
ON
	cd.customer_id = od.customer_id
LEFT JOIN
	cte_payments p
ON
	od.order_id = p.order_id
WHERE
	od.order_status = 'delivered'
GROUP BY
	cd.customer_state,
	cd.customer_city
ORDER BY
	COUNT(od.order_id) DESC

--***********************************************************************************************************************************
-- Sellers with most unique orders, most 5 star rating, highest profit:
--***********************************************************************************************************************************
SELECT 
	description, 
	seller_id, 
	value
FROM(
	SELECT DISTINCT TOP 1
		'Seller with most of unique orders :' AS description,
		oid.seller_id AS seller_id,
		COUNT(od.order_id) AS value
	FROM
		Brazilian_Ecommerce_Data.dbo.olist_orders_dataset od
	JOIN
		Brazilian_Ecommerce_Data.dbo.olist_order_items_dataset  oid
	ON
		od.order_id = oid.order_id
	WHERE
		od.order_status = 'delivered'
		AND oid.order_item_id = 1
	GROUP BY
		oid.seller_id
	ORDER BY
		COUNT(od.order_id) DESC
) first

UNION ALL

SELECT 
	description, 
	seller_id, 
	value
FROM(
	SELECT DISTINCT TOP 1
		'Seller with most 5 star ratings :' AS description,
		oid.seller_id AS seller_id,
		COUNT(od.order_id) AS value
	FROM
		Brazilian_Ecommerce_Data.dbo.olist_orders_dataset od
	JOIN
		Brazilian_Ecommerce_Data.dbo.olist_order_items_dataset  oid
	ON
		od.order_id = oid.order_id
	JOIN
		Brazilian_Ecommerce_Data.dbo.olist_order_reviews_dataset rd
	ON
		od.order_id = rd.order_id
	WHERE
		od.order_status = 'delivered'
		AND oid.order_item_id = 1
		AND rd.review_score = 5
	GROUP BY
		oid.seller_id
	ORDER BY
		COUNT(od.order_id) DESC
) second

UNION ALL

SELECT 
	description, 
	seller_id, 
	ROUND(value,2) AS value
FROM(
	SELECT DISTINCT TOP 1
		'Seller with highest Profit :' AS description,
		oid.seller_id AS seller_id,
		SUM(opd.payment_value) AS value
	FROM
		Brazilian_Ecommerce_Data.dbo.olist_orders_dataset od
	JOIN
		Brazilian_Ecommerce_Data.dbo.olist_order_items_dataset  oid
	ON
		od.order_id = oid.order_id
	JOIN
		Brazilian_Ecommerce_Data.dbo.olist_order_payments_dataset opd
	ON
		od.order_id = opd.order_id
	WHERE
		od.order_status = 'delivered'
		AND oid.order_item_id = 1
	GROUP BY
		oid.seller_id
	ORDER BY
		SUM(opd.payment_value) DESC
) third

--***********************************************************************************************************************************
-- Measuring delivery success rate per state
--***********************************************************************************************************************************

--About customers
SELECT DISTINCT
	customer_state
FROM
	Brazilian_Ecommerce_Data.dbo.olist_customers_dataset

--About orders
SELECT
	distinct
	order_status
FROM
	Brazilian_Ecommerce_Data.dbo.olist_orders_dataset


SELECT
	cd.customer_state AS customer_state,
	--od.order_id,
	SUM(CASE WHEN
		od.order_status = 'delivered' THEN 1 ELSE 0
	END) AS delivered_orders,
	SUM(CASE WHEN
		od.order_status != 'delivered' THEN 1 ELSE 0
	END) AS not_delivered_orders,
	SUM(CASE WHEN
		od.order_status IS NOT NULL THEN 1 ELSE 0
	END) AS total_orders,
	FORMAT(CAST(SUM(CASE WHEN
		od.order_status = 'delivered' THEN 1 ELSE 0
	END) AS FLOAT)/CAST(SUM(CASE WHEN
		od.order_status IS NOT NULL THEN 1 ELSE 0
	END) AS FLOAT),'P') AS '%_delivered_orders',
	FORMAT(CAST(SUM(CASE WHEN
		od.order_status != 'delivered' THEN 1 ELSE 0
	END) AS FLOAT)/CAST(SUM(CASE WHEN
		od.order_status IS NOT NULL THEN 1 ELSE 0
	END) AS FLOAT), 'P') AS '%_not_delivered_orders'
FROM
	Brazilian_Ecommerce_Data.dbo.olist_customers_dataset cd
JOIN
	Brazilian_Ecommerce_Data.dbo.olist_orders_dataset od
ON
	cd.customer_id = od.customer_id
GROUP BY
	cd.customer_state
	--od.order_id
ORDER BY
	cd.customer_state