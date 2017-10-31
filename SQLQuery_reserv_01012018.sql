USE [u183189]
GO

SELECT OfferID, BC.Date,
    
    CONCAT(P.LName, ' ' ,P.FName) AS Manager
	  , CAST(BO.CRMID AS int) as CRMID
      ,[Category]
	
      ,[Cabin]
	  , BC.BookingID
	  ,BP.Position,
	   BP.LName, BP.FName
	  
	 	
	
	  --,StatusID
	  
  FROM [dbo].[BCruises] AS BC 
 Left JOIN BOrders AS BO ON BC.BOrderID = BO.BOrderID
 Left JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
 LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
 WHERE ( StatusID = 100 or StatusID = 60) and CRMID is not NULL and OfferID IN (61923, 81351) AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL) 
 
  ORDER BY OfferID, CRMID, BO.BOrderID,  Position
 
GO



	----


	SELECT BC.Date, BC.OfferID, BO.CRMID, BC.BookingID, BC.Cabin, BC.Category, MQ.LName, pax, MQ.p as price,   CONCAT(P.LName, ' ' , P.FName) AS Manager, BO.StatusID
	FROM (SELECT * FROM (SELECT BCP.BCruiseID, BP.Position, UPPER(BP.LName) AS LName, COUNT(BCP.BPersonID) OVER (PARTITION BY BCP.BCruiseID) AS pax, SUM(BCP.p) OVER (PARTITION BY BCP.BCruiseID) AS p 
	FROM BCruisePersons AS BCP 
		JOIN BPersons AS BP ON BCP.BPersonID=BP.BPersonID) AS Q WHERE Position=1) AS MQ 
		JOIN BCruises AS BC ON MQ.BCruiseID = BC.BCruiseID 
		JOIN BOrders AS BO ON BO.BOrderID=BC.BOrderID 	
		LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
	WHERE ( StatusID = 100 or StatusID = 60) and CRMID is not NULL and OfferID IN (61923, 81351) AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL) 
	ORDER BY OfferID, CRMID, BO.BOrderID