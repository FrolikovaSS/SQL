USE [u183189]
GO

SELECT A.AgentID
      --,[ManagerID]
	   ,CONCAT(P.LName, ' ' ,P.FName) AS Manager
      ,A.Name
      ,[StatusID]
--		,A.Phone
  --    ,[Email]
  --    ,[Site]
      ,[AWPath]
      ,[CRMID]
  --    ,[ID]
      ,[EDate]
     
  FROM [dbo].[Agents] as A
  LEFT OUTER JOIN Profiles AS P ON A.ManagerID=P.UserID 
  Where AWPath is not NULL and StatusID <=60
  Order by Manager
GO


