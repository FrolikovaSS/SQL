USE [u183189]
GO

SELECT StatusID
      --,[ManagerID]
	   ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
      ,A.Name
  --    ,[StatusID]
--		,A.Phone
     ,AG.Email
  --    ,[Site]
  --    ,[AWPath]
      ,[CRMID]
  --    ,[ID]
      ,[EDate]
     
  FROM [dbo].[Agents] as A
  LEFT OUTER JOIN Profiles AS P ON A.ManagerID=P.UserID 
  Left JOIN Agencies AS AG ON AG.AgentID = A.AgentID
  Where AWPath is not NULL and StatusID <= 60


  Order by CRMID
GO


