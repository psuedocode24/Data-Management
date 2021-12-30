IF OBJECT_ID('tempdb.dbo.#Groupings','U') IS NOT NULL
  DROP TABLE #Groupings;
GO

CREATE TABLE #Groupings
(
StepNumber	INTEGER,
TestCase	VARCHAR(MAX),
Status		VARCHAR(MAX)
);
GO

INSERT INTO #Groupings VALUES
(1,'Test Case 1','Passed'),
(2,'Test Case 2','Passed'),
(3,'Test Case 3','Passed'),
(4,'Test Case 4','Passed'),
(5,'Test Case 5','Failed'),
(6,'Test Case 6','Failed'),
(7,'Test Case 7','Failed'),
(8,'Test Case 8','Failed'),
(9,'Test Case 9','Failed'),
(10,'Test Case 10','Passed'),
(11,'Test Case 11','Passed'),
(12,'Test Case 12','Passed');
GO

WITH cte AS (
 SELECT Id, Name, grp = SUM(CASE WHEN Name = prev THEN 0 ELSE 1 END) OVER(ORDER BY id)
 FROM (SELECT *, prev = LAG(Name) OVER(ORDER BY id) FROM t) s
)
SELECT name, cnt = COUNT(*)
FROM cte
GROUP BY grp,name
ORDER BY grp;
