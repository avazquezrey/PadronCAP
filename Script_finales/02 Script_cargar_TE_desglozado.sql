use Desar_06_Cooperativa


declare	@TXT nvarchar(50)
	,@AREA NVARCHAR(4)
	,@NUMERO NVARCHAR(10)
	,@CEL NVARCHAR(2)	
	,@FULL NVARCHAR(20)
	,@COD_AREA_SUGERIDO int
--------------------------------------
	,@Programa nvarchar(510)
	,@Beneficio int
	,@Tipo_Doc nvarchar(510)
	,@Numero_Documento int
	,@Telefono nvarchar(510)

---------------------------------------------------
--** toma datos de tabla para normalizar
select 
*
into #PadronBeneficiariosCaja
from PadronBeneficiariosCaja
where deshabilitado = 0




--select 
--	 po.Localidad
--	 ,pt.locaidad_normalizada
--from PadronBeneficiariosCaja po
--join #PadronBeneficiariosCaja pt on po.Programa=pt.Programa and po.Beneficio=pt.Beneficio and po.[Numero Documento]=pt.[Numero Documento]

alter table #PadronBeneficiariosCaja 
add procesado bit default(0)



update #PadronBeneficiariosCaja
set procesado=0

--drop table #PadronBeneficiariosCaja
----------------------------------------------------

declare @cont int, @error int

set @cont=0
set @error=0

while exists(
	select 1 from #PadronBeneficiariosCaja
	where procesado=0)
	
	and @error=0
	
begin
	set @cont=@cont+1
	print 'entro nro: '+convert(varchar(300),@cont)
	
	select top 1
	 @Programa=Programa
	 ,@Beneficio=Beneficio
	 ,@Tipo_Doc= [Tipo Doc]  
	 ,@Numero_Documento= [Numero Documento]
	 ,@Telefono=Telefono
	from #PadronBeneficiariosCaja
	where procesado=0
	
	

	exec dbo.proc_Normalizacion_Telefono_Datos
	
		 @Telefono
		 ,@AREA OUT
		 ,@NUMERO OUT
		 ,@CEL OUT
	 	 	 
  
	------------------------------------------
	print @Telefono--@TXT --nvarchar(50),
	print @AREA--NVARCHAR(4) = NULL OUT,
	print @NUMERO--NVARCHAR(10) = NULL OUT,
	print @CEL--NVARCHAR(2) = NULL OUT,	
	-------------------------------------------

	update #PadronBeneficiariosCaja
	set
		codigo_area=@AREA
		--,codigo_area_aux=@AREA
		,prefijo_celular=@CEL
		,nro_telefono=@NUMERO
		--,telefono_full=@FULL
		--,COD_AREA_SUGERIDO=@COD_AREA_SUGERIDO
		,procesado=1
		,a_verificar=case when @AREA is null then 1
						else 0
					  end
		,deshabilitado=case when @NUMERO is null then 1  -- Ej. nro de glew cargado 0224-436607 -> area 2244 y le falta un digito al nro entonces queda null.
						else 0
					  end 
		,observacion =case when @NUMERO is null then 'Telefono inválido'  
						else null
					  end 			  
		
		
		,telefono_full = case when @AREA is not null	and @NUMERO is not null	 
												then dbo.fun_Normalizacion_Telefono_Full_Datos(@NUMERO,@AREA,@CEL)											  
									 else null
							end	
	where procesado=0
	and @Programa=Programa
	and @Beneficio=Beneficio
	and @Tipo_Doc=[Tipo Doc]
	and @Numero_Documento=[Numero Documento]
	
	
	if @@error <>0
	begin
		  set @error=1
		  print 'error nro: '+convert(varchar(300),@cont)
	end
	
end	



if @error=0
begin 
	 update po
	 set
	 --Programa=pt.Programa
	 --,Beneficio=pt.Beneficio
	 --,[Tipo Doc]=pt.[Tipo Doc]
	 --,[Numero Documento]=pt.[Numero Documento]
	 --,[Apellido y Nombre]=pt.[Apellido y Nombre]
	 --,Item=pt.Item
	 --,Jerarquia=pt.Jerarquia
	 --,Domicilio=pt.Domicilio
	 --,Localidad=pt.Localidad
	 --,Telefono=pt.Telefono
	 --,[Codigo Postal]=pt.[Codigo Postal]
	 codigo_area=pt.codigo_area
	 ,codigo_area_aux=pt.codigo_area_aux
	 ,prefijo_celular=pt.prefijo_celular
	 ,nro_telefono=pt.nro_telefono
	 ,deshabilitado=pt.deshabilitado
	 ,ok=pt.ok
	 ,a_verificar=pt.a_verificar
	 ,telefono_full = pt.telefono_full
	 --,telefono_full=pt.telefono_full
	 --,locaidad_normalizada=pt.locaidad_normalizada
	 --,COD_AREA_SUGERIDO=pt.COD_AREA_SUGERIDO
	 --,locaidad_PADRON=pt.locaidad_PADRON
	 --,locaidad_Sistema=pt.locaidad_Sistema
	 --,locaidad_Mejorada=pt.locaidad_Mejorada
	 --,locaidad_cpa=pt.locaidad_cpa

	 from PadronBeneficiariosCaja po
	 join #PadronBeneficiariosCaja pt on po.Programa=pt.Programa and po.Beneficio=pt.Beneficio and po.[Numero Documento]=pt.[Numero Documento]


end 
------------------------------------------------------

drop table #PadronBeneficiariosCaja


select *
from PadronBeneficiariosCaja
where
deshabilitado=0
