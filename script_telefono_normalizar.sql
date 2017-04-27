USE Desar_06_Cooperativa

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
/*
DECLARE @TXT nvarchar(50),
	@AREA NVARCHAR(4) ,
	@NUMERO NVARCHAR(10) ,
	@CEL NVARCHAR(2)
SET @TXT = '+54 0211 423-4693'
EXEC dbo.[sp_FormatPhoneNumber] @TXT, @AREA OUT, @NUMERO OUT, @CEL OUT
PRINT @TXT
PRINT 'Area: '+ISNULL(@AREA, '')
PRINT 'Cel: '+ISNULL(@CEL, '')
PRINT 'Numero: '+ISNULL(@NUMERO, '')

*/
-- =============================================
	--@TXT nvarchar(50),
	--@AREA NVARCHAR(4) OUT,
	--@NUMERO NVARCHAR(10) OUT,
	--@CEL NVARCHAR(2) OUT



-- Agregar control segun longitud de codigo de area
-- Ej cod area tam 4 entonces resto del telefono longitud 6
	
	
	DECLARE @A nvarchar(4), @AL int
			,@variableControl bit
			,@cortarTelefono int
			,@areaAux int
			,@longitudTelefono int
			,@telefono BIGINT
			,@AREA NVARCHAR(4)
			,@NUMERO NVARCHAR(10)
			,@CEL NVARCHAR(2)
			,@TXT nvarchar(50)
			,@telefonoInternacional nvarchar(100)
			
	SET @TXT = '5776419'			
	
	-- Saco el codigo de PAIS
	SET @TXT = REPLACE(@TXT,'+54','')
	
	-- Dejo nada mas los numeros
	WHILE PATINDEX('%[^0-9]%',@TXT)>0
        SET @TXT = STUFF(@TXT,PATINDEX('%[^0-9]%',@TXT),1,'')	
	
	PRINT @TXT
	--Saco todos los ceros de la izquierda del numero
	SET @telefono = CONVERT(BIGINT,@TXT)
	
	--Lo convierto a varchar de nuevo
	set @TXT = CONVERT(nvarchar(50),@telefono)
	
	--Obtengo la longitud del telefono
	set @longitudTelefono = LEN(@TXT)
	
	--IF @longitudTelefono < 6 RETURN 0;
	
	
	--Tabla con todos los codigos de area de Buenos Aires
	DECLARE @AREAS TABLE (A int)
	INSERT @AREAS VALUES (11),
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
	
	
	/*Verifico si el numero contiene el codigo de area*/						
	set @variableControl = 1	
	--Seteo cortar telefono en 4 para que tome los primeros 4 digitos del telefono
	set @cortarTelefono = 4						
	while (@variableControl = 1 AND @cortarTelefono > 1)
	begin
		set @areaAux = SUBSTRING(@TXT,1,@cortarTelefono)
		select @AREA = A 
		from @AREAS
		where A = @areaAux
		
		if @AREA is not null
		begin 
			set @variableControl = 0
			set @TXT = SUBSTRING(@TXT,@cortarTelefono + 1,@longitudTelefono)
		end
		else
		begin
			set @cortarTelefono = @cortarTelefono -1
		end
	end							
	
	--IF LEN(@TXT) < 6 return 0;
	
	/*Verifico si el numero contiene 15*/
	if SUBSTRING(@TXT, 1, 2) = '15' 
	begin 
		SET @CEL = '15'
		SET @NUMERO = SUBSTRING(@TXT, 3, @longitudTelefono)
		--RETURN 1;
	end
	else
	begin
		set @NUMERO = @TXT
	end
	
	
	salir:
	
	SET @AREA = (CASE WHEN LEN(@AREA) = 0 THEN NULL ELSE @AREA END)
	SET @CEL = (CASE WHEN LEN(@CEL) = 0 THEN NULL ELSE @CEL END)
	SET @NUMERO = (CASE WHEN LEN(@NUMERO) = 0 THEN NULL ELSE @NUMERO END)
	
	/******************PRUEBAS**********************/
	print @AREA
	PRINT '----'
	PRINT @CEL
	PRINT '----'
	PRINT @NUMERO	
	SET @telefonoInternacional = '+549 '+@AREA+' '+isnull(@CEL,'')+' '+@NUMERO
	print @telefonoInternacional
