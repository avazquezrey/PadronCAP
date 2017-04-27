USE [Desar_06_Cooperativa]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Echague Tomas>
-- Create date: <18/04/2017>
-- Description:	<Funcion que retorna el documento y la clase de la persona, buscandolo en el padron 2015>
-- =============================================
ALTER PROCEDURE [dbo].[fun_documento_obtener_padron_2015]
(
	@nombreYapellido NVARCHAR(100)
	,@documento int output
	,@clase int output
)
AS
BEGIN
SET NOCOUNT ON;

declare  @aux int
		,@resultado int
		,@nyapTabla nvarchar(200)
		,@docTabla int 

set @resultado = null

select @nyapTabla = apyn, @docTabla = doc, @clase = clase from 
CCM_Padron.dbo.padron2015
where apyn like @nombreYapellido

if @nyapTabla is not null
begin 
	select @aux = CCM_CPA.dbo.LEVDIS(@documento,@docTabla)
	if @aux >75 
	begin
		set @resultado = @documento
	end
	
	else
	begin
		set @resultado = @docTabla
	end	
end
		
	set @documento = @resultado
	
END