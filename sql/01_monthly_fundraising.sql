SELECT 
    DATE_FORMAT(donation_date, '%Y-%m-01') AS month,
    SUM(gross_amount_gbp) AS total_gross_gbp,
    SUM(net_amount_gbp) AS total_net_gbp,
    SUM(processing_fee_gbp) AS total_fees_gbp,
    COUNT(*) AS donation_count
FROM
    fundraising
WHERE
    status = 'Settled'
GROUP BY month
ORDER BY month;
