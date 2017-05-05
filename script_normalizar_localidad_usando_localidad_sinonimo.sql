
-- 1) Importar excel con sinonimos. 
		--NombreTabla: localidad_sinonimo

-- 2) Agregar campo identity para eliminar sinonimos repetidos.

	 --alter table localidad_sinonimo
	 --add id int primary key identity(1,1)

-- 3) Eliminar sinonimos repetidos de la tabla importada y dejar uno solo.
/*
--  Control para determinar cuantos eliminar. Ej. 1199 - 290 = 909

select  * --1199
from desar_06_cooperativa..localidad_sinonimo
where
localidad_excel in (
				select 
					 localidad_excel -->290
				from desar_06_cooperativa..localidad_sinonimo
				group by  localidad_excel
				having count(1)>1
				)
*/


--909 repetidos
/*
delete s
from desar_06_cooperativa..localidad_sinonimo s
join (
		  select 
			 localidad_excel 
			 ,min(id)   menor_id
		  from desar_06_cooperativa..localidad_sinonimo
		  group by  localidad_excel
		  having count(1)>1
		  ) menor on (s.localidad_excel=menor.localidad_excel)
where
s.id <> menor.menor_id		  
*/

-- 4)  Agregar campo a tabla PadronBeneficiariosCaja para insertar Localidad obtenida de los sinonimos.

	 --alter table PadronBeneficiariosCaja
	 --add localidad_sinonimo nvarchar(1020)

-- 5) Actualiza campo localidad_sinonimo cruzando por columna "localidad_excel"

	 /*
	 update p
		  set localidad_sinonimo= s.localidad_valida
	 from desar_06_cooperativa..PadronBeneficiariosCaja p  --35386
	 join desar_06_cooperativa..localidad_sinonimo s on (p.Localidad=s.localidad_excel)  --27462
	 */		  

	  -- Actualiza campo localidad_sinonimo cruzando por columna "localidad_valida" 
	  -- Porque en la tabla de sinonimos, no esta para todos los casos la localidad_valida en la localidad_excel.
	  
	 /*
	 -- Actualiza las que tiene localidad =localidad_valida
	 update p  --3720
		  set localidad_sinonimo= s.localidad_valida

	 from desar_06_cooperativa..PadronBeneficiariosCaja p  
	 join (
		  select localidad_valida
		  from desar_06_cooperativa..localidad_sinonimo  
		  where
				localidad_valida is not null
		  group by localidad_valida
	 		 
		 )s on (p.Localidad=s.localidad_valida)  
	 where p.localidad_sinonimo is  null

	 */



-- 6) Agrego campo cod_loc a PadronBeneficiariosCaja
	 --alter table PadronBeneficiariosCaja
	 --add codloc int

-- 7) Actualizo el cod_loc en el CPA_Localidad x "localidad + codigo postal"

/*
	 update p	 --20053
	 set codloc = l.codloc
	 from desar_06_cooperativa..PadronBeneficiariosCaja p  --35386
	 join CCM_CPA..cpa_localidad l on (p.localidad_sinonimo=l.localidad 
												and p.[Codigo Postal]=l.cp)			-- Agrego codigo postal, porque hay localidades como las flores q existen para distintos partidos.

	 where
		  provincia='B'

*/


