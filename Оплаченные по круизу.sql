GO

SELECT OfferID,
    
    CONCAT(P.LName, ' ' ,P.FName) AS Manager,
	   BO.CRMID 
	   ,PP.Paid
	   ,B.Summa as price
      ,[Category]
	
      ,[Cabin]
	  , BC.BookingID
	  ,BP.Position,
	   BP.LName, BP.FName
	  ,BP.Sex
	  ,CONVERT(nchar(10),BP.BDate,103) as BDate
	  ,BP.Nationality
	  ,CONVERT(nchar(10),EDate,103) as EDate
	  ,PID
	 	
	  ,BO.Phone
	
	  --,StatusID
	  
  FROM [dbo].[BCruises] AS BC 
 Left JOIN BOrders AS BO ON BC.BOrderID = BO.BOrderID
 Left JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
 LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
 LEFT JOIN (
	SELECT [BOrderID]
		,SUM(BPI.Amount) AS Paid
		
	FROM [dbo].[BPayments] AS BP
	JOIN BPaymentItems AS BPI ON BP.BPaymentID = BPI.BPaymentID
	WHERE BP.Status = 200
	GROUP BY BOrderID
	) AS PP ON BO.BOrderID = PP.BOrderID

	JOIN (
	SELECT  
			SUM (BCP.p) as Summa
			,SUM (BCP.ncf) AS ncf
			,COUNT(BCP.p) AS pax
			
		,BCP.BCruiseID
	FROM BCruisePersons BCP
	
	JOIN BCruises as BC ON BC.BCruiseID = BCP.BCruiseID
	GROUP BY BCP.BCruiseID
	) AS B ON BC.BCruiseID = B.BCruiseID

 WHERE ( BO.StatusID = 100 or BO.StatusID = 60) and BO.CRMID is not NULL and OfferID IN (98260) AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL) 
 

  ORDER BY OfferID, CRMID, BO.BOrderID,  Position
 
GO