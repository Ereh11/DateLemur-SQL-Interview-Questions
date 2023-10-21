SELECT card_name,
       issued_amount
FROM
(
    SELECT card_name,
          issued_amount,
          DENSE_RANK() OVER(PARTITION BY card_name ORDER BY issue_year, issue_month) AS rank
    FROM monthly_cards_issued
) AS TP
WHERE rank = 1
ORDER BY issued_amount DESC;