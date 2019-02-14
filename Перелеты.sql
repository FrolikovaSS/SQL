SELECT AO.Date, *  FROM OPrices as OP
LEFT JOIN AOffers as AO ON AO.OfferID = OP.OfferID WHERE OP.OfferID IN (
SELECT OfferID From AOffers WHERE CompanyID = 2 and ShipID = 345 and Duration = 7 and Trace LIKE 'Савона%' and (Date>='2019-04-27' and Date<= '2019-09-28')
) and CabinCode IN ('IV','EV','BV','IC','EC','BC','IP','EP','BP') --and OP.op <> -1

Order by AO.Date, OPriceID