USE [u183189]
GO

SELECT
    distinct BO.BOrderID,
    CONCAT(P.LName, ' ' ,P.FName) AS Manager
	  , CAST(BO.CRMID AS int) as CRMID
	--  ,BP.Position,
	 --  BP.LName, BP.FName
	 ,BP.PID 
	  --,StatusID
	  
  FROM [dbo].[BCruises] AS BC 
 Left JOIN BOrders AS BO ON BC.BOrderID = BO.BOrderID
 Left JOIN BPersons AS BP ON BO.BOrderID = BP.BOrderID
 LEFT OUTER JOIN Profiles AS P ON BO.ManagerID=P.UserID 
 WHERE ( StatusID = 100) and  (BO.AgencyID<>'150aec84-7a0f-49b1-97e0-ff805e5a2201' OR BO.AgencyID IS NULL) and (BP.PID LIKE '%0000%' or BP.PID LIKE '%1111%' or  BP.PID LIKE '%XXX%')
 
  ORDER BY Manager, BO.BOrderID -- Position
 
GO


