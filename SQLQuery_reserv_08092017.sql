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
 WHERE ( StatusID = 100 or StatusID = 60) and CRMID is not NULL and OfferID= 64713 and (BO.LName <> 'ÿ¿Ã¿–ƒ»Õ¿' and BO.LName <> '—À¿¬ﬂÕ— ¿ﬂ' )
 
  ORDER BY CRMID, BO.BOrderID,  Position
 
GO


