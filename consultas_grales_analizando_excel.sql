-- Nombres repetidos, distinto dni
select *
from PadronBeneficiariosCaja
where
	 [Apellido y Nombre] in (
select [Apellido y Nombre]
from PadronBeneficiariosCaja
group by [Apellido y Nombre]
having count(1)>1
)
order by [Apellido y Nombre]






--Estan todos los códigos de area pero no todas las localidades
-- Ej:02257	 -- Mar De Ajo, pero hay otras localidades con el mismo código de área.
select Codigo_area
from Codigo_Area_Localidades c
where
	 c.provincia = 'Buenos Aires'
group by Codigo_area
having count(1)>1	 


select *
from Codigo_Area_Localidades c
where
	 c.provincia = 'Buenos Aires'
and Codigo_area='02257'



select 
	  codloc
	  ,localidad
	  ,provincia
	  ,CCM_PADRON.dbo.LEVDIS ('Juni',localidad) resultado

from CCM_CPA.dbo.cpa_localidad
where 
	  provincia = 'B'
order by resultado desc		  

select *
from CCM_CPA.dbo.cpa_localidad
where 
	  provincia = 'B'
order by localidad

