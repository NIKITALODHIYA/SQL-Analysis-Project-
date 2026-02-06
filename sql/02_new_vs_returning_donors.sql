WITH first_gift AS (
  SELECT donor_id, MIN(donation_date) AS first_donation_date
  FROM fundraising
  WHERE status = 'Settled'
  GROUP BY donor_id
)
SELECT
  CASE WHEN f.donation_date = fg.first_donation_date THEN 'New' ELSE 'Returning' END AS donor_status,
  COUNT(DISTINCT f.donor_id) AS donors,
  COUNT(*) AS donations,
  ROUND(AVG(f.net_amount_gbp), 0) AS avg_net_gbp
FROM fundraising f
JOIN first_gift fg ON fg.donor_id = f.donor_id
WHERE f.status = 'Settled'
GROUP BY donor_status;
