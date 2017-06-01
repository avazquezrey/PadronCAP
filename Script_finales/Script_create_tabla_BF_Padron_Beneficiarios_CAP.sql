
CREATE TABLE [dbo].[Padron_Beneficiarios_CAP](
	id int,
	[Programa] [nvarchar](255) NULL,
	[Beneficio] [int] NULL,
	[Apellido_Nombre] [nvarchar](255) NULL,
	[Apellido] [nvarchar](100) NULL,
	[Nombre] [nvarchar](100) NULL,
	[Sexo] [nvarchar](1) NULL,
	[Numero_Documento] [int] NULL,
	[clase] [int] NULL,
	[Domicilio] [nvarchar](255) NULL,
	[Localidad] [nvarchar](255) NULL,
	[codloc] [int] NULL,
	[telefono_full] [nvarchar](20) NULL,
	[Observacion] [varchar](1000) NULL,
	[alta_prod] [datetime] NULL
) ON [PRIMARY]

GO
