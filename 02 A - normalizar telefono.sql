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
create table #tbl_ca(codigo_area varchar(6)) 
insert #tbl_ca(codigo_area) values('11')
insert #tbl_ca(codigo_area) values('220')
insert #tbl_ca(codigo_area) values('221')
insert #tbl_ca(codigo_area) values('223')
insert #tbl_ca(codigo_area) values('237')
insert #tbl_ca(codigo_area) values('261')
insert #tbl_ca(codigo_area) values('291')
insert #tbl_ca(codigo_area) values('381')
insert #tbl_ca(codigo_area) values('2202')
insert #tbl_ca(codigo_area) values('2221')
insert #tbl_ca(codigo_area) values('2223')
insert #tbl_ca(codigo_area) values('2224')
insert #tbl_ca(codigo_area) values('2225')
insert #tbl_ca(codigo_area) values('2226')
insert #tbl_ca(codigo_area) values('2227')
insert #tbl_ca(codigo_area) values('2229')
insert #tbl_ca(codigo_area) values('2241')
insert #tbl_ca(codigo_area) values('2242')
insert #tbl_ca(codigo_area) values('2243')
insert #tbl_ca(codigo_area) values('2244')
insert #tbl_ca(codigo_area) values('2245')
insert #tbl_ca(codigo_area) values('2246')
insert #tbl_ca(codigo_area) values('2252')
insert #tbl_ca(codigo_area) values('2254')
insert #tbl_ca(codigo_area) values('2255')
insert #tbl_ca(codigo_area) values('2257')
insert #tbl_ca(codigo_area) values('2261')
insert #tbl_ca(codigo_area) values('2262')
insert #tbl_ca(codigo_area) values('2264')
insert #tbl_ca(codigo_area) values('2265')
insert #tbl_ca(codigo_area) values('2266')
insert #tbl_ca(codigo_area) values('2267')
insert #tbl_ca(codigo_area) values('2268')
insert #tbl_ca(codigo_area) values('2271')
insert #tbl_ca(codigo_area) values('2272')
insert #tbl_ca(codigo_area) values('2273')
insert #tbl_ca(codigo_area) values('2274')
insert #tbl_ca(codigo_area) values('2281')
insert #tbl_ca(codigo_area) values('2283')
insert #tbl_ca(codigo_area) values('2284')
insert #tbl_ca(codigo_area) values('2285')
insert #tbl_ca(codigo_area) values('2286')
insert #tbl_ca(codigo_area) values('2291')
insert #tbl_ca(codigo_area) values('2292')
insert #tbl_ca(codigo_area) values('2293')
insert #tbl_ca(codigo_area) values('2296')
insert #tbl_ca(codigo_area) values('2297')
insert #tbl_ca(codigo_area) values('2302')
insert #tbl_ca(codigo_area) values('2314')
insert #tbl_ca(codigo_area) values('2316')
insert #tbl_ca(codigo_area) values('2317')
insert #tbl_ca(codigo_area) values('2320')
insert #tbl_ca(codigo_area) values('2322')
insert #tbl_ca(codigo_area) values('2323')
insert #tbl_ca(codigo_area) values('2324')
insert #tbl_ca(codigo_area) values('2325')
insert #tbl_ca(codigo_area) values('2326')
insert #tbl_ca(codigo_area) values('2331')
insert #tbl_ca(codigo_area) values('2337')
insert #tbl_ca(codigo_area) values('2342')
insert #tbl_ca(codigo_area) values('2343')
insert #tbl_ca(codigo_area) values('2344')
insert #tbl_ca(codigo_area) values('2345')
insert #tbl_ca(codigo_area) values('2346')
insert #tbl_ca(codigo_area) values('2352')
insert #tbl_ca(codigo_area) values('2353')
insert #tbl_ca(codigo_area) values('2354')
insert #tbl_ca(codigo_area) values('2355')
insert #tbl_ca(codigo_area) values('2356')
insert #tbl_ca(codigo_area) values('2357')
insert #tbl_ca(codigo_area) values('2358')
insert #tbl_ca(codigo_area) values('2362')
insert #tbl_ca(codigo_area) values('2392')
insert #tbl_ca(codigo_area) values('2393')
insert #tbl_ca(codigo_area) values('2394')
insert #tbl_ca(codigo_area) values('2395')
insert #tbl_ca(codigo_area) values('2396')
insert #tbl_ca(codigo_area) values('2473')
insert #tbl_ca(codigo_area) values('2474')
insert #tbl_ca(codigo_area) values('2475')
insert #tbl_ca(codigo_area) values('2477')
insert #tbl_ca(codigo_area) values('2478')
insert #tbl_ca(codigo_area) values('2623')
insert #tbl_ca(codigo_area) values('2920')
insert #tbl_ca(codigo_area) values('2921')
insert #tbl_ca(codigo_area) values('2922')
insert #tbl_ca(codigo_area) values('2923')
insert #tbl_ca(codigo_area) values('2924')
insert #tbl_ca(codigo_area) values('2925')
insert #tbl_ca(codigo_area) values('2926')
insert #tbl_ca(codigo_area) values('2927')
insert #tbl_ca(codigo_area) values('2928')
insert #tbl_ca(codigo_area) values('2929')
insert #tbl_ca(codigo_area) values('2932')
insert #tbl_ca(codigo_area) values('2933')
insert #tbl_ca(codigo_area) values('2935')
insert #tbl_ca(codigo_area) values('2936')
insert #tbl_ca(codigo_area) values('2952')
insert #tbl_ca(codigo_area) values('2982')
insert #tbl_ca(codigo_area) values('2983')
insert #tbl_ca(codigo_area) values('3327')
insert #tbl_ca(codigo_area) values('3329')
insert #tbl_ca(codigo_area) values('3382')
insert #tbl_ca(codigo_area) values('3388')
insert #tbl_ca(codigo_area) values('3407')
insert #tbl_ca(codigo_area) values('3461')
insert #tbl_ca(codigo_area) values('3487')
insert #tbl_ca(codigo_area) values('3488')
insert #tbl_ca(codigo_area) values('3489')
insert #tbl_ca(codigo_area) values('3498')
insert #tbl_ca(codigo_area) values('264')
--------------------------------------------------------------------

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
set deshabilitado=0
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
update pb
set deshabilitado=1
,a_verificar=1
from PadronBeneficiariosCaja pb
where pb.Telefono like '%[A-Z]%'
and deshabilitado=0


