USE [u183189]
GO

SELECT
    BC.OfferID,
  
	 -- CAST(BO.CRMID AS int) as CRMID,
	     BC.BookingID
      ,[Category]	
      ,[Cabin]		 
	  , BP.LName, BP.FName
	  ,BP.Type
	  ,BP.BDate
	  ,BI.Type
	,BI.Name
	 	,BO.LName
		,BO.FName
	
	  ,BO.Phone
	  ,  CONCAT(P.LName, ' ' ,P.FName) AS Manager
	
	  
  FROM [dbo].[BCruises] AS BC 
 Left JOIN BOrders AS BO ON BC.BOrderID = BO.BOrderID
 Left JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
 LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
  JOIN BItems AS BI ON BI.BOrderID = BO.BOrderID
 WHERE ( StatusID = 100 or StatusID = 60) and CRMID is not NULL and OfferID= 64713 AND (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL) and BI.Type = 'EXC'
 
  ORDER BY CRMID, BO.BOrderID
 
GO


