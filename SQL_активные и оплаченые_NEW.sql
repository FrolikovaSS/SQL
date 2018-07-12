USE [u183189]
GO

SELECT 
	BO.CRMID
	,CONCAT (PR.LName,' ',PR.FName) AS Manager
	,BO.StatusID
	,B.Summa As CruiseCost
	,COALESCE(DSC.Services, 0) + B.Summa as FullCost
	
	,P.Paid
	,BT.Name
	,BT.NDate
	 ,DATEDIFF ( dd , GETDATE() , NDate ) as Days	
FROM [dbo].[BOrders] AS BO
LEFT OUTER JOIN Profiles AS PR ON BO.ManagerID = PR.UserID
JOIN (
	SELECT [BOrderID]
		,SUM(BPI.Amount) AS Paid
		
	FROM [dbo].[BPayments] AS BP
	JOIN BPaymentItems AS BPI ON BP.BPaymentID = BPI.BPaymentID
	WHERE BP.Status = 200
	GROUP BY BOrderID
	) AS P ON BO.BOrderID = P.BOrderID

LEFT JOIN BCruises BC ON BC.BOrderID = BO.BOrderID
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

LEFT JOIN (
	SELECT [BOrderID]
		,SUM(BIP.p) AS Services

	FROM [dbo].[BItems] AS BI
	JOIN BItemPersons AS BIP ON BIP.BItemID = BI.BItemID
	GROUP BY BOrderID
	) AS DSC ON DSC.BOrderID = BO.BOrderID
Join BTasks AS BT ON BT.BOrderID = BO.BOrderID

WHERE BO.StatusID = 100
	AND (B.Summa + COALESCE(DSC.Services, 0)) = P.Paid

	AND BT.Status = 100 and BT.Name LIKE '%оплат%' and BT.Owner = 'C'
	ORDER BY CRMID
GO