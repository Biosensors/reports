****************** GETCostCenters ******************

 
Select 
	DISTINCT Cast(C.KOKRS as Varchar(4)) as CtrlArea, Cast(C.KOSTL as Varchar(10))  as CostCenter,
	Cast(T.LTEXT as nVarchar(40)) as CCDescription, 
	C.DATBI as ValidUpto, C.DATAB as ValidFrom,
	C.BKZKP as LockIndicator,
	Cast(C.BUKRS as Varchar(4) ) as CompanyCOde,  	Case When C.BUKRS in (1000,2100 ) THEN C.KOSAR else '' END  as Category,
    Case When C.BUKRS in (1000,2100 ) THEN Cast(C.FUNC_AREA as nVarchar(12)) ELSE '' END as FuncArea 
  FROM prd.CSKS C Left Outer Join prd.CSKT T on T.MANDT = C.MANDT and T.KOSTL = C.KOSTL and T.KOKRS= C.KOKRS and T.SPRAS= Case When Left(C.BUKRS,1) = 6 then '1' ELSE 'E' END  AND	C.DATBI = T.DATBI 
 
where C.MANDT= 800 
		and C.DATAB <= convert(varchar, getdate(),112) and C.DATBI >=  convert(varchar, getdate(),112)  
 
AND  T.DATBI >=  convert(varchar, getdate(),112)  

AND NOT (C.BKZKP = 'X' AND C.PKZKP = 'X' AND C.BKZKS = 'X' AND C.PKZKS = 'X' AND C.BKZER='X' AND C.PKZER = 'X')  