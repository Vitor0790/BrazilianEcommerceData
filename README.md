# BrazilianEcommerceData
Data from brazilian Ecommerce of 100k orders from 2016 to 2018 made at multiple marketplaces in Brazil.

# __Brazilian E-commerce Public Dataset  EDA__

## __About dataset:__
This dataset contains information of 100k orders from 2016 to 2018 made at multiple marketplaces in Brazil.

This set consists of 9 tables:

1. olist_customers_dataset.csv
2. olist_geolocation_dataset.csv
3. olist_order_items_dataset.csv
4. olist_order_payments_dataset.csv
5. olist_order_reviews_dataset.csv
6. olist_orders_dataset.csv
7. olist_products_dataset.csv
8. olist_sellers_dataset.csv
9. product_category_name_translation.csv

All of the files can be downladed [__here.__](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
"Click here to download the files") 

<br/>
<br/>

# __Exploratory Data Analysis__

Checking customers table:
```sql
SELECT TOP 3
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_customers_dataset
```
| customer_id                      | customer_unique_id               | customer_zip_code_prefix | customer_city         | customer_state |
|----------------------------------|----------------------------------|--------------------------|-----------------------|----------------|
| 06b8999e2fba1a1fbc88172c00ba8bc7 | 861eff4711a542e4b93843c6dd7febb0 | 14409                    | franca                | SP             |
| 18955e83d337fd6b2def6b18a428ac77 | 290c77bc529b7ac935b93aa66c333dc3 | 9790                     | sao bernardo do campo | SP             |
| 4e7b3e00288586ebd08712fdd0374a03 | 060e732b5b29e8181a18229c7b0b2b5e | 1151                     | sao paulo             | SP             |

<br/>

Checking geolocation table:
```sql
SELECT TOP 3
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_geolocation_dataset
```
| geolocation_zip_code_prefix | geolocation_lat     | geolocation_lng    | geolocation_city | geolocation_state |
|-----------------------------|---------------------|--------------------|------------------|-------------------|
| 01037                       | -23.54562128115268  | -46.63929204800168 | sao paulo        | SP                |
| 01046                       | -23.546081127035535 | -46.64482029837157 | sao paulo        | SP                |
| 01046                       | -23.54612896641469  | -46.64295148361138 | sao paulo        | SP                |
<br/>

Checking order items table:
```sql
SELECT TOP 3
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_items_dataset
```
| order_id                         | order_item_id | product_id                       | seller_id                        | shipping_limit_date     | price | freight_value |
|----------------------------------|---------------|----------------------------------|----------------------------------|-------------------------|-------|---------------|
| 00010242fe8c5a6d1ba2dd792cb16214 | 1             | 4244733e06e7ecb4970a6e2683c13e61 | 48436dade18ac8b2bce089ec2a041202 | 2017-09-19 09:45:35.000 | 58,9  | 13,29         |
| 00018f77f2f0320c557190d7a144bdd3 | 1             | e5f2d52b802189ee658865ca93d83a8f | dd7ddc04e1b6c2c614352b383efe2d36 | 2017-05-03 11:05:13.000 | 239,9 | 19,93         |
| 000229ec398224ef6ca0657da4fc703e | 1             | c777355d18b72b67abbeef9df44fd0fd | 5b51032eddd242adc84c38acab88f23d | 2018-01-18 14:48:30.000 | 199   | 17,87         |

<br/>

Checking payments table:
```sql
SELECT TOP 3
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_payments_dataset
```
| order_id                         | payment_sequential | payment_type | payment_installments | payment_value |
|----------------------------------|--------------------|--------------|----------------------|---------------|
| b552361bfa71f85d48c308d95c713f23 | 1                  | credit_card  | 1                    | 57,59         |
| 8438c7840810d9cc49705bc3bd0d030d | 1                  | credit_card  | 3                    | 35,77         |
| c1a9b3fbea92e83c4a08229da82a0136 | 1                  | credit_card  | 6                    | 701,85        |

<br/>

