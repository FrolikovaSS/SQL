

SELECT 
		A.Name,
		  SUM(BCP.p) as Summa
		 , CO.Currency ,CO.Name ,  COUNT(BCP.p) AS pax

  FROM [dbo].[BOrders] BO
  Left Join BCruises BC ON BC.BOrderID = BO.BOrderID
 
  Left Join BCruisePersons BCP ON BCP.BCruiseID = BC.BCruiseID
 Left JOIN Companies CO ON CO.CompanyID = BC.CompanyID
 Left JOIN Agencies Ag ON BO.AgencyID = Ag.AgencyID
 JOIN Agents AS A ON Ag.AgentID=A.AgentID
  Where  BO.AgencyID='9d5a5c27-a6f0-4022-a772-846da5b8f250' and BO.StatusID >=100 and BO.Created > '2018-01-01'
  --is not NULL
 Group by BO.AgencyID, A.Name, CO.Name, CO.Currency
 Order by BO.AgencyID DESC, Summa DESC



