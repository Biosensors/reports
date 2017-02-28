**************** GetAssets *********************

 SELECT A.BUKRS as CompanyCode, A.ANLN1 as AssetCode,A.ANLN2,A.TXT50 as AssetName, 
A.ANLKL as AssetClass,A.ANLAR as AssetType,A.SERNR as SerialNo,
A.ANLTP as AssetCategory, A.ERDAT as CreationDate
From prd.ANLA A 

where	A.MANDT = 800 AND  datediff(dd,Substring(A.ERDAT,1,4)+'/'+Substring(A.ERDAT,5,2)+'/'+Substring(A.ERDAT,7,2),getdate()) <= 1390 