
----------------------------------------
-- Buscar los datos en el padrón
-- 
----------------------------------------
use Desar_06_Cooperativa


--use CCM_Padron

select 
p.Sexo
,p.[Numero Documento]
,p.[Apellido y Nombre]
,p.Domicilio
,p.Localidad
,p.localidad_sinonimo
,p.codloc
--------
,pa.apyn			 
,pa.apellido
,pa.nombre
,pa.cuil
,pa.clase
,pa.domicilio

,esc.codloc
,l.localidad

from PadronBeneficiariosCaja p
join CCM_Padron.dbo.padron2015	pa on (p.[Numero Documento]=pa.doc 
														and p.Sexo=pa.sexo)
left join CCM_Padron.dbo.padron2015_escuelas esc on (pa.escu_id=esc.escu_id) 
left join CCM_CPA.dbo.cpa_localidad l on (esc.codloc=l.codloc)

where
p.deshabilitado=0
and p.Sexo is not null



/*
doc
sexo
apyn
apellido
nombre
cuil
clase
domicilio
distrito
cod_part
tipo_doc
extranj
escu_id
*/

/*

select *
from CCM_Padron.dbo.padron2015

select top 100 *
from dbo.padron2015_escuelas
*/