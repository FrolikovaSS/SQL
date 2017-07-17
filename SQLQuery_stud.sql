



SELECT BO.BOrderID, BO.FName, BO.LName, BO.Created, CONCAT(P.LName, ' ' ,P.FName) AS Manager, BO.CRMID, C.Name 
	FROM BOrders AS BO 
		JOIN BCruises AS BC ON BO.BOrderID=BC.BOrderID 
		JOIN Companies AS C ON BC.CompanyID=C.CompanyID 
		LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
	WHERE BO.Created >= '2016-05-01' AND BO.StatusID >= 100 AND 
(BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL) ORDER BY BO.Created

SELECT C.Name, COALESCE(Amount,0) FROM Companies AS C LEFT OUTER JOIN (SELECT BC.CompanyID, COUNT(BO.BOrderID) AS Amount
	FROM BOrders AS BO
		JOIN BCruises AS BC ON BO.BOrderID=BC.BOrderID
	WHERE BO.Created >= '2016-05-01' AND BO.StatusID >= 100 AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL)
GROUP BY BC.CompanyID) AS Q ON C.CompanyID=Q.CompanyID
WHERE C.IsLocked=0
ORDER BY Amount DESC
		
SELECT TOP 5 * FROM BCruises

SELECT BC.CompanyID, COUNT(BC.BOrderID) AS Amount
	FROM BOrders AS BO
		JOIN BCruises AS BC ON BO.BOrderID=BC.BOrderID
	WHERE BO.Created >= '2016-05-01' AND BO.StatusID >= 100 AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL)
GROUP BY BC.CompanyID
ORDER BY Amount DESC

SELECT TOP 5 * FROM BOrders




SELECT * FROM Agencies WHERE AgencyID='150aec84-7a0f-49b1-97e0-ff805e5a2201'

SELECT BT.BOrderID, COUNT(BT.BOrderID) AS Amount FROM BTasks AS BT GROUP BY BT.BOrderID HAVING COUNT(BT.BOrderID) <=3

SELECT BO.BOrderID, BO.FName, BO.LName, BO.Created, COUNT(BT.BOrderID) FROM BOrders AS BO INNER JOIN BTasks AS BT ON BO.BOrderID=BT.BTaskID GROUP BY BT.BOrderID 

SELECT BO.BOrderID, BO.FName, BO.LName, BO.Created, P.LName AS Manager FROM BOrders AS BO LEFT JOIN BTasks AS BT ON BO.BOrderID = BT.BOrderID LEFT JOIN Profiles AS P ON BO.ManagerID=P.UserID WHERE BT.BTaskID IS NULL AND BO.StatusID = 100 AND P.LName='Балясникова' ORDER BY BO.Created

SELECT TOP 5 * FROM BCruisePersons WHERE BCruiseID='E318C353-E0A9-45E5-9A2F-355FA233B5C7'

SELECT * FROM BOrders WHERE BOrderID='64fa04e1-952d-4f78-a336-ac8c59915668'

SELECT TOP 5 * FROM BCruisePersons

SELECT Q.BookingID, BP.LName, Q.pax, BC.Date, BCP.p, BC.Duration, Bo.Created 
	FROM BCruises AS BC 
		JOIN (SELECT BC.BookingID, COUNT(BP.BPersonID) AS pax
			FROM BPersons AS BP 
				LEFT OUTER JOIN BCruises AS BC ON BP.BOrderID=BC.BOrderID 
			GROUP BY BC.BookingID) AS Q ON Q.BookingID=BC.BookingID 
				JOIN BOrders AS BO ON BO.BOrderID=BC.BOrderID
				JOIN BPersons AS BP ON BP.BOrderID=BC.BOrderID
				JOIN BCruisePersons AS BCP ON BCP.BCruiseID=BC.BCruiseID
	WHERE BC.CompanyID=2 AND BO.Created>='2015-12-05' AND BO.Created<='2016-08-04' AND BO.StatusID>=100
	ORDER BY BO.Created

--статистика
SELECT BC.BookingID, MQ.LName, pax, MQ.p as price, BC.Date, BC.Duration, BO.Created, C.Name
	FROM (SELECT * FROM (SELECT BCP.BCruiseID, BP.Position, UPPER(BP.LName) AS LName, COUNT(BCP.BPersonID) OVER (PARTITION BY BCP.BCruiseID) AS pax, SUM(BCP.p) OVER (PARTITION BY BCP.BCruiseID) AS p 
	FROM BCruisePersons AS BCP 
		JOIN BPersons AS BP ON BCP.BPersonID=BP.BPersonID) AS Q WHERE Position=1) AS MQ 
		JOIN BCruises AS BC ON MQ.BCruiseID = BC.BCruiseID 
		JOIN BOrders AS BO ON BO.BOrderID=BC.BOrderID 
		JOIN Companies AS C ON BC.CompanyID=C.CompanyID
	WHERE ((BO.AgencyID IS NULL) OR BO.AgencyID <> '150AEC84-7A0F-49B1-97E0-FF805E5A2201') AND Created >='2016-07-01'  AND BO.StatusID >= 100 AND BC.BookingID IS NOT NULL
	ORDER BY   C.Name, Created ASC

SELECT TOP 5 * FROM Companies

SELECT * FROM Profiles WHERE LName='Шамардина' 

SELECT * FROM Profiles WHERE LName='Ерёменко'

UPDATE Profiles SET PhotoPath='1993-12-12' WHERE UserID='05E43D4B-3BFF-46B7-93F0-C8A3788929E3'

