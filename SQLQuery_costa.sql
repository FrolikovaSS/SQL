USE [u183189]
GO

SELECT BC.Category
	,BO.CRMID
	,BC.Cabin
    ,BP.FName
	,BP.LName
	,BP.Sex
	,BP.BDate
	,DATEDIFF(YEAR,BP.BDate, GETDATE())+
	(SIGN(DATEDIFF(DAY,BP.BDate, DATEADD(YEAR, YEAR(BP.BDate)-YEAR(GETDATE()), GETDATE())))-1)/2 as Age
	,BP.Nationality
	,BP.PID AS Passport
	,BP.Position 
	,BP.EDate
	, CONCAT(P.LName, ' ' ,P.FName) AS Manager
	, P.Phone
	
	      
  FROM [dbo].[BOrders] AS BO
 JOIN BCruises AS BC ON BC.BOrderID = BO.BOrderID
 JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
 LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
  WHERE Date = '2017-05-21' and BO.CRMID is not  NULL and Duration = 11 and BO.StatusID = 100 and BO.OCityID = 1
  Order BY Cabin
 
GO


