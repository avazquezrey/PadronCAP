declare @resultado int
		,@localidad nvarchar(100)
		,@contador int	
		,@localidadTabla nvarchar(100)
		,@resultadoAuxiliar int
		,@codLocTabla int
		,@localidadSalida nvarchar(100)
		,@codLocSalida int
		,@cantidadRegistrosTabla bigint
					
select codloc, localidad, provincia
into #tablaLoc
from CCM_CPA.dbo.cpa_localidad
where provincia = 'B'



alter table #tablaLoc add procesado bit default(0)
update #tablaLoc set procesado = 0




set @localidad = 'LA PLATA'
set @resultado = 0
set @resultadoAuxiliar = 0
set @contador = 1



while exists(
	select 1 from #tablaLoc
	where procesado = 0
	)
begin 
	set @contador = @contador + 1
	
	--Obtengo el primer registro de la tabla
	select top 1
	@localidadTabla = localidad
	,@codLocTabla = codloc
	from #tablaLoc
	where procesado = 0
	
	--Actualizo el registro que obtuve y lo pongo como procesado asi no lo tomo mas
	update #tablaLoc 
		set procesado = 1 
	where localidad = @localidadTabla
		  and codloc = @codLocTabla
		  and procesado = 0
		  
	--Obtengo la similitud entre la localidad entrante y el registro de la tabla que obtuve
	set @resultadoAuxiliar = CCM_PADRON.dbo.LEVDIS (@localidad,@localidadTabla)
	
	if @resultadoAuxiliar > 60 and @resultadoAuxiliar > @resultado
	begin
		set  @localidadSalida = @localidadTabla
		set @codLocSalida = @codLocTabla
		set @resultado = @resultadoAuxiliar
	end
		
	--if @resultadoAuxiliar > 60
	--begin 
	--goto salir
	--end
	
	
end	

--salir:
	
	print @resultado
	print @localidadSalida
	print '---------------'
	print @codLocSalida


drop table #tablaLoc							

		
