****************** GetGLAccounts ********************

 Select Cast(C.BUKRS as Varchar(4)) as CompanyCode, 
		Cast(C.SAKNR as Varchar(10)) as GLAccount, 
		Cast(T.TXT50 as nVarchar(50)) as GLDesc, 
		Cast(A.KTOKS as Varchar(4)) as ActGrp, 
		Cast(A.GVTYP as Varchar(1))  as PLType ,
    Case WHEN C.SAKNR IN  ( 
'0050340001','0050310011','0070020000', '0050100001','0050310014','0050100012','0050100014','0021040000','0021070003','0021070090','0021052100','0021052101'  ) AND C.FSTAG NOT IN (  'Z060', 'Z009','Z004','Z049'   ) 
				THEN 'G'
			 ELSE 'K'
		END as AcctCategory
	from prd.SKB1 C WITH (NOLOCK) 
		Left Outer Join prd.SKAT T WITH (NOLOCK)  on C.MANDT = T.MANDT and C.SAKNR = T.SAKNR and T.SPRAS= Case When Left(C.BUKRS,1) = 6 THEN '1' ELSE 'E' END  AND T.KTOPL = '1000'		Left Outer Join prd.SKA1 A WITH (NOLOCK)  on C.MANDT = A.MANDT and C.SAKNR = A.SAKNR
where C.MANDT = 800 and T.MANDT= 800 and A.KTOPL='1000'
	AND C.BUKRS in (SELECT BUKRS from prd.T001 where MANDT=800 and KTOPL = '1000')  
AND C.XINTB <>  'X' 

