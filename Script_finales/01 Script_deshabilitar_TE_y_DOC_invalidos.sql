----** elimina las celdas que están vacias
/*
delete pb
from PadronBeneficiariosCaja pb
where 
pb.Programa is null
and pb.Beneficio is null
and pb.[Tipo Doc] is null
and pb.[Numero Documento] is null
and pb.[Apellido y Nombre] is null
and pb.Item is null
and pb.Jerarquia is null
and pb.Domicilio is null
and pb.Localidad is null
and pb.Telefono is null
and pb.[Codigo Postal] is null
*/
------------------------------------------------
----** quito los espacios a derecha e izquierda
/*
update PadronBeneficiariosCaja
 set Telefono=ltrim(rtrim(Telefono))
*/
------------------------------------------------


--** elimina los codigo de area
update pb
set codigo_area=null
,codigo_area_aux=null
from PadronBeneficiariosCaja pb

--------------------------------------------------------------------
--** quita todos los espacios
update pb
set pb.Telefono=ltrim(rtrim(replace(pb.Telefono,' ', '')))
from PadronBeneficiariosCaja pb


--** habilita a todos
update pb
set 
deshabilitado=0
,a_verificar=0
from PadronBeneficiariosCaja pb

--** deshabilita donde el telefono esta vacio
update pb
set deshabilitado=1
from PadronBeneficiariosCaja pb
where len(pb.Telefono)=0
and deshabilitado=0

--** deshabilita donde el telefono sea nulo
update pb
set deshabilitado=1
from PadronBeneficiariosCaja pb
where pb.Telefono is null
and deshabilitado=0

--** deshabilita los que solo tienen guion
update pb
set deshabilitado=1
from PadronBeneficiariosCaja pb
where len(replace(pb.Telefono,'-',''))=0
and deshabilitado=0

--** deshabilita los que tienen todo el nro en cero
update pb
set deshabilitado=1
from PadronBeneficiariosCaja pb
where len(replace(replace(pb.Telefono,'-', ''),'0',''))=0
and deshabilitado=0

--** deshabilita los que tienen todo unos y ceros
update pb
set deshabilitado=1
from PadronBeneficiariosCaja pb
where len(replace(replace(replace(pb.Telefono,'-', ''),'0',''),'1',''))=0
and deshabilitado=0



-----------------------------------
-- Deshabilita los registros con documento inválido
-----------------------------------

update pb  --433
set deshabilitado=1
from PadronBeneficiariosCaja pb
where 
	 [Numero Documento]<=1000000
	 or [Numero Documento]>=99999999



