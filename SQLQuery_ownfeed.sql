
use u183189;

-- MSK
GO

CREATE TABLE #op
(
	OfferID int,
	Date date,
	CabinCode nvarchar(50),
	[dbl_2] int,
	[1_0] int,
	[2_1] int,
	[2_2] int,
	[3_0] int,
	[4_0] int,
	[group] tinyint
)

DECLARE @group tinyint;

SET @group = 1;

-- MSC (62586)

INSERT #op SELECT * FROM
	(
	SELECT OP.OfferID, Date, CabinCode, dbo.Min(op, sp) AS "dbl_2", dbo.Min(op2, sp2) AS '1_0', dbo.Min(op4, sp4) AS '2_1', dbo.Min(op5, sp5) AS '2_2', dbo.Min(op3, sp3) AS '3_0', dbo.Min(op6, sp6) AS '4_0', @group AS [group] FROM OPrices AS OP INNER JOIN Offers AS O ON O.OfferID=OP.OfferID WHERE (OP.OfferID = 62586) AND op > 0 
		UNION
	SELECT OP.OfferID, Date, CabinCode, dbo.Max(op, sp) AS "dbl_2", dbo.Max(op2, sp2) AS '1_0', dbo.Max(op4, sp4) AS '2_1', dbo.Max(op5, sp5) AS '2_2', dbo.Max(op3, sp3) AS '3_0', dbo.Max(op6, sp6) AS '4_0', @group AS [group] FROM OPrices AS OP INNER JOIN Offers AS O ON O.OfferID=OP.OfferID WHERE (OP.OfferID = 62586) AND op > 0
	) AS T;

SET @group = @group + 1;

-- ÑOS (64025)

INSERT #op SELECT * FROM
	(
	SELECT OP.OfferID, Date, CabinCode, dbo.Min(op, sp) AS "dbl_2", dbo.Min(op2, sp2) AS '1_0', dbo.Min(op4, sp4) AS '2_1', dbo.Min(op5, sp5) AS '2_2', dbo.Min(op3, sp3) AS '3_0', dbo.Min(op6, sp6) AS '4_0', @group AS [group] FROM OPrices AS OP INNER JOIN Offers AS O ON O.OfferID=OP.OfferID WHERE (OP.OfferID = 64025) AND op > 0 
		UNION
	SELECT OP.OfferID, Date, CabinCode, dbo.Max(op, sp) AS "dbl_2", dbo.Max(op2, sp2) AS '1_0', dbo.Max(op4, sp4) AS '2_1', dbo.Max(op5, sp5) AS '2_2', dbo.Max(op3, sp3) AS '3_0', dbo.Max(op6, sp6) AS '4_0', @group AS [group] FROM OPrices AS OP INNER JOIN Offers AS O ON O.OfferID=OP.OfferID WHERE (OP.OfferID = 64025) AND op > 0
	) AS T;


SET @group = @group + 1;
-- ÑOS (64697)

INSERT #op SELECT * FROM
	(
	SELECT OP.OfferID, Date, CabinCode, dbo.Min(op, sp) AS "dbl_2", dbo.Min(op2, sp2) AS '1_0', dbo.Min(op4, sp4) AS '2_1', dbo.Min(op5, sp5) AS '2_2', dbo.Min(op3, sp3) AS '3_0', dbo.Min(op6, sp6) AS '4_0', @group AS [group] FROM OPrices AS OP INNER JOIN Offers AS O ON O.OfferID=OP.OfferID WHERE (OP.OfferID = 64697) AND op > 0 
		UNION
	SELECT OP.OfferID, Date, CabinCode, dbo.Max(op, sp) AS "dbl_2", dbo.Max(op2, sp2) AS '1_0', dbo.Max(op4, sp4) AS '2_1', dbo.Max(op5, sp5) AS '2_2', dbo.Max(op3, sp3) AS '3_0', dbo.Max(op6, sp6) AS '4_0', @group AS [group] FROM OPrices AS OP INNER JOIN Offers AS O ON O.OfferID=OP.OfferID WHERE (OP.OfferID = 64697) AND op > 0
	) AS T;


SELECT  * FROM #op ORDER BY [group], OfferID, dbl_2

SELECT  * FROM #op ORDER BY  CabinCode

DROP TABLE #op;

GO


SELECT TOP 5 * FROM COrders