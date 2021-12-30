IF OBJECT_ID('tempdb.dbo.#GameScores','U') IS NOT NULL
	DROP TABLE #GameScores;
GO

CREATE TABLE #GameScores
(
FirstPlayer	 VARCHAR(10),
SecondPlayer VARCHAR(10),
Score		 INTEGER
);
GO

INSERT INTO #GameScores VALUES
('Joe','Ryan', 120),
('Sue', 'Jackie', 200),
('Ryan', 'Sue', 50),
('Ryan', 'Joe', 100);
GO

/* Start writing your query here...*/