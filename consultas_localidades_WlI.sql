-- Se asume que son todos provincia de bs.as.
select 
	 --localidad 
	 --,telefono
	 --,[codigo postal]
	 --,dbo.fun_Normalizacion_Localidad_Datos(localidad) normalizada
	 --
	 *
from PadronBeneficiariosCaja
where
localidad='12 de octubre'
order by localidad


select *
from localidad_w
where
localidad like  '%octubre%'

select *
from Codigo_Area_Localidades
where
codigo_area_sin_cero in(11,2473)

select *
from localidad_w
where
[Codigo Area] in(11,2473)


select *
from ccm_cpa..cpa_localidad
where
localidad like '12 de octubre'

select *
from localidad_w
where
[Codigo Area]='2473'


