USE [u183189]
GO

Select  BO.CRMID,
		BC.Category,
		M.pax,
		M.ncf,
		M.Price as Brutto,
		M.Price - M.ncf as CrT,
		CAST((CEILING((M.Price - M.ncf)/2*0.9)*2 + M.ncf) AS INT) as Netto,
		CAST(M.Price - (CEILING((M.Price - M.ncf)/2*0.9)*2 + M.ncf) AS INT) as Commission
		
		From BOrders as BO
      
 Left Join BCruises BC ON BC.BOrderID = BO.BOrderID
 --Join BCruisePersons BCP ON BCP.BCruiseID = BC.BCruiseID
 JOIN
(SELECT BO.BOrderID
  
     ,SUM(BCP.ncf) as ncf
	,SUM(BCP.p) as Price
	,COUNT(BCP.p) as pax
    
     
  FROM [dbo].[BOrders] as BO
  Left Join BCruises BC ON BC.BOrderID = BO.BOrderID
  --  Left JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
 Join BCruisePersons BCP ON BCP.BCruiseID = BC.BCruiseID
  Where CRMID = '11670' --or CRMID ='12445' or CRMID = '12507'
 Group by BO.BOrderID) as M ON BO.BOrderID = M.BOrderID
 Order by CRMID, BO.Created

GO


