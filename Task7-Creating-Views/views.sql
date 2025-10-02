DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;


-- Create tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name TEXT,
    City TEXT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data
INSERT INTO Customers VALUES (1, 'Aishwarya', 'Pune');
INSERT INTO Customers VALUES (2, 'Rohit', 'Mumbai');
INSERT INTO Customers VALUES (3, 'Neha', 'Delhi');

INSERT INTO Orders VALUES (101, 1, 500);
INSERT INTO Orders VALUES (102, 1, 1200);
INSERT INTO Orders VALUES (103, 2, 800);

-- Create a view for Customer Orders
CREATE VIEW CustomerOrders AS
SELECT c.Name, c.City, o.OrderID, o.Amount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Use the view
SELECT * FROM CustomerOrders;

-- Create a view for high value orders
CREATE VIEW HighValueOrders AS
SELECT Name, Amount
FROM CustomerOrders
WHERE Amount > 1000;

-- Use the view
SELECT * FROM HighValueOrders;
