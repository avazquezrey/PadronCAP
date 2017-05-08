----** elimina las celdas que están vacias
--delete pb
--from Padron_Beneficiarios pb
--where 
--pb.Programa is null
--and pb.Beneficio is null
--and pb.Tipo_Doc is null
--and pb.Numero_Documento is null
--and pb.Apellido_y_Nombre is null
--and pb.Item is null
--and pb.Jerarquia is null
--and pb.Domicilio is null
--and pb.Localidad is null
--and pb.Telefono is null
--and pb.codigo_Postal is null
--and pb.Telefono_normalizado is null

------------------------------------------------
----** quito los espacios a derecha e izquierda
--update Padron_Beneficiarios
--set Telefono=ltrim(rtrim(Telefono))

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

--** deshabilitado por mostrarse como notacion cientifica
/*
update pb
set deshabilitado=1
,a_verificar=1
from PadronBeneficiariosCaja pb
where pb.Telefono like '%[A-Z]%'
and deshabilitado=0
*/

----** deshabilita por tener letras
--update pb
--set deshabilitado=1
--from PadronBeneficiariosCaja pb
--where pb.Telefono like '%domicilio%' or pb.Telefono like '%S/N%'
--and deshabilitado=0

-------------------------------------------------------------------



-- Total:35386
-- Habilitados post filtro te invalido: 25786

--select * from PadronBeneficiariosCaja pb


select * from PadronBeneficiariosCaja pb
where deshabilitado=0
order by Telefono

