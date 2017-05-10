------------------------------------------------
-- 1) Armar excel con filas a buscar localidad utilizando API
-- Se envia a buscar aquellas filas que: tengan telefono válido, no tienen codigo de area y no se encontró cod_loc
------------------------------------------------
/*
--3365
select 
Programa
,Beneficio
,[Tipo Doc]
,[Numero Documento]
,[Apellido y Nombre]
,Item
,Jerarquia
,Domicilio
--,Localidad
,localidad_sinonimo Localidad
,Telefono
,[Codigo Postal]

--select distinct localidad_sinonimo
from PadronBeneficiariosCaja
where
deshabilitado=0    --> te válido
--and a_verificar=1  --> el te. no tiene código de área
and codloc is null  --> no se encontro localidad en cpa segun sinonimo

order by localidad_sinonimo
*/


------------------------------------------------
--2) Importar el excel con los datos de la API: 
-- API_PadronBeneficiariosCaja
------------------------------------------------

------------------------------------------------
--3) Agregar campos a PadronBeneficiariosCaja con la info retornada por la API
------------------------------------------------

'?????'

------------------------------------------------
--4) Actualizar campos API en PadronBeneficiariosCaja 
------------------------------------------------

select 
	 
from PadronBeneficiariosCaja po
join API_PadronBeneficiariosCaja pt 
		  on po.Programa=pt.Programa 
			   and po.Beneficio=pt.Beneficio 
			   and po.[Numero Documento]=pt.[Numero Documento]
			   
			   



------------------------------------------------
--5) Con los datos obtenidos de la API:
	 -- setear localidad sinonimo con la localidad de la API
	 -- Buscar localidad API en localidad CPA para setear cod_loc
------------------------------------------------



