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
ALTER PROCEDURE [dbo].[proc_Numero_Telefono_Normalizar]
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
	declare @codigoAreaS table (A int)
	--------------------------------------------------------------
	--Tabla con todos los codigos de area de Buenos Aires
	insert @codigoAreaS values (11),
							(220),
							(221),
							(223),
							(237),
							(291),
							(2202),
							(2221),
							(2223),
							(2224),
							(2225),
							(2226),
							(2227),
							(2229),
							(2241),
							(2242),
							(2243),
							(2244),
							(2245),
							(2246),
							(2252),
							(2254),
							(2255),
							(2257),
							(2261),
							(2262),
							(2264),
							(2265),
							(2266),
							(2267),
							(2268),
							(2271),
							(2272),
							(2273),
							(2274),
							(2281),
							(2283),
							(2284),
							(2285),
							(2286),
							(2291),
							(2292),
							(2293),
							(2296),
							(2297),
							(2314),
							(2316),
							(2317),
							(2320),
							(2322),
							(2323),
							(2324),
							(2325),
							(2326),
							(2337),
							(2342),
							(2343),
							(2344),
							(2345),
							(2346),
							(2352),
							(2353),
							(2354),
							(2355),
							(2356),
							(2357),
							(2358),
							(2362),
							(2392),
							(2393),
							(2394),
							(2395),
							(2396),
							(2473),
							(2474),
							(2475),
							(2477),
							(2478),
							(2921),
							(2922),
							(2923),
							(2924),
							(2925),
							(2926),
							(2927),
							(2928),
							(2929),
							(2932),
							(2933),
							(2935),
							(2936),
							(2982),
							(2983),
							(3327),
							(3329),
							(3388),
							(3407),
							(3461),
							(3487),
							(3488),
							(3489)
	
	
	
			
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
		set @codigoAreaAux = SUBSTRING(@telefono,1,@cortarTelefono)
		select @codigoArea = A 
		from @codigoAreaS
		where A = @codigoAreaAux
		
		if @codigoArea is not null
		begin 
			set @variableControl = 0
			set @numeroTelefonoRecibido = SUBSTRING(@numeroTelefonoRecibido,@cortarTelefono,@longitudTelefono)
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