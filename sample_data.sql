INSERT INTO Customers (
    full_name,
    email,
    phone_number,
    status
)
VALUES
('John Smith', 'john@email.com', '0811111111', 'Active'),

('Sarah Adams', 'sarah@email.com', '0822222222', 'Active'),

('Michael Brown', 'michael@email.com', '0833333333', 'Suspended');
       
       
INSERT INTO Merchants (
    merchant_name,
    merchant_category,
    city,
    status
)
VALUES
('Shoprite', 'Retail', 'Cape Town', 'Active'),

('Takealot', 'Ecommerce', 'Johannesburg', 'Active'),

('Uber Eats', 'Food Delivery', 'Durban', 'Active');

INSERT INTO Accounts (
    customer_id,
    account_number,
    account_type,
    balance
)
VALUES
(1, 'ACC1001', 'Savings', 5000.00),

(2, 'ACC1002', 'Wallet', 3200.00),

(3, 'ACC1003', 'Business', 15000.00);
       
INSERT INTO Transactions (
    sender_account,
    receiver_account,
    merchant_id,
    amount,
    transaction_type,
    status
)
VALUES
(1, 2, 1, 250.00, 'Payment', 'Successful'),

(2, 1, 2, 1200.00, 'Transfer', 'Pending'),

(3, 1, 3, 25000.00, 'Payment', 'Failed');
       
INSERT INTO Refunds (
    transaction_id,
    refund_amount,
    refund_reason
)
VALUES
(1, 250.00, 'Duplicate payment');
       
INSERT INTO FraudFlags (
    transaction_id,
    risk_level,
    flag_reason
)
VALUES
(3, 'High', 'Transaction amount exceeded threshold');
       