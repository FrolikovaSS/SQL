USE [u183189]
GO

SELECT BO.BOrderID
      ,BC.Date
	  ,BC.BookingID
	  
	  ,BC.Cabin
	  ,BO.CRMID
--	  ,BT.Name
      
  FROM [dbo].[BOrders] as BO
  Left JOIN BCruises as BC ON BC.BOrderID = BO.BOrderID
 -- Left JOIN BTasks as BT ON BT.BOrderID = BO.BOrderID
  Where (BC.OfferID = 84663 or BC.OfferID = 84101) and BO.StatusID = 100 --and BT.Name LIKE '%Акаб%'
  Order by BO.CRMID
GO

