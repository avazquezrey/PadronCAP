/*
update l
set localidad_valida= 'LLAVALLOL'

from localidad_sinonimo l
where
localidad_valida like '%lavallol%'
--id = 1162
*/


/*
--ALBERTI-PILAR
--ALBERTI

update l
set localidad_valida= 'MANUEL ALBERTI'
select *
from localidad_sinonimo l
where
id in (47,48) 
*/

/*
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

/*
update l
set localidad_valida= 'Bernal Oeste'

from localidad_sinonimo l
where
localidad_excel in (

'BERNAL O.'
,'BERNAL OESTE'
,'BERNAL-OESTE'
)


update l
	 set localidad_valida= 'Bernal Este'

from localidad_sinonimo l
where
localidad_excel in (

'BERNAL - QUILMES'
,'BERNAL ESTE'
)

*/

/*
update l
	 set localidad_valida= 'Ezpeleta Este'

from localidad_sinonimo l
where
localidad_excel like '%ezpeleta%'
*/

/*
update l
	 set localidad_valida= 'San Nicolas de los Arroyos'


from localidad_sinonimo l
where
localidad_excel in (
'LA EMILIA S.NICOLAS'
,'SAN  NICOLAS'
,'SAN NICOLAS'
,'GRAL. ROJO S.NICOLAS'
,'S. NICOLAS'
,'SAN NICOLAS LA EMILI'
)
*/


/*
update l
	 set localidad_valida= 'Villa Saenz Pena'

from localidad_sinonimo l
where
localidad_excel LIKE 'SAENZ PE%'
AND localidad_excel NOT LIKE '%CHACO'
*/

/*

update l
	 set localidad_valida= 'Presidencia Roque Saenz Pena'

from localidad_sinonimo l
where
localidad_excel LIKE '%SAENZ PE%'
AND localidad_excel LIKE '%CHACO%'

*/



/*
update l
	 set localidad_valida='Quilmes Oeste'
from localidad_sinonimo l
where
localidad_excel LIKE 'quilmes O%'

*/


