**************  GetxRates *************************

 select	CAST(CR.FCURR as Varchar(3)) as FCurr,
		CAST(CR.TCURR as Varchar(3)) as TCurr, 
		Cast(99999999-CR.GDATU as Varchar(8)) as EffectiveFrom, 
		CR.UKURS, 
		Round(1/CR.UKURS,5,2) as Rate,
		BaseCurrUnit = ( Select  TOP 1 FFACT  
			from	prd.TCURF 
			where	KURST='M' and MANDT=800 
					AND FCURR= CR.FCURR and TCURR= CR.TCURR
			order by 99999999-GDATU desc ),
			
		AltCurrUnit = (	Select  Top 1 TFACT
			from	prd.TCURF 
			where	KURST='M' and MANDT=800 
					AND FCURR= CR.FCURR and TCURR= CR.TCURR
			order by 99999999-GDATU desc )

from prd.TCURR CR 
where	CR.KURST='M' -- AND RP.KURST='M' 
		and CR.MANDT= 800
		and 99999999-CR.GDATU >= 20140101 