use Desar_06_Cooperativa


DECLARE @Nombreyapellido nvarchar(250)
,@NOMBRE nvarchar(250)
,@APELLIDO nvarchar(250)
,@CONTADOR INT
,@AUX INT
,@Programa nvarchar(510)
,@Beneficio int
,@Tipo_Doc nvarchar(510)
,@Numero_Documento int
,@Telefono nvarchar(510)
,@SEXO nvarchar(1)


--** toma datos de tabla para normalizar
select
*
into #PadronBeneficiariosCaja

from PadronBeneficiariosCaja
where deshabilitado = 0

alter table #PadronBeneficiariosCaja add procesado bit default(0)

update t
set procesado=0
from #PadronBeneficiariosCaja t


while exists(
	select 1 from #PadronBeneficiariosCaja
	where procesado=0
	--and deshabilitado=0
)
begin
	set @CONTADOR=@CONTADOR+1
	print 'entro nro: '+convert(varchar(300),@CONTADOR)
	
	select top 1
		  @Programa=Programa
		  ,@Beneficio=Beneficio
		  ,@Tipo_Doc= [Tipo Doc]  
		  ,@Numero_Documento= [Numero Documento]
		  ,@Nombreyapellido = ltrim(rtrim([Apellido y Nombre]))
	from #PadronBeneficiariosCaja
	where procesado=0
	--and deshabilitado=0
	
	 set @APELLIDO = null
	 set @NOMBRE = null
    set @SEXO =null
    
    EXEC CCM_Padron.dbo.SepararApellidoNombre @Nombreyapellido,@APELLIDO OUT,@NOMBRE OUT
	 
	 print @APELLIDO + ' apellido' 
	 print @NOMBRE + ' nombre'
	 
	 SET @SEXO =(select CCM_Padron.dbo.GetSexoPorNombre(@NOMBRE))
		
	 print 	@SEXO + ' sexo'
	 
	update #PadronBeneficiariosCaja
	 set
		 nombre=@NOMBRE
		 ,apellido = @APELLIDO
		 ,sexo= @SEXO
		 ,procesado=1
		 
	 where procesado=0
	 and @Programa=Programa
	 and @Beneficio=Beneficio
	 and @Tipo_Doc=[Tipo Doc]
	 and @Numero_Documento=[Numero Documento]
	 --and deshabilitado=0
end	




update po
set
	nombre=pt.NOMBRE
	,apellido = pt.APELLIDO
	,sexo= pt.sexo
	
from PadronBeneficiariosCaja po
join #PadronBeneficiariosCaja pt on po.Programa=pt.Programa and po.Beneficio=pt.Beneficio and po.[Numero Documento]=pt.[Numero Documento]



drop table #PadronBeneficiariosCaja
