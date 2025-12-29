
SELECT 
    contract_no,
    status,
    start_date,
    loan_period_months,
    (start_date + (loan_period_months || ' months')::INTERVAL)::DATE AS end_date,
    CURRENT_DATE AS today,
    CASE 
        WHEN (start_date + (loan_period_months || ' months')::INTERVAL)::DATE < CURRENT_DATE THEN 'Should be Overdue'
        ELSE 'OK'
    END AS check_status
FROM loan_contracts
WHERE status = 'active'
ORDER BY end_date ASC;
