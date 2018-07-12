USE [u183189]
GO

SELECT TOP 5 [BPersonID]
      ,[BOrderID]
      ,[Position]
      ,[FName]
      ,[LName]
 
      ,[BDate]
      ,[EDate]
      ,[Nationality]
      ,[Sex]
      ,[Type]
      ,[PGuest]
	  ,CAST(DAY(GETDATE()) AS nchar) + CAST(MONTH(GETDATE()) AS nchar) as DDate 
  FROM [dbo].[BPersons] 
  WHERE CAST(DAY(BDate) AS nchar) =  CAST(DAY(GETDATE()) AS nchar) 
  AND  CAST(MONTH(BDate) AS nchar) = CAST(MONTH(GETDATE()) AS nchar) 
GO


