
***** GetSAPBatches **************


SELECT
	CAST(MATNR as Varchar(20)) as Material,
	CAST(CHARG  as Varchar(10)) as BatchNo,
	LAEDA as LastChngDt,
	CASE WHEN VFDAT = '00000000' THEN NULL ELSE VFDAT End as ExpiryDate,
	CASE WHEN VFDAT = '00000000' THEN NULL ELSE substring(VFDAT,1,4) + '/' + substring(VFDAT,5,2)+'/'+ Substring(VFDAT,7,2) END as UBDDate ,
	Cast(LICHA as Varchar(20)) as VendorBatch
FROM prd.MCH1
WHERE MANDT = 800
  AND DateDiff ("dd", CASE WHEN LAEDA = '00000000' THEN '1900/01/01' ELSE substring(LAEDA,1,4) + '/' + substring(LAEDA,5,2)+'/'+ Substring(LAEDA,7,2) END, GetDate()) <= 999999	
