insert into [Padron_Beneficiarios_CAP]
(id
,Programa
,Beneficio
,Apellido_Nombre
,Apellido
,Nombre
,Sexo
,Numero_Documento
,clase
,Domicilio
,Localidad
,codloc
,telefono_full
,Observacion
,alta_prod)


select 
id
,p.Programa
,p.Beneficio
,p.[Apellido y Nombre]
,p.Apellido  
,p.Nombre	
,p.sexo		
,p.[Numero Documento] 
,p.clase_padron 	 
	 
,Domicilio
,localidad_sinonimo		
,codloc						
,telefono_full
,observacion
,alta_prod			   

from sqldesar.desar_06_cooperativa.dbo.PadronBeneficiariosCaja p

where
	 ok=1
