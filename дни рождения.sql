USE [u183189]
GO

SELECT-- [BPersonID]
    
      BP.FName
      ,BP.LName
	  ,P.FName
	  ,P.LName
	 
	
		,BO.Email
      ,[BDate]
   
	--  ,CAST(DAY(GETDATE()) AS nchar) + CAST(MONTH(GETDATE()) AS nchar) as DDate 
  FROM [dbo].[BPersons] As BP
  LEFT JOIN BOrders AS BO ON BO.BOrderID = BP.BOrderID
  LEFT JOIN Profiles as P ON BO.Phone = P.Phone
  WHERE CAST(DAY(BDate) AS nchar) =  CAST(DAY(GETDATE()) AS nchar)+1 
  AND  CAST(MONTH(BDate) AS nchar) = CAST(MONTH(GETDATE()) AS nchar)
  AND BO.AgencyID is NULL AND BO.StatusID >=100
  Order by Email
GO


