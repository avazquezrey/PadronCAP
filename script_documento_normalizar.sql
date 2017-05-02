declare @nombreyapellido nvarchar(200)
		,@documento int
		,@aux int
		,@resultado int
		,@nyapTabla nvarchar(200)
		,@docTabla int 
set @nombreyapellido = 'MYRIN SVEA ARGENTINA'
set @documento = 196486



select 
  @nyapTabla = apyn
 ,@docTabla = doc 
from CCM_Padron.dbo.padron2015
where apyn like @nombreyapellido
and doc = @documento


select @docTabla 

/*
if @nyapTabla is not null
begin 
	select @aux = CCM_CPA.dbo.LEVDIS(@documento,@docTabla)
	if @aux >75 
	begin
		set @resultado = @documento
	   --print 'Aux:'+ convert(nvarchar(20),@documento)
	   print 'Aux-Padron:'+convert(nvarchar(20),@docTabla)
	end
	else
	begin
	set @resultado = @docTabla
	print 'Doc:'+convert(nvarchar(20),@docTabla)
	end	
end
*/

