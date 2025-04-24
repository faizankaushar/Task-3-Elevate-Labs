create database intern;
use intern;

CREATE TABLE order1(
    order_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id INT
);

-- Sample data
INSERT INTO order1 (order_id, order_date, amount, product_id) VALUES
(1, '2023-01-15', 250.00, 101),
(2, '2023-01-18', 150.00, 102),
(3, '2023-02-05', 300.00, 103),
(4, '2023-02-10', 175.00, 101),
(5, '2023-03-01', 400.00, 104);

-- Sales Trend Analysis: Monthly Revenue and Order Volume

SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    orders
WHERE
    order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    order_year,
    order_month;

