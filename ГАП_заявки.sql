USE [u183189]
GO

SELECT COUNT(BOrderID) as Orders, AgencyID
   
  FROM [dbo].[BOrders] WHERE AgencyID IN (
  SELECT AG.AgencyID
     
  FROM [dbo].[Agents] as A
 -- LEFT OUTER JOIN Profiles AS P ON A.ManagerID=P.UserID 
  Left JOIN Agencies AS AG ON AG.AgentID = A.AgentID
  Where AWPath is not NULL)
  Group by AgencyID
  Order by Orders DESC
GO


