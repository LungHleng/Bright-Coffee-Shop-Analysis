   SELECT 
    transaction_date AS Purchase_date,
    DAYNAME(transaction_date) AS Day_name,
    MONTHNAME(transaction_date) AS Month_name,
    DAYOFMONTH(transaction_date) AS day_of_month,
    CASE 
        WHEN DAYNAME(transaction_date) IN ('Saturday', 'Sunday') THEN 'Weekend' 
        ELSE 'Weekdays' 
    END AS Day_classification,
    CASE 
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '05:00:00' AND '11:59:59' THEN 'Morning'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        WHEN date_format(transaction_time, 'HH:mm:ss') >= '17:00:00' THEN 'Evening'
    END AS time_buckets,
    COUNT(DISTINCT transaction_id) AS Number_of_sales,
    COUNT(DISTINCT product_id) AS Number_of_products,
    COUNT(DISTINCT store_id) AS Number_of_stores,
    SUM(transaction_qty * unit_price) AS revenue_per_day,
    CASE 
        WHEN SUM(transaction_qty * unit_price) <= 50 THEN 'Low Spend'
        WHEN SUM(transaction_qty * unit_price) BETWEEN 51 AND 100 THEN 'Medium Spend'
        ELSE 'High Spend'
    END AS spend_bucket,
    store_location,
    product_category,
    product_detail
FROM workspace.default.coffee_clean_stage
GROUP BY 
    transaction_date,
    DAYNAME(transaction_date),
    MONTHNAME(transaction_date),
    DAYOFMONTH(transaction_date),
    CASE 
        WHEN DAYNAME(transaction_date) IN ('Saturday', 'Sunday') THEN 'Weekend' 
        ELSE 'Weekdays' 
    END,
    CASE 
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '05:00:00' AND '11:59:59' THEN 'Morning'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        WHEN date_format(transaction_time, 'HH:mm:ss') >= '17:00:00' THEN 'Evening'
    END,
    store_location,
    product_category,
    product_detail;


    SELECT 
    -- existing columns
    product_type  -- add this
FROM workspace.default.coffee_clean_stage
GROUP BY 
    -- existing columns
    product_type;  -- add this

    SELECT 
    transaction_date AS Purchase_date,
    DAYNAME(transaction_date) AS Day_name,
    MONTHNAME(transaction_date) AS Month_name,
    DAYOFMONTH(transaction_date) AS day_of_month,
    CASE 
        WHEN DAYNAME(transaction_date) IN ('Saturday', 'Sunday') THEN 'Weekend' 
        ELSE 'Weekdays' 
    END AS Day_classification,
    CASE 
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '05:00:00' AND '11:59:59' THEN 'Morning'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        WHEN date_format(transaction_time, 'HH:mm:ss') >= '17:00:00' THEN 'Evening'
    END AS time_buckets,
    CASE 
        WHEN product_category IN ('Coffee', 'Espresso') THEN 'Hot Beverage'
        WHEN product_category = 'Tea' THEN 'Hot Beverage'
        ELSE 'Other'
    END AS product_type,
    COUNT(DISTINCT transaction_id) AS Number_of_sales,
    COUNT(DISTINCT product_id) AS Number_of_products,
    COUNT(DISTINCT store_id) AS Number_of_stores,
    SUM(transaction_qty * unit_price) AS revenue_per_day,
    CASE 
        WHEN SUM(transaction_qty * unit_price) <= 50 THEN 'Low Spend'
        WHEN SUM(transaction_qty * unit_price) BETWEEN 51 AND 100 THEN 'Medium Spend'
        ELSE 'High Spend'
    END AS spend_bucket,
    store_location,
    product_category,
    product_detail
FROM workspace.default.coffee_clean_stage
GROUP BY 
    transaction_date,
    DAYNAME(transaction_date),
    MONTHNAME(transaction_date),
    DAYOFMONTH(transaction_date),
    CASE 
        WHEN DAYNAME(transaction_date) IN ('Saturday', 'Sunday') THEN 'Weekend' 
        ELSE 'Weekdays' 
    END,
    CASE 
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '05:00:00' AND '11:59:59' THEN 'Morning'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        WHEN date_format(transaction_time, 'HH:mm:ss') >= '17:00:00' THEN 'Evening'
    END,
    CASE 
        WHEN product_category IN ('Coffee', 'Espresso') THEN 'Hot Beverage'
        WHEN product_category = 'Tea' THEN 'Hot Beverage'
        ELSE 'Other'
    END,
    store_location,
    product_category,
    product_detail;    
