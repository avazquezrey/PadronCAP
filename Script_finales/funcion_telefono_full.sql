use Desar_06_Cooperativa
go
create function dbo.fun_Normalizacion_Telefono_Full_Datos

(@numeroTelefono nvarchar(8)
	,@codigoArea nvarchar(4)
	,@celular nvarchar(2)
)
returns nvarchar(50)

as
begin
declare 
	@telefonoCompleto nvarchar(50)

if @numeroTelefono is not null 
and @codigoArea is not null 
and len(@numeroTelefono)>0
and len(@codigoArea)>0
begin	
  set @celular = isnull(@celular,'')
  set @telefonoCompleto = '+549 '+ ltrim(rtrim(@codigoArea))+' '+ltrim(rtrim(@celular))+' '+ltrim(rtrim(@numeroTelefono))
end 

return @telefonoCompleto

end