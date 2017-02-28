SELECT
	Cast(WERKS as Varchar(4))  as Plant,
	Cast(MATNR as Varchar(20)) as Material,
	Cast(LGORT as Varchar(10))  as sLoc,
	Cast(CHARG as Varchar(20)) as BatchNo,
	--LFGJA as CurrYear,
	--LFMON as CurrPeriod,
	SUM(CLABS) as StkUR,
	SUM(CINSM) as InspStk
FROM  prd.MCHB   where MANDT = 800  AND NOT (CLABS = 0 AND CINSM = 0 )
group by WERKS,MATNR,LGORT,CHARG 
