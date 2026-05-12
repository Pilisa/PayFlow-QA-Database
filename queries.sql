SELECT sender_account,
       amount,
       COUNT(*) AS duplicate_count
FROM Transactions
GROUP BY sender_account, amount
HAVING COUNT(*) > 1;

SELECT *
FROM Transactions
WHERE amount > 10000;

SELECT r.refund_id,
       t.transaction_id,
       t.amount,
       r.refund_amount
FROM Refunds r
JOIN Transactions t
ON r.transaction_id = t.transaction_id
WHERE r.refund_amount > t.amount;

SELECT c.full_name,
       a.account_number,
       t.amount,
       t.status
FROM Customers c
JOIN Accounts a
ON c.customer_id = a.customer_id
JOIN Transactions t
ON a.account_id = t.sender_account;

