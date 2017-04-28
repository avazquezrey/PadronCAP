alter function dbo.fun_Normalizacion_Localidad_Datos
(@localidad nvarchar(100)
)
returns nvarchar(100)

as
begin
		
declare @lodalidad_padron nvarchar(100)
					
select top 1 
	 @lodalidad_padron = localidad
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

return @lodalidad_padron 

end

