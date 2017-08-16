USE [u183189]
GO

SELECT BO.BOrderID
      ,[CRMID]
	  ,BC.Category
	  ,BC.Cabin
	  ,BC.BookingID
	  ,BP.Position
	  ,BP.FName
	  ,BP.LName
	  ,BP.BDate
     
  FROM [dbo].[BOrders] AS BO
   Left JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
   Left JOIN BCruises AS BC ON BC.BOrderID = BO.BOrderID
   WHERE BO.StatusID = 100 and CRMID IN ('8412', '12117','12077','12092', '12071', '12046', '11945', '11960', '11934', '12679', '12620', '11962')
   Order by CRMID, BO.BOrderID,  BP.Position
GO


