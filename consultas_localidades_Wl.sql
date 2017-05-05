select *
from cpa_localidad
where
localidad in (
 'Corral de Bustos'
 ,'Alejo Ledesma'
 ,'Arias'
 ,'Cafferata'
 ,'Camilo Aldao'
 ,'Chañar Ladeado'
 ,'Colonia Barge'
 --,'Capitán General Bernardo O'Higgins'
 ,'Cavanagh'
 ,'Colonia Bismarck'
 ,'Colonia Italiana'
 ,'General Baldissera'
 ,'Guatimozín'
 ,'Isla Verde'
 ,'Monte Maíz'
 ,'Wenceslao Escalante'

)
and provincia in ('S','X')

order by localidad

select *
from cpa_provincias


select * 
from cpa_localidad l
join cpa_provincias p on (l.provincia=p.codprov)
where
localidad ='Isla Verde'

order by p.provincia

select localidad, count(1)
from desar_06_cooperativa..localidad_w
group by localidad
having count(1)>1



/*
update w
set Localidad = ltrim(rtrim(localidad))
	 ,Provincia=ltrim(rtrim(Provincia))
from desar_06_cooperativa..localidad_w w
*/

/*
select *
from desar_06_cooperativa..localidad_w
where
localidad='Bella Vista'
*/


-- Total: 3674

-- 3218 tienen provincia unica
select *
from desar_06_cooperativa..localidad_w  w
where
	 patindex('%/%',w.provincia)=0

-- 456 tienen mas de una provincia
select *
from desar_06_cooperativa..localidad_w  w
where
	 patindex('%/%',w.provincia)>0
order by w.Localidad

 
-- 132 localidades son Ciudad Buenos Aires, 
-- No se si ponerle BS.AS o Ciudad BsAs.
-- Ej: San Jose
select *
from desar_06_cooperativa..localidad_w  w
where
Localidad='San Jose'

-- Esta para varias provincias, una de ellas con provincia Buenos aires y con Ciudad de Bs.As.
-- pero en CPA con ese nombre esta 6 veces con prov. de bs. as, pero los partidos varian, por ende el 
/*Almirante Brown
25 de Mayo
Alberti
Necochea
Puan
Rauch*/

select *
from desar_06_cooperativa..localidad_w  w
left join cpa_localidad l on (w.Localidad=l.localidad)
left join cpa_provincias p on (l.provincia=p.codprov)
where
	 patindex('%/%',w.provincia)>0
	 and [Codigo Area]=11
	 and p.codprov='B'
order by w.Localidad	 


	 
-- 324 localidades que hay que definir la provincia
select *
from desar_06_cooperativa..localidad_w  w
--left join cpa_localidad l on (w.Localidad=l.localidad)
--left join cpa_provincias p on (l.provincia=p.codprov)
where
	 patindex('%/%',w.provincia)>0
--	 and [Codigo Area]<>11
order by w.Localidad	 


select *
from cpa_localidad
where
localidad like '%remedios%'