/*

declare @tbl table(

localidad_sinonimo nvarchar(500)
,localidad_cpa nvarchar(500)
)



insert into @tbl (localidad_sinonimo,localidad_CPA) values('3 ARROYOS','Tres Arroyos')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('3 DE FEBRERO','Tres de Febrero')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('ACASUSSO','Acassuso')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('ADELINA','ADELINA')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('ADOLFO SOURDEAUX','Ingeniero Adolfo Sourdeaux')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('ALGARROBO','ALGARROBO')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('ALMIRANTE BROW','Almirante Brown')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('ALVEAR','ALVEAR')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('ascension','Estacion Ascension')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('BALLESTER','Villa Ballester')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('BARAZATEGUI','Berazategui')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('BARTOLOME BAVIO','Bme Bavio Gral Mansilla')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('BATAN','Barrio Batan')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('BAVIO','Bme Bavio Gral Mansilla')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('BRANDSEN','Coronel Brandsen')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('CALZADA','Rafael Calzada')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('CANNING','Canning')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('CASANOVA','Isidro Casanova')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('CATAN','Gonzalez Catan')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('CLAROMECO','Balneario Claromeco')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('DOMINICO','Villa Dominico')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('E DE LA CRUZ','Exaltacion de la Cruz')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('EL JAGUEL','El Jaguel')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('EL PATO','Centro Agricola el Pato')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('ESCOBAR','Belen de Escobar')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('ESTACION ACEVEDO','Acevedo')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('ESTACION URQUIZA','Urquiza')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('etcheverry','Lisandro Olmos Etcheverry')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('FATIMA','Fatima Estacion Empalme')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('GENERAL CERRI','Gral Daniel Cerri')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('GENERL BELGRANO','General Belgrano')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('GERVASIO PAVON','Moron')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('GIALEGUAYCHU','Gualeguaychu')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('GUILLIAM MORRIS','William Morris')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('HURLINGAN','Hurlingham')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('INES INDAR','Ines Indart')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('ingeniero  Allan','Ingeniero Allan')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('ingeniero  PABLO NOGUES','Pablo Nogues')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('ingeniero  WHITE','Ingeniero White')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('INGENIERO PABLO NOGUES','Pablo Nogues')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('JAGUEL','El Jaguel')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('JOSE MARIA GUTIERREZ','Juan Maria Gutierrez')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('JOSE MARIA JAUREGUI','Jauregui Jose Maria')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('JUAN FERNANDEZ','Juan N Fernandez')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('LA FLORIDA','Villa la Florida')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('LISANDRO OLMOS','Lisandro Olmos Etcheverry')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('LOMA NEGRA','Loma Negra')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('LORENZO LUZURIAGA','Villa Luzuriaga')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('LOS PINOS','Los Pinos')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('LOS TRONCOS DEL TALAR','Troncos del Talar')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('MAQUINISTA F. SAVIO','Maquinista F Savio')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('MAQUINISTA SAVIO','Maquinista F Savio')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('MARCO PAZ','Marcos Paz')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('MIRAMAR','Miramar')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('MOQUEHUA','Villa Moquehua')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('NICANOR OTAMENDI','Comandante Nicanor Otamendi')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('NUEVE DE JULIO','9 de Julio')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('O HIGGINS','O Higgins')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('OLOVOS','Olivos')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('P.MILLAN- RAMALLO','Perez Millan')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('PACHECO','General Pacheco')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('PALOMAR','El Palomar')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('PEHUEN','Pehuen Co')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('PILAR VILLA ASTOLFI','Villa Astolfi')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('PIÑEYRO','pineyro')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('PODESTA','Pablo Podesta')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('PODESTAD','Pablo Podesta')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('POLVORINES','Los Polvorines')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('PONTEVEDRA MERLO','Pontevedra')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('PUEBLO DOYLE','Doyle')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('RAMALLO VILLA','Villa Ramallo')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('REMEDIOS DE ESCALADA','Remedios de Escalada')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('RIVADAVIA AMERICA','America')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('S.LUGARES','Santos Lugares')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('saldungaray tornquist','Tornquist')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SAN  NICOLAS','San Nicolas de los Arroyos')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SAN ANDRES','SAN ANDRES')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SAN ANOTNIO DE ARECO','San Antonio de Areco')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SAN ANTONIO','San Antonio')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SAN BERNARDO','San Bernardo del Tuyu')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SAN CLEMENTE','San Clemente del Tuyu')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SAN EMILIO','San Emilio')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SAN FRANCISCO SOLANO','San Francisco Solano')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SAN JOSE','San Jose')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SAN JUAN','San Juan')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SAN JUSTO','San Justo')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SAN MARTI DE LOS ANDES','SAN MARTIN DE LOS ANDES')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SAN NICOLAS','San Nicolas de los Arroyos')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SANTA CLARA','Santa Clara del Mar')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SEGUI','Arturo Segui')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('Sordiaux','Ingeniero Adolfo Sourdeaux')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('SPEGAZZINI','Carlos Spegazzini')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('TESEI','Villa Santos Tesei')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('TREINTA DE AGOSTO','30 de Agosto')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('VEINTICINCO DE MAYO','25 de Mayo')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('VILLA ALSINA','Valentin Alsina')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('VILLA GENERAL SAVIO','Villa Gral Savio Ex Sanchez')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('VILLA LONGA','Villalonga')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('VILLA NUEVA','Villanueva')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('VILLA ROSA -PILAR','Villa Rosa')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('VILLA TESEI','Villa Santos Tesei')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('VILLA UDAONDO','Villa Gobernador Udaondo')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('VILLA URQUIZA','Urquiza')
insert into @tbl (localidad_sinonimo,localidad_CPA) values('WILLIAN MORRIS','William Morris')

update t
set 
localidad_sinonimo=ltrim(rtrim(localidad_sinonimo))
,localidad_CPA=ltrim(rtrim(localidad_CPA))
from @tbl t


update l
set localidad_valida=t.localidad_cpa
from @tbl t
join localidad_sinonimo l  on (ltrim(rtrim(t.localidad_sinonimo))=ltrim(rtrim(l.localidad_valida)))

*/