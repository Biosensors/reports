******* GetMaterials  ***************

Select 	A.MTART as MatlType, C.MATNR as Material, K.MAKTX as MatlDesctiption, A.MATKL as MtlGroup, Cast(MEINS as Varchar) as UOM, C.WERKS as Plant, A.MSTAE, C.LVORM, C.MMSTA 

from prd.MARC C
		LEFT OUTER JOIN prd.MARA A on A.MANDT = C.MANDT and A.MATNR = C.MATNR
		LEFT OUTER JOIN prd.MAKT K on K.MANDT = C.MANDT and K.MATNR = C.MATNR and K.SPRAS='E'
 WHERE C.MANDT= 800
