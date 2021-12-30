-- Question 5

SELECT DATE_FORMAT(start_date, "%b/%d/%y") AS Format_1,
	   DATE_FORMAT(start_date, "%c/%e/%y") AS Format_2,
       DATE_FORMAT(start_date, "%h:%i %p") AS Format_3
FROM accountspayable.date_sample;

-- Question 6

SELECT vendor_name AS Vendor_Name,
UPPER(vendor_name) AS CAPS_NAME,
vendor_phone,
RIGHT(vendor_phone, 4) AS LAST_FOUR_DIGITS,
REPLACE(REPLACE(REPLACE(RIGHT(vendor_phone, 13),')','.')," ",""),"-",".") AS PHONENUMBER, 
CASE vendor_name
    WHEN (LOCATE(' ', vendor_name) = 0) THEN (SUBSTRING_INDEX(SUBSTRING(vendor_name, LOCATE(' ', vendor_name) + 1),' ', 1))
    ELSE ''
END AS LASTNAME
FROM vendors;

-- Question 7

SELECT invoice_number AS Invoice_Number,
invoice_date AS Invoice_Date,
DATE_ADD(invoice_date, INTERVAL 30 day) AS New_Invoice_Date,
payment_date AS Payment_Date,
DATEDIFF(payment_date, invoice_date) AS Days_To_Pay,
DATE_FORMAT(invoice_date, '%m') AS MONTH,
LEFT(invoice_date, 4) AS YEAR
FROM invoices
WHERE DATE_FORMAT(invoice_date,'%b') = 'May';


-- Question 8

SELECT emp_name,
	   REGEXP_SUBSTR(emp_name, '[A-z]*' ) FirstName,
       REGEXP_REPLACE(emp_name, TRIM(REGEXP_SUBSTR(emp_name, '[A-z]*')), '') LastName
from string_sample;



