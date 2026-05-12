CREATE DATABASE PayFlowQA;

USE PayFlowQA;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Merchants (
    merchant_id INT PRIMARY KEY AUTO_INCREMENT,
    merchant_name VARCHAR(100) NOT NULL,
    merchant_category VARCHAR(50),
    city VARCHAR(50),
    status VARCHAR(20)
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    account_type VARCHAR(20),
    balance DECIMAL(12,2),

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    sender_account INT,
    receiver_account INT,
    merchant_id INT,
    amount DECIMAL(12,2),
    transaction_type VARCHAR(30),
    status VARCHAR(20),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (sender_account)
    REFERENCES Accounts(account_id),

    FOREIGN KEY (receiver_account)
    REFERENCES Accounts(account_id),

    FOREIGN KEY (merchant_id)
    REFERENCES Merchants(merchant_id)
);

CREATE TABLE Refunds (
    refund_id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_id INT,
    refund_amount DECIMAL(12,2),
    refund_reason VARCHAR(255),
    refund_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (transaction_id)
    REFERENCES Transactions(transaction_id)
);

CREATE TABLE FraudFlags (
    flag_id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_id INT,
    risk_level VARCHAR(20),
    flag_reason VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (transaction_id)
    REFERENCES Transactions(transaction_id)
);

CHECK (balance >= 0)

CHECK (amount > 0)

CHECK (status IN ('Pending', 'Successful', 'Failed'))

CHECK (risk_level IN ('Low', 'Medium', 'High')

       
       
       