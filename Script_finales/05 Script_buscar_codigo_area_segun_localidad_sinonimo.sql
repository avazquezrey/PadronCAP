---------------------------------------------------------
-- Update en localidad_w 
---------------------------------------------------------
/*
update w
set localidad=   case 
						  when localidad like 'Nueve de Abril' then '9 DE ABRIL'
						  when localidad like 'Nueve de Julio' then '9 DE JULIO'
					  end

from localidad_w w
where
( Provincia like 'Buenos Aires'
  or  Provincia like 'Ciudad de Buenos Aires%'
 )
and 
(localidad like 'Nueve de Abril'
or localidad like 'Nueve de Julio')
*/

---------------------------------------------------------
-- Busco el código de area segun localidad_sinonimo
---------------------------------------------------------

'Ver como se agrega el código de area, porque hay telefonos como este'
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

--> Deshabilitar filas donde 
'long(nro_telefono) + long(cod_area encontrado)>10'

-- 1546
select
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

order by [Apellido y Nombre]


