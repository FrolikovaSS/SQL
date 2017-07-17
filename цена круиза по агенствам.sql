

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
  Where  BO.AgencyID is not NULL and BO.StatusID >=60 and BO.Created > '2017-01-01'

 Group by BO.AgencyID, A.Name, CO.Name, CO.Currency
 Order by BO.AgencyID DESC, Summa DESC



