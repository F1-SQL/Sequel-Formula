UPDATE cir

 SET cir.countryID = c.countryID 

FROM [dbo].[circuits] cir

INNER JOIN [dbo].[countries] c ON cir.[country] = c.[country]

GO

UPDATE cir

 SET cir.locationID = l.locationID 

FROM [dbo].[circuits] cir

INNER JOIN [dbo].[locations] l ON cir.[location] = l.[locationName]