----** deshabilita por tener letras
--update pb
--set deshabilitado=1
--from PadronBeneficiariosCaja pb
--where pb.Telefono like '%domicilio%' or pb.Telefono like '%S/N%'
--and deshabilitado=0

-------------------------------------------------------------------
/*
--** obtener codigo area
update pb
set codigo_area=ltrim(rtrim(case when (charindex('-',pb.Telefono)-1)>0 then ltrim(rtrim(substring(pb.Telefono,1,(charindex('-',pb.Telefono)-1))))
				else '' end))
from PadronBeneficiariosCaja pb

where 
len(ltrim(rtrim(case when (charindex('-',pb.Telefono)-1)>0 then ltrim(rtrim(substring(pb.Telefono,1,(charindex('-',pb.Telefono)-1))))
				else '' end)))>=2
and len(ltrim(rtrim(case when (charindex('-',pb.Telefono)-1)>0 then ltrim(rtrim(substring(pb.Telefono,1,(charindex('-',pb.Telefono)-1))))
				else '' end)))<=5
and convert(int,
				replace(
				ltrim(rtrim(case when (charindex('-',pb.Telefono)-1)>0 then ltrim(rtrim(substring(pb.Telefono,1,(charindex('-',pb.Telefono)-1))))
				else '' end))
				, ' ' 
				, ''
				)
			) not in(15)

--and pb.Telefono_normalizado is null  //Tomase
and pb.deshabilitado=0

--** elimina el cero inicial
update pb
set codigo_area=case when left(pb.Codigo_area,1)='0' then substring(pb.Codigo_area,2,(len(pb.Codigo_area)-1))
				else pb.Codigo_area end

from PadronBeneficiariosCaja pb
where pb.codigo_area is not null


update pb
set codigo_area_aux=tt.codigo_area

from PadronBeneficiariosCaja pb
left join #tbl_ca tt on(pb.codigo_area=tt.codigo_area)


*/



--select * from Padron_Beneficiarios pb

select * from PadronBeneficiariosCaja pb
where deshabilitado=0
order by Telefono

drop table #tbl_ca 