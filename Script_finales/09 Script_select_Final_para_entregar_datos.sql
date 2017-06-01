---------------------------------------------------------------------------------------------------
-- Tiene codloc  y Tiene codigo de area (original del telefono o sugerido segun localidad).
---------------------------------------------------------------------------------------------------
--------------------------
-- Agregar observacion indicando si hay datos estimados/sugeridos
-- estimar la clase
-- Datos del excel
--------------------------
--Retornado: 17819
-- Loc + cp: 13233
-- Loc: 4586


--alter table PadronBeneficiariosCaja
--add id int identity(1,1)

--alter table PadronBeneficiariosCaja
--add alta_prod datetime

--update p
--set 
--	 ok=0
--	 ,alta_prod=null

--from PadronBeneficiariosCaja p


/*
update p
set 
	 ok=1
	 ,alta_prod=getdate()

from PadronBeneficiariosCaja p
where
p.deshabilitado=0
and p.codigo_area is not null 
and p.codloc is not null  --20370
and p.clase_padron  is not null --17819
*/

select 
id
,p.Programa
,p.Beneficio
,p.[Apellido y Nombre]
,p.Apellido  apellido
,p.Nombre	Nombre
,p.sexo		sexo
,p.[Numero Documento] documento
,p.clase_padron 	 Clase
	 
,Domicilio
,localidad_sinonimo		localidad
,codloc						
,telefono_full
,observacion
,alta_prod			   fecha_alta

from PadronBeneficiariosCaja p

where
	 ok=1


order by [Apellido y Nombre]