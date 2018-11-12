USE [u183189]
GO

SELECT BO.CRMID
	  ,[BookingID]
	 
	
      ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
	
	
		,B.Summa
		,B.ncf
		,B.pax
		,BC.CompanyID
	  ,CONVERT(nchar(10),[Date],104) as Date
	  
	  , BO.StatusID
	  

	    
  FROM [dbo].[BCruises] AS BC 
 JOIN BOrders AS BO ON BC.BOrderID = BO.BOrderID
  LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 


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
 
  WHERE BO.AgencyID='9d5a5c27-a6f0-4022-a772-846da5b8f250' and BO.StatusID >= 100
  ORDER BY StatusID, Date


