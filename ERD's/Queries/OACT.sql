-- Question 1

 SELECT A.AU_ID, A.AU_FNAME, A.AU_LNAME 
 FROM AUTHOR A
 WHERE A.AU_ID NOT IN (SELECT a.AU_ID
					 FROM AUTHOR a
                     INNER JOIN WRITES W
                     ON a.AU_ID = W.AU_ID
                     INNER JOIN BOOK B
                     ON B.BOOK_NUM = W.BOOK_NUM
                     WHERE B.BOOK_SUBJECT = 'Programming') 
 ORDER BY A.AU_LNAME;
 
-- Question 2
SELECT B.BOOK_NUM, B.BOOK_TITLE, B.BOOK_SUBJECT, A.AVG_PRICE, (B.BOOK_COST - A.AVG_PRICE) PRICE_DIFF
FROM BOOK B
INNER JOIN (SELECT BOOK_SUBJECT, AVG(BOOK_COST) AVG_PRICE
			FROM BOOK 
			GROUP BY 1) A
ON A.BOOK_SUBJECT = B.BOOK_SUBJECT
ORDER BY 2;

-- Question 3

SELECT B.BOOK_NUM, B.BOOK_TITLE, B.BOOK_SUBJECT, A.AU_LNAME, 
       COUNT(B.BOOK_NUM) OVER (PARTITION BY A.AU_LNAME) BOOK_COUNT
		FROM BOOK B
		INNER JOIN WRITES W
		ON W.BOOK_NUM = B.BOOK_NUM
		INNER JOIN AUTHOR A
		ON W.AU_ID = A.AU_ID
		WHERE B.BOOK_SUBJECT = 'Cloud';






              
                     
                     
                     
                     
 