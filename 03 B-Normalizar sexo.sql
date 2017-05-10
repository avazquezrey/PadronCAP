use Desar_06_Cooperativa


DECLARE 
@SEXO nvarchar(1)
,@NOMBRE nvarchar(250)
,@CONTADOR INT
,@AUX INT
,@Programa nvarchar(510)
,@Beneficio int
,@Tipo_Doc nvarchar(510)
,@Numero_Documento int
,@Telefono nvarchar(510)


--** toma datos de tabla para normalizar
select
*
into #PadronBeneficiariosCaja
from PadronBeneficiariosCaja
where deshabilitado = 0

alter table #PadronBeneficiariosCaja add procesado bit default(0)


while exists(
	select 1 from #PadronBeneficiariosCaja
	where procesado=0
	and deshabilitado=0
)
begin
	set @CONTADOR=@CONTADOR+1
	print 'entro nro: '+convert(varchar(300),@cont)
	
	select top 1
	@Programa=Programa
	,@Beneficio=Beneficio
	,@Tipo_Doc= [Tipo Doc]  
	,@Numero_Documento= [Numero Documento]
	,@NOMBRE = nombre
	from #PadronBeneficiariosCaja
	where procesado=0
	and deshabilitado=0
	
	
SET @SEXO =(select CCM_Padron.dbo.GetSexoPorNombre(@NOMBRE))


		
--update #PadronBeneficiariosCaja
	set
		sexo = @SEXO	 
	where procesado=0
	and @Programa=Programa
	and @Beneficio=Beneficio
	and @Tipo_Doc=[Tipo Doc]
	and @Numero_Documento=[Numero Documento]
	and deshabilitado=0
end	


drop table #PadronBeneficiariosCaja