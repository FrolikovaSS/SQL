USE [u183189]
GO

SELECT Ag.NAME
	,BO.CRMID
	,CONCAT (PR.LName,' ',PR.FName) AS Manager
	--,BC.Date
	,BO.StatusID AS Active
	,B.Summa
	,(B.Summa - CAST(FLOOR((B.Summa - B.ncf)*BC.Commission/100)as INT) +( DSC.ComPart)) as Netto
	,DSC.ComPart
	,P.Paid
	--,CAST(P.RUB AS INT) AS Rub
	,CAST((BP.EDate - 1) AS DATE) AS PaymentDate

FROM [dbo].[BOrders] AS BO
LEFT OUTER JOIN Profiles AS PR ON BO.ManagerID = PR.UserID
JOIN Agencies AS A ON BO.AgencyID = A.AgencyID
JOIN Agents AS Ag ON Ag.AgentID = A.AgentID
JOIN (
	SELECT [BOrderID]
		,SUM(BPI.Amount) AS Paid
		--,SUM(BPI.Amount * BPI.Rate) AS RUB
		,COUNT(BP.Pos) AS MaxPay
	FROM [dbo].[BPayments] AS BP
	JOIN BPaymentItems AS BPI ON BP.BPaymentID = BPI.BPaymentID
	WHERE BP.Status = 200
	GROUP BY BOrderID
	) AS P ON BO.BOrderID = P.BOrderID
LEFT JOIN BCruises BC ON BC.BOrderID = BO.BOrderID
JOIN (
	SELECT SUM(BCP.p) AS Summa
			,SUM (BCP.ncf) AS ncf
		,COUNT(BCP.p) AS pax
		,BCruiseID
	FROM BCruisePersons BCP
	GROUP BY BCruiseID
	) AS B ON BC.BCruiseID = B.BCruiseID

JOIN (
	SELECT [BOrderID]
		--,SUM(BIP.p) AS Services
		,SUM(BIP.ncf) AS ComPart
	FROM [dbo].[BItems] AS BI
	JOIN BItemPersons AS BIP ON BIP.BItemID = BI.BItemID
	GROUP BY BOrderID
	) AS DSC ON DSC.BOrderID = BO.BOrderID
JOIN BPayments AS BP ON BP.BOrderID = BO.BOrderID

WHERE BO.StatusID >= 100
	AND (B.Summa - CAST(FLOOR((B.Summa - B.ncf)*BC.Commission/100)as INT) + DSC.ComPart) = P.Paid
	AND BO.AgencyID IS NOT NULL 
	AND BO.AgencyID NOT IN ('4d318ee4-d8a2-4806-860c-d21dd8733e56','aa1f5f88-95c6-44d1-ab0b-8d43f666e9b3')
	AND BP.Pos = MaxPay
	AND (BP.EDate > '2018-05-01' AND BP.EDate <= '2018-05-24') 
	
ORDER BY BP.EDate
GO