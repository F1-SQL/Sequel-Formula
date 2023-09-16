UPDATE r 

 SET r.positionTextID = pt.positionTextID 

FROM [dbo].[results] r

INNER JOIN [dbo].[positionText] pt ON r.[positionText] = pt.[positioncode]

GO

;WITH LeadingResults AS
(
	SELECT 

	raceID,
	positionOrder,
	dateadd(ms, milliseconds, '19800101') as LeadTime

	FROM 
		[dbo].[results]	
	WHERE 
		positionOrder = 1
),
DataOutput AS 
(
	SELECT 
		resultID,
		r.raceID,
		r.positionOrder,
		milliseconds,
		time,
		dateadd(ms, r.milliseconds, '19800101') - CASE 
													WHEN r.positionOrder = 1 THEN LAG(dateadd(ms, r.milliseconds, '19800101')) OVER( ORDER BY r.raceID,r.positionOrder) 
													WHEN r.positionOrder != 1 THEN lr.LeadTime 
												END AS Diff
	FROM							
		[dbo].[results]	r
		
		INNER JOIN LeadingResults lr 
			ON r.raceId = lr.raceId
)

UPDATE r
	SET 
		r.TimeDifference = do.Diff
	FROM 
		[dbo].[results] r

		INNER JOIN DataOutput DO 
			ON r.resultId = do.resultId

GO

UPDATE [dbo].[results]
	SET
		fastestLapTime_converted = TRY_CONVERT(time, STUFF(STUFF(RIGHT(CONCAT('000000', REPLACE(fastestLapTime, ':', '')), 10), 5, 0, ':'), 3, 0, ':')) 

/*sprintResults*/

;WITH LeadingResults AS
(
SELECT 

raceID,
positionOrder,
dateadd(ms, milliseconds, '19800101') as LeadTime

FROM 
	[dbo].[sprintResults]	
WHERE 
	positionOrder = 1
),
DataOutput AS 
(
SELECT 
	resultID,
	r.raceID,
	r.positionOrder,
	milliseconds,
	time,
	dateadd(ms, r.milliseconds, '19800101') - CASE 
												WHEN r.positionOrder = 1 THEN LAG(dateadd(ms, r.milliseconds, '19800101')) OVER( ORDER BY r.raceID,r.positionOrder) 
												WHEN r.positionOrder != 1 THEN lr.LeadTime 
											END AS Diff
FROM							
	[dbo].[sprintResults]	r
	
	INNER JOIN LeadingResults lr 
		ON r.raceId = lr.raceId
)

UPDATE r
	SET 
		r.TimeDifference = do.Diff

	FROM 
		[dbo].[sprintResults] r

		INNER JOIN DataOutput DO ON r.resultId = do.resultId

GO

UPDATE [dbo].[results]
	SET
		fastestLapTime_converted = TRY_CONVERT(time, STUFF(STUFF(RIGHT(CONCAT('000000', REPLACE(fastestLapTime, ':', '')), 10), 5, 0, ':'), 3, 0, ':')) 

GO

UPDATE [dbo].[results]
	SET 
		fastestLapSpeed_Decimal = TRY_CONVERT(decimal(18,3),fastestLapSpeed);

GO

UPDATE [dbo].[results] 
	SET 
		time_converted = TRY_CONVERT(time(3),[time]) WHERE position = 1;

GO

UPDATE [dbo].[results] 
	SET 
		time_converted = TRY_CONVERT(time(3),[time]) WHERE position != 1;