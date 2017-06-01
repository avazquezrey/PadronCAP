
----------------------------------------
-- Buscar los datos en el padrón
-- 
----------------------------------------
use Desar_06_Cooperativa

/*
alter table PadronBeneficiariosCaja
add apellido_padron nvarchar(80)
 go
alter table PadronBeneficiariosCaja
add nombre_padron nvarchar(80)
go
alter table PadronBeneficiariosCaja
add sexo_padron nvarchar(2)
go
alter table PadronBeneficiariosCaja
add doc_padron int 
go
alter table PadronBeneficiariosCaja
add clase_padron int
go

alter table PadronBeneficiariosCaja
add codloc_padron int
go
alter table PadronBeneficiariosCaja
add localidad_padron nvarchar(200)
go
alter table PadronBeneficiariosCaja
add domicilio_padron nvarchar(70)
go

alter table PadronBeneficiariosCaja
add con_datos_padron bit default(0)
go
*/

--update p
--set con_datos_padron=0
--from PadronBeneficiariosCaja p


--------------------------------------------
-- Agrego datos PADRON 2015
--------------------------------------------

--update p
--set 
--apellido_padron= pa.apellido 
--,nombre_padron = pa.nombre
--,sexo_padron = pa.sexo
--,clase_padron = pa.clase
--,doc_padron = pa.doc
----
--,localidad_padron = l.localidad
--,codloc_padron = esc.codloc
--,domicilio_padron = pa.domicilio
----
--,con_datos_padron=1



/*


update p --22467   --23311
set 
clase_padron = pa.clase
,con_datos_padron=1


from PadronBeneficiariosCaja p
join CCM_Padron.dbo.padron2015	pa on (p.[Numero Documento]=pa.doc 
														and p.Sexo=pa.sexo)
left join CCM_Padron.dbo.padron2015_escuelas esc on (pa.escu_id=esc.escu_id) 
left join CCM_CPA.dbo.cpa_localidad l on (esc.codloc=l.codloc)

where
p.deshabilitado=0
and p.Sexo is not null


*/


select *
from PadronBeneficiariosCaja