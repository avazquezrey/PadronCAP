/*
update l
set localidad_valida= 'LLAVALLOL'
from localidad_sinonimo l
where
--localidad_valida like '%lavallol%'
id = 1162


update l
set localidad_valida= 'MANUEL ALBERTI'
from localidad_sinonimo l
where
id in (47,48) 



update l
set localidad_valida= 'JUAN BAUTISTA ALBERDI'
from localidad_sinonimo l
where
id in (1048) 

*/
/*
update l
set localidad_valida= case when id in (2797,2798,2799,2800,822,3061,3068) then 'Manuel B Gonnet'
								   when id in (3062,844,2804) then 'Joaquin Gorina'
								   when id in (3059,1496,3087) then 'Lisandro Olmos Etcheverry'
							end
from localidad_sinonimo l
where
localidad_valida like 'GONNET'
or localidad_valida like 'olmos'
or localidad_valida like 'GORINA'

*/

select *
from CCM_CPA..cpa_localidad
where
partido = 'La Plata'
order by localidad


select *
from localidad_sinonimo l
order by localidad_valida