Checking reviews table:
```sql
SELECT TOP 3
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_reviews_dataset
```
| review_id                        | order_id                         | review_score | review_comment_title | review_comment_message | review_creation_date        | review_answer_timestamp     |
|----------------------------------|----------------------------------|--------------|----------------------|------------------------|-----------------------------|-----------------------------|
| 7bc2406110b926393aa56f80a40eba40 | 73fc7af87114b39712e6da79b0a377eb | 4            | NULL                 | NULL                   | 2018-01-18 00:00:00.0000000 | 2018-01-18 21:46:59.0000000 |
| 80e641a11e56f04c1ad469d5645fdfde | a548910a1c6147796b98fdf73dbeba33 | 5            | NULL                 | NULL                   | 2018-03-10 00:00:00.0000000 | 2018-03-11 03:05:13.0000000 |
| 228ce5500dc1d8e020d8d1322874b6f0 | f9e4b658b201a9f2ecdecbb34bed034b | 5            | NULL                 | NULL                   | 2018-02-17 00:00:00.0000000 | 2018-02-18 14:36:24.0000000 |

<br/>

Checking orders table:
```sql
SELECT TOP 3
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_orders_dataset
```
| order_id                         | customer_id                      | order_status | order_purchase_timestamp    | order_approved_at           | order_delivered_carrier_date | order_delivered_customer_date | order_estimated_delivery_date |
|----------------------------------|----------------------------------|--------------|-----------------------------|-----------------------------|------------------------------|-------------------------------|-------------------------------|
| e481f51cbdc54678b7cc49136f2d6af7 | 9ef432eb6251297304e76186b10a928d | delivered    | 2017-10-02 10:56:33.0000000 | 2017-10-02 11:07:15.0000000 | 2017-10-04 19:55:00.0000000  | 2017-10-10 21:25:13.0000000   | 2017-10-18 00:00:00.0000000   |
| 53cdb2fc8bc7dce0b6741e2150273451 | b0830fb4747a6c6d20dea0b8c802d7ef | delivered    | 2018-07-24 20:41:37.0000000 | 2018-07-26 03:24:27.0000000 | 2018-07-26 14:31:00.0000000  | 2018-08-07 15:27:45.0000000   | 2018-08-13 00:00:00.0000000   |
| 47770eb9100c2d0c44946d9cf07ec65d | 41ce2a54c0b03bf3443c3d931a367089 | delivered    | 2018-08-08 08:38:49.0000000 | 2018-08-08 08:55:23.0000000 | 2018-08-08 13:50:00.0000000  | 2018-08-17 18:06:29.0000000   | 2018-09-04 00:00:00.0000000   |

<br/>

Checking products table:
```sql
SELECT TOP 3
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_products_dataset
```
| product_id                       | product_category_name | product_name_lenght | product_description_lenght | product_photos_qty | product_weight_g | product_length_cm | product_height_cm | product_width_cm |
|----------------------------------|-----------------------|---------------------|----------------------------|--------------------|------------------|-------------------|-------------------|------------------|
| 1e9e8ef04dbcff4541ed26657ea517e5 | perfumaria            | 40                  | 287                        | 1                  | 225              | 16                | 10                | 14               |
| 3aa071139cb16b67ca9e5dea641aaa2f | artes                 | 44                  | 276                        | 1                  | 1000             | 30                | 18                | 20               |
| 96bd76ec8810374ed1b65e291975717f | esporte_lazer         | 46                  | 250                        | 1                  | 154              | 18                | 9                 | 15               |

<br/>

Checking sellers table:
```sql
SELECT TOP 3
	*
FROM
	Brazilian_Ecommerce_Data.dbo.olist_sellers_dataset
```
| seller_id                        | seller_zip_code_prefix | seller_city    | seller_state |
|----------------------------------|------------------------|----------------|--------------|
| 3442f8959a84dea7ee197c632cb2df15 | 13023                  | campinas       | SP           |
| d1b65fc7debc3361ea86b5f14c68d2e2 | 13844                  | mogi guacu     | SP           |
| ce3ad9de960102d0677a81f5d0bb7b2d | 20031                  | rio de janeiro | RJ           |

<br/>

Checking category name translation table:
```sql
SELECT TOP 3
	*
FROM
	Brazilian_Ecommerce_Data.dbo.product_category_name_translation
```
| product_category_name  | product_category_name_english |
|------------------------|-------------------------------|
| beleza_saude           | health_beauty                 |
| informatica_acessorios | computers_accessories         |
| automotivo             | auto                          |

<br/>
<br/>

# __Exploring Deeper:__

