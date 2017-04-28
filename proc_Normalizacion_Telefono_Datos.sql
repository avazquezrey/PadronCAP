USE Desar_06_Cooperativa
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Echague Tomas>
-- Create date: <18/04/2017>
-- Description:	<Retorna el codigo de area, celular y numero de un numero de telefono>
-- =============================================
/*
declare @codigoArea NVARCHAR(4) ,
	@numeroTelefono NVARCHAR(10) ,
	@celular NVARCHAR(2) 
	
exec [proc_Normalizacion_Telefono_Datos] '1115-480 23983',@codigoArea output,@numeroTelefono output,@celular output
select 
 @codigoArea codigoArea
 ,@numeroTelefono numeroTelefono
 ,@celular celular

*/ 

-- 
create PROCEDURE [dbo].[proc_Normalizacion_Telefono_Datos]
	@numeroTelefonoRecibido nvarchar(50),
	@codigoArea NVARCHAR(4) OUT,
	@numeroTelefono NVARCHAR(10) OUT,
	@celular NVARCHAR(2) OUT
AS
BEGIN
	SET NOCOUNT ON;
	set @codigoArea = NULL 
	set @numeroTelefono = NULL
	set @celular = NULL
	
	declare  @variableControl bit
			,@cortarTelefono int
			,@codigoAreaAux int
			,@longitudTelefono int
			,@telefono bigint
			
	
	-- Saco el codigo de PAIS
	set @numeroTelefonoRecibido = REPLACE(@numeroTelefonoRecibido,'+54','')
	---------------------------------------------------------------
	-- Dejo nada mas los numeros
	while PATINDEX('%[^0-9]%',@numeroTelefonoRecibido)>0
	begin
        set @numeroTelefonoRecibido = STUFF(@numeroTelefonoRecibido,PATINDEX('%[^0-9]%',@numeroTelefonoRecibido),1,'')	
	end
	--Saco todos los ceros de la izquierda del numero
	set @telefono = CONVERT(bigint,@numeroTelefonoRecibido)
	
	--Lo convierto a varchar de nuevo
	set @numeroTelefonoRecibido = CONVERT(nvarchar(50),@telefono)
	
	--Obtengo la longitud del telefono
	set @longitudTelefono = LEN(@numeroTelefonoRecibido)
	if @longitudTelefono < 6 
	begin
		return 0;
	end
	
	
	
	/*Verifico si el numero contiene el codigo de area*/						
	set @variableControl = 1
		
	--Seteo cortarTelefono en 4 para que tome los primeros 4 digitos del telefono
	set @cortarTelefono = 4						
	while (@variableControl = 1 AND @cortarTelefono > 1)
	begin
		set @codigoAreaAux = SUBSTRING(@numeroTelefonoRecibido,1,@cortarTelefono)
		
		select @codigoArea = codigo_area_sin_cero
		from codigo_area_localidades
		where
		   codigo_area_sin_cero= @codigoAreaAux
		
		if @codigoArea is not null
		begin 
			set @variableControl = 0
			set @numeroTelefonoRecibido = SUBSTRING(@numeroTelefonoRecibido,@cortarTelefono + 1,@longitudTelefono)
		end
		else
		begin
			set @cortarTelefono = @cortarTelefono -1
		end
	end							
	
	IF LEN(@numeroTelefonoRecibido) < 6 return 0;
	
	/*Verifico si el numero contiene 15*/
	if SUBSTRING(@numeroTelefonoRecibido, 1, 2) = '15' 
	begin 
		SET @celular = '15'
		SET @numeroTelefono = SUBSTRING(@numeroTelefonoRecibido, 3, @longitudTelefono)
		RETURN 1;
	end
	else
	begin
		set @numeroTelefono = @numeroTelefonoRecibido
	end
	
	
	salir:
	
	SET @codigoArea = (CASE WHEN LEN(@codigoArea) = 0 THEN NULL ELSE @codigoArea END)
	SET @celular = (CASE WHEN LEN(@celular) = 0 THEN NULL ELSE @celular END)
	SET @numeroTelefono = (CASE WHEN LEN(@numeroTelefono) = 0 THEN NULL ELSE @numeroTelefono END)
	
	/******************PRUEBAS**********************/
	
END