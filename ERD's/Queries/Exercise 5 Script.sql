-- Create the table
DROP TABLE IF EXISTS #TimeCards;

CREATE TABLE #TimeCards(
	TimeStampID INT NOT NULL IDENTITY PRIMARY KEY,
	EmployeeID INT NOT NULL,
	ClockDateTime DATETIME2(0) NOT NULL,
	EventType VARCHAR(5) NOT NULL);

-- Populate the table
INSERT INTO #TimeCards(EmployeeID,
	ClockDateTime, EventType)
VALUES
	(1,'2021-01-02 08:00','ENTER'),
	(2,'2021-01-02 08:03','ENTER'),
	(2,'2021-01-02 12:00','EXIT'),
	(2,'2021-01-02 12:34','ENTER'),
	(3,'2021-01-02 16:30','ENTER'),
	(2,'2021-01-02 16:00','EXIT'),
	(1,'2021-01-02 16:07','EXIT'),
	(3,'2021-01-03 01:00','EXIT'),
	(2,'2021-01-03 08:10','ENTER'),
	(1,'2021-01-03 08:15','ENTER'),
	(2,'2021-01-03 12:17','EXIT'),
	(3,'2021-01-03 16:00','ENTER'),
	(1,'2021-01-03 15:59','EXIT'),
	(3,'2021-01-04 01:00','EXIT');