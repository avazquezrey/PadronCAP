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