SELECT * FROM Offers WHERE OfferID=58728

SELECT TOP 5 * FROM RSessions WHERE SessionID=6540

SELECT * FROM Offers WHERE SessionID=6540 

SELECT TOP 5 * FROM Agents WHERE Name LIKE '%ПИЛИГРИМ%'

SELECT TOP 5 * FROM Agencies WHERE AgentID='334D07D8-67BC-412B-916F-7C56DDA48D92'

SELECT TOP 5 * FROM BOrders ORDER BY Created DESC

SELECT * FROM BCruises WHERE OfferID='64703'

SELECT TOP 5 * FROM BPaymentItems WHERE Currency='RUR'
SELECT TOP 5 * FROM BCruisePersons
SELECT TOP 5 * FROM BCruises WHERE BCruiseID='57AE7641-D6D1-49C4-88A6-0010343C69FD'

--costa 
	SELECT BC.BOrderID, BO.CRMID, BC.Category, BO.FName, BO.LName, CONCAT(P.LName, ' ' ,P.FName) AS Manager, AM.Payed, BO.Created
	FROM BCruises AS BC
		LEFT OUTER JOIN (SELECT BP.BOrderID, SUM(BPI.Amount) AS Payed FROM BPayments AS BP
		LEFT OUTER JOIN BPaymentItems AS BPI ON BPI.BPaymentID=BP.BPaymentID WHERE BP.Status >=100
			GROUP BY BP.BOrderID) AS AM ON AM.BOrderID=BC.BOrderID
	JOIN BOrders AS BO ON BO.BOrderID=BC.BOrderID
	JOIN Profiles AS P ON BO.ManagerID=P.UserID 
	WHERE BC.OfferID='60473' AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL) AND BO.StatusID >= 100
	ORDER BY Manager

SELECT * FROM BOrders WHERE BOrderID='ed8dabe2-f453-421e-9374-6c4c5c3cfa5a' OR BOrderID='A82156A0-EE00-426A-BAE7-B81CABB01AFA'

SELECT BP.BOrderID, SUM(BPI.Amount) FROM BPayments AS BP
	JOIN BPaymentItems AS BPI ON BPI.BPaymentID=BP.BPaymentID
		--WHERE BORderID='C9E97900-808B-4E63-968C-5621F37D862B'
	GROUP BY BP.BOrderID

SELECT TOP 5 * FROM BPaymentItems


	


SELECT BPI.BPItemID, SUM(BPI.Amount) FROM BPaymentItems AS BPI
	GROUP BY BPI.BPItemID
	
SELECT BP.BOrderID, BP.BPaymentID, SUM(BPI.Amount) AS Total_amount FROM BPaymentItems AS BPI 
	JOIN BPayments AS BP ON BPI.BPaymentID=BP.BPaymentID

SELECT TOP 5 * FROM Companies

SELECT BO.Email, BO.FName, BO.LName, C.Name, AM.Payed, BO.Created FROM BCruises AS BC
 JOIN BOrders AS BO ON BC.BOrderID=BO.BOrderID
 JOIN Companies AS C ON C.CompanyID=BC.CompanyID
 LEFT OUTER JOIN (SELECT BP.BOrderID, SUM(BPI.Amount * BPI.Rate) AS Payed FROM BPayments AS BP
		LEFT OUTER JOIN BPaymentItems AS BPI ON BPI.BPaymentID=BP.BPaymentID WHERE BP.Status >=100
			GROUP BY BP.BOrderID) AS AM ON AM.BOrderID=BC.BOrderID
   WHERE BO.Created >='2016-06-01' AND BO.AgencyID IS NULL AND BO.StatusID >=100
   ORDER BY BO.Created

SELECT TOP 5 * FROM Agents
SELECT TOP 5 * FROM BOrders WHERE AgencyID IS NOT NULL

--SELECT * FROM Agents AS A
--		JOIN BOrders AS BO ON BO.AgencyID=A.AgentID


		
SELECT COUNT(BO.BOrderID) AS amount FROM BOrders AS BO 
JOIN Agencies AS A ON A.AgencyID=BO.AgencyID
WHERE BO.StatusID >=100 AND BO.Created >='2016-01-01' AND (BO.AgencyID IS NOT NULL) 





--(BO.AgencyID<>'9135BCD2-9B40-4BD8-8244-5F97D4CF130F' OR BO.AgencyID IS NULL)

SELECT TOP 5 * FROM Agencies

SELECT TOP 5 * FROM Offers WHERE ShipId='211' AND Date='2017-06-24'

SELECT BCP.BCruiseID, SUM(p) AS Amount, COUNT(p) AS pax FROM BCruisePersons AS BCP
GROUP BY BCruiseID

SELECT BC.BOrderID, BC.Category, BO.FName, BO.LName, QW.Amount, QW.pax  FROM BCruises AS BC
JOIN BOrders AS BO ON BO.BOrderID=BC.BOrderID
JOIN (SELECT BCP.BCruiseID, SUM(p) AS Amount, COUNT(p) AS pax FROM BCruisePersons AS BCP
		GROUP BY BCruiseID) AS QW ON QW.BCruiseID=BC.BCruiseID
WHERE BC.OfferID='60473' AND BO.StatusID>='100' 
AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL)
AND QW.pax='2' AND BC.Category='B2'

SELECT TOP 5 * FROm BCruises WHERE BCruiseID='A3C2C4A0-27F9-4BBD-B09E-000700DCB8DF'

