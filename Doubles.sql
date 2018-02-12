USE [u183189]
GO

-- aggregated routes
CREATE TABLE #arp2
(
	RouteID int,	
	Trace2 nvarchar(4000),
	Name nvarchar(128)
)

INSERT #arp2
SELECT RP.RouteID, R.Trace, C.Name FROM dbo.RoutePoints AS RP 
INNER JOIN dbo.Cities AS C ON C.CityID = RP.CityID
Inner JOIN ARoutes as R ON R.RouteID = RP.RouteID
	
	SELECT TOP 5 R.Trace, COUNT(R.RouteID) as Num,
	        STUFF(
   (SELECT distinct ','+ Cast(( RouteID) as varchar)  FROM #arp2 AS RT
                   WHERE R.Trace = RT.Trace2
                   FOR XML PATH('')), 1, 1, '') as Race
			 
		FROM ARoutes AS R 
			
		GROUP BY R.Trace Having COUNT(R.RouteID)> 1

  DROP TABLE #arp2;
GO
