USE [u183189]
GO

Select  BO.BOrderID,
		BO.StatusID,
		BO.CRMID,
		BC.Category,
		M.pax,
	
		Netto = Case
		When M.pax%2 = 1  Then CAST((CEILING((M.Price - M.ncf)/2*0.9)*2 + M.ncf)- 1 AS INT)
		Else CAST((CEILING((M.Price - M.ncf)/2*0.9)*2 + M.ncf) AS INT) end,
		
		P.Paid,
		Need_to_pay =
		Case
		 When StatusID = 50 and Paid > 0 Then (-Paid)
		 WHEN StatusID = 50 and Paid = 0 Then ('0')
		When M.pax%2 = 1 then (CAST((CEILING((M.Price - M.ncf)/2*0.9)*2 + M.ncf)-1 AS INT) - P.Paid)
		 Else (CAST((CEILING((M.Price - M.ncf)/2*0.9)*2 + M.ncf) AS INT) - P.Paid)
		end
		From BOrders as BO
      
 Left Join BCruises BC ON BC.BOrderID = BO.BOrderID
 JOIN (SELECT 
      [BOrderID]
      ,[Status]
	  ,SUM(BPI.Amount) as Paid
	     
  FROM [dbo].[BPayments] as BP
  JOIN BPaymentItems as BPI ON BP.BPaymentID = BPI.BPaymentID
  Where Status=200
  Group by BOrderID, Status) AS P ON BO.BOrderID = P.BOrderID
 JOIN
(SELECT BO.BOrderID
  
     ,SUM(BCP.ncf) as ncf
	,SUM(BCP.p) as Price
	,COUNT(BCP.p) as pax
    
     
  FROM [dbo].[BOrders] as BO
  Left Join BCruises BC ON BC.BOrderID = BO.BOrderID
 Join BCruisePersons BCP ON BCP.BCruiseID = BC.BCruiseID
  Where CRMID = '10904' or CRMID ='10903' or CRMID = '9217'
 Group by BO.BOrderID) as M ON BO.BOrderID = M.BOrderID
 Order by StatusID, CRMID, BO.Created

GO