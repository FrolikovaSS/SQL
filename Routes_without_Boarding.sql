USE [u183189]
GO
	 
SELECT DISTINCT R.RouteID FROM [dbo].[Routes] R 
LEFT JOIN RoutePoints RP ON R.RouteID = RP.RouteID
GROUP BY R.RouteID HAVING SUM(CAST(RP.IsBoarding as int)) = 0

GO


