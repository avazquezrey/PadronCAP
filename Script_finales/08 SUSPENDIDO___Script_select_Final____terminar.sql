---------------------------------------------------------------------------------------------------
-- Tiene codloc  y Tiene codigo de area (original del telefono o sugerido segun localidad).
---------------------------------------------------------------------------------------------------
--------------------------
-- Agregar observacion indicando si hay datos estimados/sugeridos
-- estimar la clase
-- Datos del excel
--------------------------

select --21269


case when p.con_datos_padron=1 then p.apellido_padron 	 else p.Apellido end  apellido
,case when p.con_datos_padron=1 then p.nombre_padron 	 else p.Nombre end  Nombre
,case when p.con_datos_padron=1 then p.sexo_padron 	 else p.sexo end  sexo
,case when p.con_datos_padron=1 then p.doc_padron 	 else p.[Numero Documento] end  documento
,case when p.con_datos_padron=1 then p.clase_padron 	 else null end  Clase
--,case when p.con_datos_padron=1 then 'SI' else 'NO' end  Existe_Padron
	 
-- datos excel
,Domicilio
,localidad_sinonimo		localidad
,codloc						
,dbo.fun_Normalizacion_Telefono_Full_Datos
		  (p.nro_telefono 
		  ,isnull(p.codigo_area,p.COD_AREA_SUGERIDO)
		  ,p.prefijo_celular 
		  )											  telefono_completo

		  
from PadronBeneficiariosCaja p

where
p.deshabilitado=0
and (p.codigo_area is not null or p.COD_AREA_SUGERIDO is not null) 
and p.codloc is not null 
and p.clase_padron  is null


---------------------------------------------------------------------------------------------------
-- NO tiene codloc y Tiene codigo de area (original del telefono o sugerido segun localidad).
---------------------------------------------------------------------------------------------------

select  --2936


case when p.con_datos_padron=1 then p.apellido_padron 	 else p.Apellido end  apellido
,case when p.con_datos_padron=1 then p.nombre_padron 	 else p.Nombre end  Nombre
,case when p.con_datos_padron=1 then p.sexo_padron 	 else p.sexo end  sexo
,case when p.con_datos_padron=1 then p.doc_padron 	 else p.[Numero Documento] end  documento
,case when p.con_datos_padron=1 then p.clase_padron 	 else null end  Clase
,case when p.con_datos_padron=1 then 'Existe en padrón' else 'No existe en padrón' end 
	 
-- datos excel
,Domicilio
,localidad_sinonimo
,codloc
,'' telefono
,c.Localidad

from PadronBeneficiariosCaja p
where
p.deshabilitado=0
and (p.codigo_area is not null or p.COD_AREA_SUGERIDO is not null) 
and p.codloc is null 