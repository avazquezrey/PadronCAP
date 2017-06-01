--
-- 1) Importar excel con sinonimos. 
		--NombreTabla: localidad_sinonimo
		
		select count(1)
		from localidad_sinonimo
		
-- 2) Agregar campo identity para eliminar sinonimos repetidos.

	 --alter table localidad_sinonimo
	 --add id int primary key identity(1,1)

-- 3) Eliminar sinonimos repetidos de la tabla importada y dejar uno solo.
/*
--  Control para determinar cuantos eliminar. Ej. 1199 - 290 = 909

select  * --1203
from desar_06_cooperativa..localidad_sinonimo
where
localidad_excel in (
				select 
					 localidad_excel -->292
				from desar_06_cooperativa..localidad_sinonimo
				group by  localidad_excel
				having count(1)>1
				)
*/


--911 repetidos
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


-- 3 bis) Normalizar via script algunas localidades que quedaron mal en el sinonimo

-- 4)  Agregar campo a tabla PadronBeneficiariosCaja para insertar Localidad obtenida de los sinonimos.

	 --alter table PadronBeneficiariosCaja
	 --add localidad_sinonimo nvarchar(1020)
/*
update p
set localidad_sinonimo=null, codloc=null
from PadronBeneficiariosCaja p
*/

-- 5) Actualiza campo localidad_sinonimo cruzando por columna "localidad_excel"

	 update p
	 	  set localidad_sinonimo= s.localidad_valida
	 
	 from desar_06_cooperativa..PadronBeneficiariosCaja p  --35386
	 join desar_06_cooperativa..localidad_sinonimo s on (p.Localidad=s.localidad_excel)  --31665 --27462
	 		  

	  -- Actualiza campo localidad_sinonimo cruzando por columna "localidad_valida" 
	  -- Porque en la tabla de sinonimos, no esta para todos los casos la localidad_valida en la localidad_excel.
	  
	
	 -- Actualiza las que tiene localidad =localidad_valida
	
	update p  --3611 --3720
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

	 



-- 6) Agrego campo cod_loc a PadronBeneficiariosCaja
	 --alter table PadronBeneficiariosCaja
	 --add codloc int

	 --alter table PadronBeneficiariosCaja
	 --add Observacion varchar(1000)

-- 7) Actualizo el cod_loc en el CPA_Localidad x "localidad + codigo postal"


	 -- Primer pasada para obtener codloc del cpa
	 -- el codigo postal en el excel, algunos estan mal cargados. Ej, para la plata esta 1900 y 101, entonces al 101 no le asigna el cod_loc
	 
	 update p	 --22894 --22846      --22014 --20053
	 set 
		  codloc = l.codloc
	     ,Observacion = '1- Localidad obtenida según nombre localidad y codigo postal recibido'
	
	 from desar_06_cooperativa..PadronBeneficiariosCaja p  --35386
	 join CCM_CPA..cpa_localidad l on (p.localidad_sinonimo=l.localidad 
												and p.[Codigo Postal]=l.cp)			-- Agrego codigo postal, porque hay localidades como las flores q existen para distintos partidos.

	 where
		  provincia='B'


	 
	 -- Segunda pasada con los que falta obtener codloc del cpa, solo por nombre de localidad
 
    update p	 --9128 --9176       --30276
	 set codloc = l.codloc
	    ,Observacion = '2- Localidad obtenida según nombre localidad recibido'
	 
	 from desar_06_cooperativa..PadronBeneficiariosCaja p  --35386
	 join ( select localidad,min(codloc) codloc
			  from CCM_CPA..cpa_localidad 
			  where
				  provincia='B'
			  group by localidad
			  having count(1)=1
			  
			  )l on (p.localidad_sinonimo=l.localidad )
   
    where
		  p.codloc is null
   
