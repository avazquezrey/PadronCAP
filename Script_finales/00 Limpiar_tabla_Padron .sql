-- Limpiar campos anexos de normalizacion

update p
set 
codigo_area = null
,codigo_area_aux = null
,prefijo_celular = null
,nro_telefono= null
,deshabilitado= 0
,ok= 0
,a_verificar = 0
,telefono_full= null
,locaidad_normalizada= null
,COD_AREA_SUGERIDO= null
,locaidad_PADRON= null
,locaidad_Sistema= null
,locaidad_Mejorada= null
,locaidad_cpa= null
,Apellido= null
,Nombre= null
,Sexo= null
,localidad_sinonimo= null
,codloc = null
,apellido_padron= null
,nombre_padron= null
,sexo_padron= null
,doc_padron= null
,clase_padron= null
,codloc_padron= null
,localidad_padron= null
,domicilio_padron= null
,con_datos_padron= null
,observacion=null
from PadronBeneficiariosCaja p


