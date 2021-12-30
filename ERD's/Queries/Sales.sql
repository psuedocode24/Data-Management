-- Question 1

SELECT A.CustFirstName, 
	   A.CustLastName 
FROM
(
	SELECT A.CustomerID, 
		   A.CustFirstName, 
		   A.CustLastName, 
           D.ProductName, -- A.CustFirstName, A.CustLastName
		   CASE WHEN D.ProductName LIKE '%Helmet%' THEN 'Helmet'
				WHEN D.ProductName LIKE '%Bike%' AND E.CategoryDescription = 'Bikes' THEN 'Bike'
				ELSE 'Other' END AS prod 
    FROM CUSTOMERS A
	INNER JOIN Orders B
	ON A.CustomerID = B.CustomerID
	INNER JOIN Order_Details C
	ON B.OrderNumber = C.OrderNumber
	INNER JOIN Products D
	ON C.ProductNumber = D.ProductNumber
	INNER JOIN Categories E
	ON D.CategoryID = E.CategoryID) A
WHERE prod IN ('Helmet','Bike')
GROUP BY 1,2
HAVING COUNT(DISTINCT prod) > 1;



-- Question 2



SELECT A.ProductName, S
FROM (SELECT C.CategoryID, A.ProductNumber, A.ProductName, SUM(QuotedPrice*QuantityOrdered) AS S
	  FROM Products A
	  INNER JOIN Order_Details B
	  ON A.ProductNumber = B.ProductNumber
      INNER JOIN Categories C
	  ON A.CategoryID = C.CategoryID
	  GROUP BY 1,2,3) A
INNER JOIN (SELECT A.CategoryID, AVG(S) AS AVG_S
			FROM (SELECT C.CategoryID, B.ProductNumber, SUM(QuotedPrice*QuantityOrdered) AS S
				  FROM Products A
				  INNER JOIN Order_Details B
				  ON A.ProductNumber = B.ProductNumber
                  INNER JOIN Categories C
                  ON A.CategoryID = C.CategoryID
                  GROUP BY 1,2) A
			GROUP BY 1) B
ON A.CategoryID = B.CategoryID
WHERE A.S > B.AVG_S;




-- Question 3 

SELECT A.CustFirstName, A.CustLastName, A.OrderNumber
FROM
(
	SELECT A.CustomerID, A.CustFirstName, A.CustLastName, B.OrderNumber, D.ProductName,
		   CASE WHEN D.ProductName LIKE '%Helmet%' THEN 'Helmet'
				WHEN D.ProductName LIKE '%Bike%' AND E.CategoryDescription = 'Bikes' THEN 'Bike'
				ELSE 'Other' END AS prod
    FROM CUSTOMERS A
	INNER JOIN Orders B
	ON A.CustomerID = B.CustomerID
	INNER JOIN Order_Details C
	ON B.OrderNumber = C.OrderNumber
	INNER JOIN Products D
	ON C.ProductNumber = D.ProductNumber
	INNER JOIN Categories E
	ON D.CategoryID = E.CategoryID) A
WHERE prod IN ('Helmet','Bike')
GROUP BY 1,2,3
HAVING COUNT(DISTINCT prod) > 1;




-- Question 4

SELECT A.CustomerID,
	   CASE WHEN B.CustomerID IS NULL THEN 'Not Ordered'
			ELSE 'Ordered' END AS Order_Placed
FROM Customers A
LEFT JOIN (SELECT CustomerID
           FROM SalesOrdersDatabase.Orders 
           WHERE OrderDate BETWEEN '2017-12-01' AND '2017-12-07'
           GROUP BY 1
)B
ON A.CustomerID = B.CustomerID
GROUP BY 1;
 

-- Question 5
SELECT EmployeeID,
ROUND(DATEDIFF('2018-02-15',EmpBirthDate) / 365.25, 0) AS Age
FROM Employees;

-- Question 6

SELECT *, RANK() OVER (ORDER BY OrderCount DESC) 
FROM (
SELECT A.EmployeeID, COUNT(B.OrderNumber) OrderCount
FROM SalesOrdersDatabase.Employees A
INNER JOIN SalesOrdersDatabase.Orders B
ON A.EmployeeID = B.EmployeeID
GROUP BY 1
) A;



-- Question 7

SELECT P.ProductNumber, COUNT(O.QuantityOrdered)
FROM Products P
INNER JOIN Order_Details O
ON O.ProductNumber = P.ProductNumber
GROUP BY ProductNumber;



