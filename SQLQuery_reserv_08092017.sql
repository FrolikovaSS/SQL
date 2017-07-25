USE [u183189]
GO

SELECT
    
    CONCAT(P.LName, ' ' ,P.FName) AS Manager
	  , CAST(BO.CRMID AS int) as CRMID
      ,[Category]
	
      ,[Cabin]
	  , BC.BookingID
	  ,BP.Position,
	   BP.LName, BP.FName
	  ,BP.Sex
	  ,BP.BDate
	  ,BP.Nationality
	  ,EDate
	  ,PID
	 	
	  ,BO.Phone
	  ,StatusID
	  
  FROM [dbo].[BCruises] AS BC 
 Left JOIN BOrders AS BO ON BC.BOrderID = BO.BOrderID
 Left JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
 LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
 WHERE ( StatusID = 100 or StatusID = 60) and CRMID is not NULL and OfferID= 64713 AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL) 
 
  ORDER BY CRMID, BO.BOrderID,  Position
 
GO