How many customers we have?
```SQL
WITH cte_customer AS (
	SELECT
		DISTINCT
		customer_unique_id
	FROM
		Brazilian_Ecommerce_Data.dbo.olist_customers_dataset
)
SELECT
	COUNT(customer_unique_id) AS customer_count
FROM
	cte_customer
```

|customer_count|
|--------------|
96096

<br/>

Regarding payment type preferences, what are customers preferences?

| payment_type | payment_type_count | %ofTotal |
|--------------|--------------------|----------|
| credit_card  | 76795              | 73.92%   |
| boleto       | 19784              | 19.04%   |
| voucher      | 5775               | 5.56%    |
| debit_card   | 1529               | 1.47%    |
| not_defined  | 3                  | 0.00%    |


![Payment_type_count](https://user-images.githubusercontent.com/127568471/234719261-0b18bb66-3133-4507-8349-e044f855cc8c.png)

<br/>

**Credit Card** was used **76795** times and is the preferred payment type amongst others. It represents **73,92%** of the total.

<br/>

In how many installments customers usually pay?
```SQL
SELECT
	ROUND(AVG(payment_installments),2) AS payment_installments_avg,
	payment_type
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_payments_dataset
WHERE
	payment_type = 'credit_card'
GROUP BY
	payment_type
```
| payment_installments_avg | payment_type |
|--------------------------|--------------|
| 3.510000                 | credit_card  |

<br/>

The **average** of installments considering **Credit Card** is **3.5**.

<br/>

Let´s check the customer purchase trend in 2017:

(I´ve picked 2017 because it´s the only full year in the dataset)
```SQL
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
```

![order_count_month](https://user-images.githubusercontent.com/127568471/234719419-8f29bbd5-c626-4b55-840a-296b49d6a881.png)

<br/>

The month with the **most** sales considering the year of **2017** is **November** with **7480 orders**. The **worst** one is **January** with **790 orders**.

<br/>

Considering all the orders, how many of them have been stolen?
```SQL
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
```
| order_id                         | customer_city         | customer_state | review_comment_message                                                                                                                                                                                   |                             |
|----------------------------------|-----------------------|----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------|
| a7db8c5327329206a779bb63dca4a2f2 | sumare                | SP             | Nao recebi o produto o carteiro Paulo foi assaltado perto da minha resistência quero uma resposta pois esta constando q eu recebi mas nao recebi vou no procom e processar por danos morais sem resposta |                             |
| 90b22de691552b213f33c2a25c74c413 | osasco                | SP             | Gostaria muito que me enviassem de novo o produto porque ele foi roubado , não queria ficar sem ele!                                                                                                     |                             |
| 2ec398158cb686267b1f4b102129098e | bertioga              | SP             | Não me enviaram o produto, só me enviaram uma nota fiscal estou sendo roubado e ninguém resolve meu problema.                                                                                            |                             |
| 14be6c27cfb9d577528738b7bb45139e | sao paulo             | SP             | Comprei 5 escovas de dentes Black com cerdas pretas. Recebi apenas 2 e não são Black, são coloridas, vermelha e roxa! Um absurdo! Fui roubada! Incompleto e errado!                                      |                             |
| f1ec04b3b8679de55776bea7e3ad436f | ribeirao pires        | SP             | O site dos correios diz que a carga foi roubada. Esperando resolução.                                                                                                                                    |                             |
| 4384784d5523bb60e52390503d3c2789 | itaquaquecetuba       | SP             | RECOMENDO A LOJA E O PRODUTO, SÓ NÃO É PEFEITO PORQUE OS CORREIOS NÃO ENTREGAM ONDE MORO POR CAUSA DOS ASSALTOS. MAS O RESTENTE É PERFEITO, ALOJA, O PRODUTO O ATENDIMENTO, O PRAZO. OBRIGADA, VOLTAREI  |                             |
| 727ff4968b521aca37f5ac012eb0c9ad | itapecerica da serra  | SP             | o produto foi roubado nos correios, mas ate o momento a loja não deu nenhuma posição sobre o caso.                                                                                                       |                             |
| ac61010b8d348d62726ebfe687b026f6 | guarulhos             | SP             | fiz pedido 19/06, há 32 dias, no dia, em 31/05 uma moça Liliane, mandou zap dizendo que o produto caminhão que foi assaltado e em 15 d me entregaria outro e nd dia 17/06 zap e trocou produto e nd ain  |                             |
| c160599d4ea4eefa0e420db0a0cc9926 | itanhaem              | SP             | Péssimo compromisso com o cliente, meu produto foi roubado na entrega e me disseram que entregariam um novo produto, mas depois me negaram o mesmo.                                                      |                             |
| 3e8c191415aece16ba1ac896f535b484 | sao paulo             | SP             | O produto foi roubado no dia 24/04/18 no correio e a loja não se prontificou em enviar um novo.                                                                                                          |                             |
| 4472eca3b65b1dca5e0d59c0e4e0c6bc | sao paulo             | SP             | Recebi notificação dos Correios que o objeto foi roubado na tentativa de entrega solicitei o cancelamento                                                                                                |                             |
| a79648ef5e1a257af5fde4c5f27040da | sao paulo             | SP             | Produto idêntico ao anunciado. Não recebi no prazo pq o caminhão foi roubado.                                                                                                                            |                             |
| 3629e2c183d64e30de63e3bb23b00ade | sao paulo             | SP             | O produto foi roubado no correio ainda estou aguardando minha encomenda...                                                                                                                               |                             |
| a5a854651cfe0d8da9f1669266fd4063 | santos                | SP             | ROUBO! Na nota fiscal são 2 unidades mas no embrulho vem apenas UMA.                                                                                                                                     | Querem cobrar sem entregar? |
| 34a9dd848ef0ebd4ae4b60d31720497d | guarulhos             | SP             | Fiz a comprar e meu produto foi roubado entrei em contato e ninguém resolveu nada e aguardo uma resposta ate hoje                                                                                        |                             |
| d9bdd8985e722d97a231fc42efcdf238 | sao paulo             | SP             | Comprei o produto, com data prevista de entrega para dia 21/12, porém não recebi até a data de hoje, entrei no status de rastreamento e diz que o produto foi roubado. Entrei em contato e até agora nad |                             |
| ce4dab31cebede7c9e9e105a56277fa3 | parnamirim            | RN             | o produto foi roubado a posse dos correios mais não culpo a loja...                                                                                                                                      |                             |
| 4d2e2634819452adb3313ccb5abd344f | belford roxo          | RJ             | Foi roubada, ja mandei e-mail mas até agora nada, ninguém me respondeu                                                                                                                                   |                             |
| 95c9b6a458336c5de68ca8d1ba553078 | campos dos goytacazes | RJ             | Pelo que parece o produto foi extraviado pelos correios / carga roubada , e simplesmente não tenho nenhuma explicação ou retorno da empresa. Já tentei contato com as lannister e protocolo.             |                             |
| f38a6dc0f541c9dff3f0c72009f2976d | sao goncalo           | RJ             | Nao recebi o produto, recebi um e mail informando que foi roubado o produto.                                                                                                                             |                             |
| bcf5665129063675d2d1006d95d3c813 | volta redonda         | RJ             | O produto foi roubado do veículo dos correios. O vendedor reenviou um novo produto.Ainda não recebi, por isso estou avaliando a atitude da loja em me contactar e apresentar uma solução.                |                             |
| c3b3b91815037977b255690978788e1a | rio de janeiro        | RJ             | Não me entregaram até hoje, alegando que a mercadoria foi roubada.                                                                                                                                       |                             |
| 00b6e66f005a657a6b13eedcacdf9342 | macae                 | RJ             | Comprei 2 (dois) Tablet Qbex Zupin TX120 7" 4GB Dual Core Android 4.2 Preto e recebi apenas 1 (um). A nota fiscal apresenta 2 unidades, mas na caixa lacrada só havia 1 (um). Me considero roubado.      |                             |
| 2bc1eac46ee8d6fad3f7369668f1bdf0 | rio de janeiro        | RJ             | A mercadoria foi roubada nos correios. Estou aguardando reposição.                                                                                                                                       |                             |
| 0444bf76794ff96fd22fff6be21bdb6a | timon                 | MA             | Demora para resolver meu problema pois meu pedido foi roubado dos correios e ainda hoje espero alguma solução mais se parece que resolver com o cliente vai ser uma das últimas prioridade...estou agua  |                             |
| 50aee6309ac7a0d4fd5c78ac0d4e5404 | catalao               | GO             | Não é possível avaliar o produto pois o produto foi roubado nos correios e até o presente momento eu não recebi a reposição.                                                                             |                             |

<br/>

In total, **26 orders** were **stolen**.

<br/>

From the stolen orders above, what's the proportion of stolen orders per state?

```SQL
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
	ops.customer_state,
	ops.order_count
ORDER BY
	FORMAT(CAST(COUNT(od.order_id) AS FLOAT) / CAST(ops.order_count AS FLOAT),'P') DESC 
```

| customer_state | stolen_orders | total_orders | %_of_stolen_orders | 1_stolen_order_for_each |
|----------------|---------------|--------------|--------------------|-------------------------|
| RN             | 1             | 485          | 0.21%              | 485                     |
| MA             | 1             | 747          | 0.13%              | 747                     |
| RJ             | 7             | 12852        | 0.05%              | 1836                    |
| GO             | 1             | 2020         | 0.05%              | 2020                    |
| SP             | 16            | 41746        | 0.04%              | 2609                    |

<br/>

Regarding **stolen orders, Rio Grande do Norte** is the **worst**, with **1 stolen order in every 485 orders**.

<br/>

Which state of Brazil has more customers?
```SQL
WITH cte_customer AS (
	SELECT
		DISTINCT
		customer_unique_id,
		customer_state
	FROM
		Brazilian_Ecommerce_Data.dbo.olist_customers_dataset
)
SELECT
	customer_state,
	COUNT(customer_unique_id) AS customer_count
FROM
	cte_customer
GROUP BY
	customer_state
```

![customer_count_state](https://user-images.githubusercontent.com/127568471/234719647-5ee59ae4-1f37-493f-b28c-6478f24829e0.png)

<br/>

**São Paulo, Rio de Janeiro, and Minas Gerais** have, together, **63945 customers**. This represents **67% of total customers**.

<br/>

Which state of Brazil has more orders?
```SQL
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
```

![order_count_state](https://user-images.githubusercontent.com/127568471/234719701-fad0f6e7-c976-4aab-80bd-ea453e3c6618.png)

<br/>

Once again, the states with **more orders** are **São Paulo, Rio de Janeiro, and Minas Gerais**. They represent **67% of the total orders**.

<br/>

Which city of Brazil has higher freight value?
```SQL
SELECT TOP 3
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
```
| customer_city | customer_state | avg_freight_value |
|---------------|----------------|-------------------|
| itupiranga    | PA             | 203,38            |
| amarante      | PI             | 193,84            |
| almino afonso | RN             | 170,11            |

<br/>

Counting orders by status
```SQL
SELECT
	order_status,
	COUNT(DISTINCT order_id) AS order_count
FROM
	Brazilian_Ecommerce_Data.dbo.olist_orders_dataset
GROUP BY
	order_status
ORDER BY
	COUNT(DISTINCT order_id) DESC
```
| order_status | order_count |
|--------------|-------------|
| delivered    | 96478       |
| shipped      | 1107        |
| canceled     | 625         |
| unavailable  | 609         |
| invoiced     | 314         |
| processing   | 301         |
| created      | 5           |
| approved     | 2           |

<br/>

The vast majority of orders were **delivered**, representing **96478 orders**.

<br/>

Checking how much from GMV was delivered
```SQL
SELECT
	od.order_status,
	ROUND(SUM(oid.price),2) AS GMV
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_items_dataset oid
JOIN
	Brazilian_Ecommerce_Data.dbo.olist_orders_dataset od
ON
	oid.order_id = od.order_id
GROUP BY
	od.order_status
```
| order_status | GMV         |
|--------------|-------------|
| approved     | 209,6       |
| canceled     | 95235,27    |
| delivered    | 13221498,11 |
| invoiced     | 61526,37    |
| processing   | 60439,22    |
| shipped      | 150727,44   |
| unavailable  | 2007,69     |

<br/>

The total **GMV** for **delivered orders** is **R$ 13.221.498,11**.

<br/>

Counting orders purchased by review score:
```SQL
SELECT
	review_score,
	COUNT(order_id) AS order_count,
	FORMAT(CAST(COUNT(order_id) AS FLOAT)/(SELECT CAST(COUNT(order_id) AS FLOAT) FROM Brazilian_Ecommerce_Data.dbo.olist_order_reviews_dataset),'P') AS '%ofTotal'
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_reviews_dataset
GROUP BY
	review_score
ORDER BY
	review_score DESC
```
| review_score | order_count | %ofTotal |
|--------------|-------------|----------|
| 5            | 57328       | 57.78%   |
| 4            | 19142       | 19.29%   |
| 3            | 8179        | 8.24%    |
| 2            | 3151        | 3.18%    |
| 1            | 11424       | 11.51%   |

![order_count_review_score](https://user-images.githubusercontent.com/127568471/234719783-24fa87f5-4e86-45a6-9ea5-9c61d0c90d1a.png)

<br/>

**57,78% of the orders** have received a **5-star review**. 

<br/>

Which cities have the highest revenue?
```SQL
WITH cte_payments AS (
	SELECT DISTINCT
		order_id,
		SUM(payment_value) AS payment_value
	FROM
		Brazilian_Ecommerce_Data.dbo.olist_order_payments_dataset
	GROUP BY
		order_id
)

SELECT TOP 3
	cd.customer_state,
	cd.customer_city,
	COUNT(od.order_id) AS order_count,
	ROUND(SUM(p.payment_value),2) AS total_customer_payment
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
```
| customer_state | customer_city  | order_count | total_customer_payment |
|----------------|----------------|-------------|------------------------|
| SP             | sao paulo      | 15045       | 2108162,22             |
| RJ             | rio de janeiro | 6601        | 1111872,32             |
| MG             | belo horizonte | 2697        | 406050,87              |

<br/>

Following the trend, **São Paulo, Rio de Janeiro, and Belo Horizonte** are ranked as the **top 3 cities** regarding **revenue**.

<br/>

Which sellers have most unique orders, 5 star ratings and highest profit?
```SQL
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
```
| description                         | seller_id                        | value    |
|-------------------------------------|----------------------------------|----------|
| Seller with most of unique orders : | 6560211a19b47992c3666cc44a7e94c0 | 1809     |
| Seller with most 5 star ratings :   | cc419e0650a3c5ba77189a1882b7556a | 1014     |
| Seller with highest Profit :        | 4869f7a5dfa277a7dca6462dcf3b52b2 | 247937,8 |

<br/>

Measuring delivery success rate per state
```SQL
SELECT
	cd.customer_state AS customer_state,
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
ORDER BY
	cd.customer_state
```
| customer_state | delivered_orders | not_delivered_orders | total_orders | %_delivered_orders | %_not_delivered_orders |
|----------------|------------------|----------------------|--------------|--------------------|------------------------|
| AC             | 80               | 1                    | 81           | 98.77%             | 1.23%                  |
| AL             | 397              | 16                   | 413          | 96.13%             | 3.87%                  |
| AM             | 145              | 3                    | 148          | 97.97%             | 2.03%                  |
| AP             | 67               | 1                    | 68           | 98.53%             | 1.47%                  |
| BA             | 3256             | 124                  | 3380         | 96.33%             | 3.67%                  |
| CE             | 1279             | 57                   | 1336         | 95.73%             | 4.27%                  |
| DF             | 2080             | 60                   | 2140         | 97.20%             | 2.80%                  |
| ES             | 1995             | 38                   | 2033         | 98.13%             | 1.87%                  |
| GO             | 1957             | 63                   | 2020         | 96.88%             | 3.12%                  |
| MA             | 717              | 30                   | 747          | 95.98%             | 4.02%                  |
| MG             | 11354            | 281                  | 11635        | 97.58%             | 2.42%                  |
| MS             | 701              | 14                   | 715          | 98.04%             | 1.96%                  |
| MT             | 886              | 21                   | 907          | 97.68%             | 2.32%                  |
| PA             | 946              | 29                   | 975          | 97.03%             | 2.97%                  |
| PB             | 517              | 19                   | 536          | 96.46%             | 3.54%                  |
| PE             | 1593             | 59                   | 1652         | 96.43%             | 3.57%                  |
| PI             | 476              | 19                   | 495          | 96.16%             | 3.84%                  |
| PR             | 4923             | 122                  | 5045         | 97.58%             | 2.42%                  |
| RJ             | 12350            | 502                  | 12852        | 96.09%             | 3.91%                  |
| RN             | 474              | 11                   | 485          | 97.73%             | 2.27%                  |
| RO             | 243              | 10                   | 253          | 96.05%             | 3.95%                  |
| RR             | 41               | 5                    | 46           | 89.13%             | 10.87%                 |
| RS             | 5345             | 121                  | 5466         | 97.79%             | 2.21%                  |
| SC             | 3546             | 91                   | 3637         | 97.50%             | 2.50%                  |
| SE             | 335              | 15                   | 350          | 95.71%             | 4.29%                  |
| SP             | 40501            | 1245                 | 41746        | 97.02%             | 2.98%                  |
| TO             | 274              | 6                    | 280          | 97.86%             | 2.14%                  |

<br/>

**Acre** is the **leading state** regarding **delivered orders**, with **97.53%**. **Roraima** leads the total in **not delivered orders** with **10.87%**. 

<br/>

About category quantity and revenue
```SQL
WITH cte_payments AS (
	SELECT DISTINCT
		order_id,
		SUM(payment_value) AS revenue
	FROM
		Brazilian_Ecommerce_Data.dbo.olist_order_payments_dataset
	GROUP BY
		order_id
)

SELECT
	CASE 
		WHEN pd.product_category_name = 'eletrodomesticos_2' THEN 'eletrodomesticos'
		WHEN pd.product_category_name = 'casa_conforto_2' THEN 'casa_conforto'
	ELSE
		pd.product_category_name
	END AS product_category_name,
	COUNT(oid.order_id) AS order_count,
	ROUND(SUM(p.revenue),2) AS total_revenue
FROM
	Brazilian_Ecommerce_Data.dbo.olist_order_items_dataset oid
LEFT JOIN
	Brazilian_Ecommerce_Data.dbo.olist_products_dataset pd
ON
	oid.product_id	= pd.product_id
JOIN
	cte_payments p
ON
	oid.order_id = p.order_id
GROUP BY
	pd.product_category_name
```
| product_category_name                          | order_count | total_revenue |
|------------------------------------------------|-------------|---------------|
| construcao_ferramentas_iluminacao              | 304         | 72712,48      |
| livros_tecnicos                                | 267         | 24915,44      |
| moveis_cozinha_area_de_servico_jantar_e_jardim | 281         | 74660,98      |
| moveis_sala                                    | 503         | 136138,77     |
| bebes                                          | 3065        | 539845,66     |
| dvds_blu_ray                                   | 64          | 7935,28       |
| la_cuisine                                     | 14          | 2913,53       |
| moveis_escritorio                              | 1691        | 646826,49     |
| artigos_de_festas                              | 43          | 5966,31       |
| fashion_calcados                               | 262         | 32422,74      |
| fashion_esporte                                | 30          | 3645,92       |
| fashion_underwear_e_moda_praia                 | 131         | 12714,54      |
| brinquedos                                     | 4117        | 619037,69     |
| cool_stuff                                     | 3796        | 779698        |
| eletroportateis                                | 679         | 225584,38     |
| informatica_acessorios                         | 7827        | 1585330,45    |
| relogios_presentes                             | 5991        | 1429216,68    |
| audio                                          | 364         | 60324,62      |
| beleza_saude                                   | 9667        | 1657373,12    |
| eletronicos                                    | 2767        | 259857,1      |
| esporte_lazer                                  | 8641        | 1392127,56    |
| fashion_bolsas_e_acessorios                    | 2031        | 218158,28     |
| tablets_impressao_imagem                       | 83          | 10042,93      |
| artes                                          | 209         | 30992,93      |
| casa_construcao                                | 604         | 136645,29     |
| cds_dvds_musicais                              | 14          | 1199,43       |
| construcao_ferramentas_jardim                  | 238         | 42394,41      |
| fashion_roupa_feminina                         | 48          | 5109,62       |
| musica                                         | 38          | 6901,43       |
| telefonia                                      | 4545        | 486882,05     |
| alimentos                                      | 510         | 46428,67      |
| alimentos_bebidas                              | 278         | 27289,73      |
| artes_e_artesanato                             | 24          | 2326,17       |
| cama_mesa_banho                                | 11115       | 1712553,67    |
| fashion_roupa_infanto_juvenil                  | 8           | 785,67        |
| livros_importados                              | 60          | 6701,89       |
| papelaria                                      | 2517        | 317440,07     |
| fashion_roupa_masculina                        | 132         | 17290,98      |
| moveis_decoracao                               | 8334        | 1430176,39    |
| moveis_quarto                                  | 109         | 31598,94      |
| pc_gamer                                       | 9           | 2174,43       |
| pcs                                            | 203         | 279121,55     |
| perfumaria                                     | 3419        | 506738,66     |
| cine_foto                                      | 72          | 9530,32       |
| construcao_ferramentas_seguranca               | 194         | 65691,03      |
| instrumentos_musicais                          | 680         | 233074,12     |
| portateis_casa_forno_e_cafe                    | 76          | 51229,32      |
| portateis_cozinha_e_preparadores_de_alimentos  | 15          | 4335,65       |
| agro_industria_e_comercio                      | 212         | 118730,61     |
| automotivo                                     | 4235        | 852294,33     |
| bebidas                                        | 379         | 71429,65      |
| casa_conforto                                  | 30          | 1710,54       |
| construcao_ferramentas_ferramentas             | 103         | 21069,07      |
| fraldas_higiene                                | 39          | 4221,25       |
| industria_comercio_e_negocios                  | 268         | 56745,76      |
| market_place                                   | 311         | 45335,92      |
| pet_shop                                       | 1947        | 311268,97     |
| utilidades_domesticas                          | 6964        | 1094758,13    |
| NULL                                           | 1603        | 252801,71     |
| casa_conforto                                  | 434         | 84329,06      |
| climatizacao                                   | 297         | 91170,66      |
| consoles_games                                 | 1137        | 195480,38     |
| construcao_ferramentas_construcao              | 929         | 241475,63     |
| eletrodomesticos                               | 238         | 124563,46     |
| livros_interesse_geral                         | 553         | 64694,76      |
| malas_acessorios                               | 1092        | 187151,29     |
| seguros_e_servicos                             | 2           | 324,51        |
| artigos_de_natal                               | 153         | 18994,77      |
| eletrodomesticos                               | 771         | 95532,27      |
| ferramentas_jardim                             | 4347        | 838280,75     |
| flores                                         | 33          | 2213,01       |
| moveis_colchao_e_estofado                      | 38          | 5998,54       |
| sinalizacao_e_seguranca                        | 199         | 68488,05      |
| telefonia_fixa                                 | 264         | 207010,26     |

<br/>
<br/>

# __Q&A Summary__

* How many customers we have?
  * 96096 .

<br/>

* Regarding payment type preferences, what are customers preferences?
  * Credit Card was used 76795 times and is the preferred payment type amongst others. It represents 73,92% of the total.

<br/>

* In how many installments customers usually pay?
  * The average of installments considering Credit Card is 3.5.

<br/>

* What are the best and worst selling months?
  * The month with the most sales considering the year of 2017 is November with 7480 orders. The worst one is January with 790 orders.

<br/>

* Considering all the orders, how many of them have been stolen?
  * In total, 26 orders were stolen.

<br/>

* From the stolen orders, what's the proportion of stolen orders per state?
  * Regarding stolen orders, Rio Grande do Norte is the worst, with 1 stolen order in every 485 orders.

<br/>

* Which state of Brazil has more customers?
  * São Paulo, Rio de Janeiro, and Minas Gerais have, together, 63945 customers. This represents 67% of total customers.

<br/>

* Which state of Brazil has more orders?
  * Once again, the states with more orders are São Paulo, Rio de Janeiro, and Minas Gerais. They represent 67% of the total orders.

<br/>

* Which city of Brazil has higher freight value?
  * Itupiranga has the higher freight value R$ 203.38.

<br/>

* Orders by status:
  * The vast majority of orders were delivered, representing 96478 orders.

<br/>

* How much from GMV was delivered?
  * The total GMV for delivered orders is R$ 13.221.498,11.

<br/>

* Counting orders purchased by review score:
  * 57,78% of the orders have received a 5-star review.

<br/>

* Which cities have the highest revenue?
  * Following the trend, São Paulo, Rio de Janeiro, and Belo Horizonte are ranked as the top 3 cities regarding revenue.

<br/>

* Measuring delivery success rate per state:
  * Acre is the leading state regarding delivered orders, with 97.53%. Roraima leads the total in not delivered orders with 10.87%.
