USE [u183189]
GO

WITH Selection AS(

SELECT 

 RouteId,

STUFF(

	(SELECT ', ' + CAST(CityID as VARCHAR) 

    FROM RoutePoints 

    WHERE (RouteID = Results.RouteID) 

    FOR XML PATH(''),TYPE).

    value('(./text())[1]', 'VARCHAR(MAX)'),

    1, 2, '') AS Points

FROM RoutePoints Results

GROUP BY RouteID    
) 
Select distinct CONCAT(Q.R1,' vs ' ,Q.R2), Q.Points From
(SELECT 
Case when S.RouteID > Selection.RouteID then Selection.RouteID else S.RouteID end as R1, Case when S.RouteID < Selection.RouteID then Selection.RouteID else S.RouteID end as R2, S.Points
FROM Selection
JOIN Selection S ON S.Points = Selection.Points and S.RouteID<>Selection.RouteID) as Q
--Group by S.Points

Order by Q.Points
GO


