************** GetVendors *************************
 Select cast(VC.BUKRS as Varchar(4)) as CompanyCode, V1.LIFNR, Ltrim(rtrim(V1.NAME1))+ ' '+ ltrim(rtrim(V1.NAME2)) + ( Case When ISNULL(A.SORT2,'') <> '' THEN ' - '+ ltrim(rtrim(A.SORT2)) ELSE '' END) as VendorName ,  Cast ( ISNULL(VM.WAERS,'') as Varchar(3)) as CurrencyCode,   V1.ORT01 as City,V1.ORT02 as State,  Cast(V1.LAND1 as Varchar(2)) as Country
 
From prd.LFA1 V1 
Left Outer JOIN prd.LFB1 VC on VC.LIFNR = V1.LIFNR and  V1.MANDT = VC.MANDT

Left outer join prd.LFM1 VM on VM.LIFNR = V1.LIFNR and  VM.MANDT = V1.MANDT
 AND VM.EKORG = VC.BUKRS 
Left Outer JOIN prd.ADRC A on A.CLIENT= V1.MANDT and A.ADDRNUMBER = V1.ADRNR
 AND A.NATION = ''   
where VC.MANDT= 800 and V1.MANDT= 800 and V1.KTOKK <> '5000'  AND VM.EKORG = VC.BUKRS  AND VC.LOEVM = '' and VM.LOEVM = ''  
AND  NOT (V1.LOEVM <> '' OR V1.SPERQ <>  '' OR VM.SPERM <> '')

