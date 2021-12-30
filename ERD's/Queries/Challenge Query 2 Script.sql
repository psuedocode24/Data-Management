IF OBJECT_ID('tempdb.dbo.##DetailedSchedule','U') IS NOT NULL
  DROP TABLE ##DetailedSchedule;
GO

CREATE TABLE ##DetailedSchedule
(
StartDate	DATE,
EndDate		DATE
);
GO

INSERT INTO ##DetailedSchedule VALUES
('1/11/2021','1/13/2021'),
('1/11/2021','1/15/2021'),
('1/11/2021','1/12/2021'),
('1/13/2021','1/19/2021'),
('1/20/2021','1/22/2021'),
('1/24/2021','1/26/2021'),
('1/25/2021','1/29/2021');
GO

/* Start writing your query here */