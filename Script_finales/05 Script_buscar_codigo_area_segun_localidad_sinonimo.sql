
use Desar_06_Cooperativa

---------------------------------------------------------
-- Busco el código de area segun localidad_sinonimo
---------------------------------------------------------

-- 
/*select
	 po.Programa
	 ,po.Beneficio
	 ,po.[Apellido y Nombre]
	 ,po.Localidad
	 ,po.Telefono
	 ,po.codigo_area
	 ,po.prefijo_celular
	 ,po.nro_telefono
	 ,po.localidad_sinonimo
	 ,po.codloc
	 ,w.*
*/

/*
update po  --1273
set 	COD_AREA_SUGERIDO= w.[Codigo Area] 

from PadronBeneficiariosCaja po 

join ( select *
		 from localidad_w 
		 where
		    Provincia like 'Buenos Aires'
			 or  Provincia like 'Ciudad de Buenos Aires%'
		
		)w on (po.localidad_sinonimo=w.Localidad)

where
deshabilitado=0 
and a_verificar=1	  --> no tiene codigo de area
*/
--order by [Apellido y Nombre]




-- 'Ver como se agrega el código de area, porque hay telefonos como este'
-->AGUILAR RICARDO ANTONIO   
-- localidad excel: ZARATE	
-- te excel:		  02348-7430984	
-- cod area: NULL	
-- nro	  :2348743098	
-- localidad_sinonimo: ZARATE	
-- cod_loc :	 NULL	
-- codigo_area wiki:3487	
-- prov wiki: Buenos Aires	
-- localidad wiki:Zárate


-------------------------------------------------------------------------------------------------
--> Poner a_verificar=0 si  las filas donde long(nro_telefono) + long(cod_area encontrado)=10
-------------------------------------------------------------------------------------------------



--select *
/*
update p --671
set a_verificar=0
from PadronBeneficiariosCaja p
where
deshabilitado=0 
and a_verificar=1
and COD_AREA_SUGERIDO is not null
and len(COD_AREA_SUGERIDO)+len(nro_telefono)=10
*/



