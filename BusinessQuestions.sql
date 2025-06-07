-- Business Questions
-- 1. Which customer has spent the most money overall?
SELECT Customers.FirstName, Customers.LastName, SUM(Orders.TotalAmount) AS TotalSpent 
FROM Customers JOIN Orders USING (CustomerID)
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 1; 

-- 2. How many support tickets were opened and resolved this month?
SELECT COUNT(*) AS TicketsOpened,
SUM(CASE WHEN ResolvedDate IS NOT NULL THEN 1 ELSE 0 END) AS TicketsResolved
FROM SupportTickets
WHERE MONTH(OpenedDate) = MONTH(CURRENT_DATE())
AND YEAR(OpenedDate) = YEAR(CURRENT_DATE());

-- 3. Which product category generated the highest revenue?
SELECT Products.Category, SUM(OrderDetails.Quantity * Products.Price) AS Revenue
FROM OrderDetails JOIN Products USING (ProductID)
GROUP BY Products.Category
ORDER BY Revenue DESC
LIMIT 1;

-- 4. How many unique customers interacted via email in the past 30 days?
SELECT COUNT(DISTINCT CustomerID) AS EmailInteractions
FROM Interactions
WHERE InteractionType = 'Email'
AND InteractionDate >= CURRENT_DATE() - INTERVAL 30 DAY;

-- 5. Which marketing campaign had the most customer participation?
SELECT Campaigns.CampaignName, COUNT(CampaignParticipation.CustomerID) AS Participants
FROM Campaigns JOIN CampaignParticipation USING (CampaignID)
GROUP BY Campaigns.CampaignID
ORDER BY Participants DESC
LIMIT 1;
