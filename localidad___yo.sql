declare @resultado int
		,@localidad nvarchar(100)
		
-- LOCALIDAD
set @localidad = 'LA PLATA'
					
select top 1 *
from (
	 select 
		  codloc
		  ,localidad
		  ,provincia
		  ,CCM_PADRON.dbo.LEVDIS (@localidad,localidad) resultado

	 from CCM_CPA.dbo.cpa_localidad
	 where 
		  provincia = 'B'
	 )	 t
order by t.resultado desc	 
----------------------------------------



--'bulk insert CAP_liquidacion_beneficios_TMP'
-- +' from '+char(39)+@ruta_archivo + @nombre_archivo + char(39)
-- +' with( FIRSTROW=2,FIELDTERMINATOR = ' + char(39)+ '\t'+char(39)+' )'


