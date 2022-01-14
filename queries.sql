--SELECT statements
--
--This query lists all the information in all the fields in the patients relation
SELECT * FROM patients;
--
--This query outputs the first name, surname and date of birth of all patients with the surname Murphy
SELECT firstName, surname, dob FROM patients WHERE surname = 'MURPHY';
--
--This query outputs the patient ID and postcode of all patients with the surname Murphy who do not have an address in Mayo
SELECT patientID, postcode FROM patients WHERE surname = 'MURPHY' AND county != 'MAYO';
--
--This query outputs the name of all lineitems which a cost of 60 or more 
SELECT name FROM lineitem WHERE cost >= 60.00;
--
--This query outputs the lineitem ID and name of all lineitems(
SELECT lineitemID, name FROM lineitem WHERE cost BETWEEN 40 AND 70;
--
--This query lists all the information about those whose county is either mayo or galway
SELECT * FROM patients WHERE county in ('galway','mayo'); 
--
--This query lists all the distinct counties in the patients table
SELECT DISTINCT COUNTY FROM PATIENTS;
--
--This query lists details on patients whose county is Cork and displays the rows in surname order
SELECT firstName, surname, patientID FROM patients WHERE county = 'cork' ORDER BY surname;
--
/*This query lists details on patients whose county is Cork and display the rows in surname order and then descending patientID order*/
SELECT firstName, surname, patientID FROM patients WHERE county = 'cork' ORDER BY surname, patientID desc
--
/*This query matches a pattern and makes use of the wildcard, it will list all the details from patients where the county has a 'y' somewhere in its name*/
SELECT * FROM patients WHERE county like '%y%';
--
--This query does the oppposite to the one above, it lists details from patients without 'y' in the county
SELECT * FROM patients WHERE county not like '%y%';
--
--This query scans the dataset to determine the average amount paid in the payment table
SELECT AVG(amountPaid) FROM payment;
--
/*This query uses a subquery. The first part/inner of the query is executed, the average amount paid in the payment table in this case, and then the answer from this part is used for the second part/outer query, to list the paymentIDs that are associated with amountPaids greater than the average*/
SELECT paymentID from payment where amountPaid > (SELECT AVG(amountPaid) FROM payment);
--
/*This query outputs information on patients with the surname MURPHY from two separate tables with a link on the fields that are in common*/
SELECT firstName, surname, sentStatus, referralID
FROM patients, referrals
WHERE surname = 'MURPHY' 
AND patients.patientID = referrals.patientID;
--
/*This query uses a subquery and lists the firstname and surname of patients with the same county as those with the surname Green*/
SELECT firstName, surname from patients WHERE county IN (SELECT county from patients WHERE surname = 'GREEN');
--
--This statement creates a temporary name to make the returned information more readable
SELECT firstName AS 'First Name' FROM patients;
--
--This statement combines columns, to return first name and surname as one in this case (with a space in the middle)
SELECT CONCAT (firstName, ' ', surname) AS 'Name' FROM patients;
--
--This statement puts data in the selected column into the lowercase
SELECT LCASE(firstName) FROM patients;
--
/*This statement uses a left join on two tables, patients and appointments, to bring back the first name and appointment dateTime for patients. If a patient does not have an appointment a NULL is returned*/
SELECT patients.firstName, appointments.aptDateTime 
FROM patients 
LEFT JOIN appointments 
ON patients.patientID = appointments.patientID;
--
--This statement uses a right join on two tables, bill and payment, to bring back the billID and amount paid
SELECT bill.billID, payment.amountPaid 
FROM bill 
RIGHT JOIN payment 
ON bill.billID = payment.billID;
--
--INSERT statements
--
/*This statement inserts the details for a new specialist into the specialist table, the statement must conform with the data already there*/
INSERT INTO specialist (specialistID,firstName,surname,address1,address2,county,postcode) 
                        VALUES (20,'NOAH','KING','SWEET DENTAL','9 WEST STREET','CORK',8922);
--
--UPDATE statements
/*This statement allows data in a row to be changed without changing all the values in the row, in this case the postcode is updated where the specialistID is 15*/
UPDATE specialist SET postcode = 6752 WHERE specialistID = 15;
--
--This statement updates the lineitem table to increase the cost of all procedures for 5 euro
UPDATE lineitem SET cost = cost+5;
--
--This statement assigns a received value to every reportReceived that was previously null
UPDATE referrals SET reportReceived = 'received' WHERE reportReceived = 'null';
--
--This statement changes the data type of county
ALTER TABLE patients MODIFY COLUMN county char(12);
--
--This statement adds a columnn to the table specialist
ALTER TABLE specialist ADD speciality char(10);
--
--DELETE statements
--
/*This statement allows the row with specialistID 20 to be deleted from specialist(assuming there are no foreign key constraints). A message asking if a delete is really required will come updated*/
DELETE FROM specialist WHERE specialistID = 20;
--
--This statement allows a column to be deleted, the system checks if you really want to perform this action before performing it
ALTER TABLE patients DROP column county;
