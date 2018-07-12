USE [u183189]
GO

SELECT BO.BOrderID
      ,[StatusID]    
      ,[CRMID]  
	  ,BC.ShipID
      ,BO.Created
--	  ,P.Paid
    
  FROM [dbo].[BOrders] AS BO
	JOIN ( SELECT 
      [BOrderID]    
	-- ,SUM(BPI.Amount) as Paid
	     
  FROM [dbo].[BPayments] as BP
JOIN BPaymentItems as BPI ON BP.BPaymentID = BPI.BPaymentID
  Where Status=200
  Group by BOrderID
	) AS P ON BO.BOrderID = P.BOrderID
	LEFT JOIN BCruises AS BC ON BC.BOrderID = BO.BOrderID
	
  WHERE (BO.Created >= '2018-05-16' and BO.Created <= '2018-06-06') 
  AND (BC.Date >= '2018-05-19' and BC.Date <= '2018-08-25')
  AND BC.ShipID = 7
  AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL) 
  AND BO.StatusID >=60
  Order by BO.Created
GO


---

SELECT  BO.CRMID,  P.Paid, pax,  BC.ShipID, BO.StatusID, BO.Created, BC.Date
	FROM (SELECT * FROM (SELECT BCP.BCruiseID, BP.Position, UPPER(BP.LName) AS LName, COUNT(BCP.BPersonID) OVER (PARTITION BY BCP.BCruiseID) AS pax, SUM(BCP.p) OVER (PARTITION BY BCP.BCruiseID) AS p 
	FROM BCruisePersons AS BCP 
		JOIN BPersons AS BP ON BCP.BPersonID=BP.BPersonID) AS Q WHERE Position=1) AS MQ 
		JOIN BCruises AS BC ON MQ.BCruiseID = BC.BCruiseID 
		JOIN BOrders AS BO ON BO.BOrderID=BC.BOrderID 	
	JOIN (
	SELECT [BOrderID]
		,SUM(BPI.Amount) AS Paid
	
	FROM [dbo].[BPayments] AS BP
	JOIN BPaymentItems AS BPI ON BP.BPaymentID = BPI.BPaymentID
	WHERE BP.Status = 200
	GROUP BY BOrderID
	) AS P ON BO.BOrderID = P.BOrderID 
	
	WHERE ( StatusID = 100 or StatusID = 60)  and ShipID IN (7) AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL) 
	 AND (BO.Created >= '2018-05-16' and BO.Created <= '2018-06-06') 
  AND (BC.Date >= '2018-05-19' and BC.Date <= '2018-08-25')
	ORDER BY  BO.Created