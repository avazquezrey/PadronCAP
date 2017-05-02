
-- Ejecutar cuando se importe el excel de codigos de area
/*
alter table codigo_area_localidades
add codigo_area_sin_cero varchar(10)


update codigo_area_localidades
set codigo_area_sin_cero=convert(varchar(10),convert(int, codigo_area))
*/

/*
update c
set Localidad= rtrim(substring(localidad,1,patindex('%(%',Localidad)-1))
from codigo_area_localidades c
where
Localidad like '%(Prov. Buenos Aires)'
*/






