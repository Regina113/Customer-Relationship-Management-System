-- Customers
CREATE TABLE Customers (
       CustomerID INT PRIMARY KEY AUTO_INCREMENT,
       FirstName VARCHAR(50),
       LastName VARCHAR(50),
       Email VARCHAR(100),
       Phone VARCHAR(20),
       JoinDate DATE,
       City VARCHAR(50),
       Country VARCHAR(50)
);

-- Products
CREATE TABLE Products (
       ProductID INT PRIMARY KEY AUTO_INCREMENT,
       ProductName VARCHAR(100),
       Price DECIMAL(10, 2),
       Category VARCHAR(50)
);

-- Orders
CREATE TABLE Orders (
       OrderID INT PRIMARY KEY AUTO_INCREMENT,
       CustomerID INT,
       OrderDate DATE,
       TotalAmount DECIMAL(10, 2),
       FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderDetails
CREATE TABLE OrderDetails (
       OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
       OrderID INT,
       ProductID INT, 
       Quantity INT,
       FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
       FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Interactions
CREATE TABLE Interactions (
       InteractionID INT PRIMARY KEY AUTO_INCREMENT,
       CustomerID INT, 
       InteractionType VARCHAR(50),
       InteractionDate DATE,
       Notes TEXT,
       FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- SupportTickets
CREATE TABLE SupportTickets (
       TicketID INT PRIMARY KEY AUTO_INCREMENT,
       CustomerID INT,
       Issue VARCHAR(200),
       Status VARCHAR(20),
       OpenedDate DATE,
       ResolvedDate DATE,
       FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Campaigns
CREATE TABLE Campaigns (
       CampaignID INT PRIMARY KEY AUTO_INCREMENT,
       CampaignName VARCHAR(100),
       StartDate DATE,
       EndDate DATE,
       Channel VARCHAR(50)
);

-- Campaign Participation
CREATE TABLE CampaignParticipation (
       ParticipationID INT PRIMARY KEY AUTO_INCREMENT,
       CustomerID INT,
       CampaignID INT,
       ParticipationDate DATE,
       FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
       FOREIGN KEY (CampaignID) REFERENCES Campaigns(CampaignID)
);

-- Customers
INSERT INTO Customers(FirstName, LastName, Email, Phone, JoinDate, City, Country)
            VALUES('Alice', 'Morgan', 'alice@example.com', '1234567890', '2023-01-15', 'New York', 'USA');
INSERT INTO Customers(FirstName, LastName, Email, Phone, JoinDate, City, Country)
            VALUES('Bob', 'Smith', 'bob@example.com', '2345678901', '2023-02-10', 'Los Angeles', 'USA');
INSERT INTO Customers(FirstName, LastName, Email, Phone, JoinDate, City, Country)
            VALUES('Charlie', 'Lee', 'charlie@example.com', '3456789012', '2023-03-20', 'Chicago', 'USA');

-- Products
INSERT INTO Products(ProductName, Price, Category)
            VALUES('Laptop', 1200.00, 'Electronics');
INSERT INTO Products(ProductName, Price, Category)
            VALUES('Headphones', 200.00, 'Accessories');
INSERT INTO Products(ProductName, Price, Category)
            VALUES('Phone', 800.00, 'Electronics');

-- Orders and Details
INSERT INTO Orders(CustomerID, OrderDate, TotalAmount)
            VALUES(1, '2023-04-01', 1400.00);
INSERT INTO Orders(CustomerID, OrderDate, TotalAmount)
            VALUES(2, '2023-04-03', 800.00);

INSERT INTO OrderDetails(OrderID, ProductID, Quantity)
            VALUES(1, 1, 1);
INSERT INTO OrderDetails(OrderID, ProductID, Quantity)
            VALUES(1, 2, 1);
INSERT INTO OrderDetails(OrderID, ProductID, Quantity)
            VALUES(2, 3, 1);

-- Interactions
INSERT INTO Interactions(CustomerID, InteractionType, InteractionDate, Notes)
            VALUES(1, 'Email', '2023-04-10', 'Asked about delivery time.');
INSERT INTO Interactions(CustomerID, InteractionType, InteractionDate, Notes)      
            VALUES(2, 'Call', '2023-04-05', 'Requested refund.');

-- Support Tickets
INSERT INTO SupportTickets(CustomerID, Issue, Status, OpenedDate, ResolvedDate)
            VALUES(2, 'Delayed shipment', 'Resolved', '2023-04-04', '2023-04-07');

-- Campaigns
INSERT INTO Campaigns(CampaignName, StartDate, EndDate, Channel)
            VALUES('Spring Sale', '2023-03-01', '2023-03-31', 'Email');
INSERT INTO Campaigns(CampaignName, StartDate, EndDate, Channel)
            VALUES('Tech Promo', '2023-04-01', '2023-04-30', 'Social Media');

-- Campaign Participation
INSERT INTO CampaignParticipation(CustomerID, CampaignID, ParticipationDate)
            VALUES(1, 1, '2023-03-10');
INSERT INTO Campaigns(CampaignName, StartDate, EndDate, Channel)
            VALUES(2, 2, '2023-04-05');