******************  GetProjectOrders ****************

 select 
	cast(BUKRS as varchar(4)) as CompanyCode,
	Cast(AUFNR as Varchar(12)) as OrderNo,
	Cast(AUART as Varchar(4)) as OrderType,
	Cast(AUTYP as Int) as Category,
	Cast(KTEXT as nVarchar(40)) as OrderDesc,
	Cast(KAPPL as Varchar(2)) as Appln
from prd.AUFK
where MANDT= 800 and  AUTYP =  1