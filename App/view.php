SELECT * FROM `project` WHERE projectid='18TS02B0538'








kirim email blum aktif di function

public function ApprovalProjectMU(Request $request)








STATUS PROJECT

'NEW','AREA - GENERAL MANAGER AREA',
'UBIS - MANAGER','UBIS - GENERAL MANAGER','UBIS - EXECUTIVE GENERAL MANAGER',
'PROCUREMENT - STAFF PROCUREMENT','PROCUREMENT - MANAGER PROCUREMENT',
'DIRECTOR',
'CANCEL',
'REPAIR AREA - REVIEWER','REPAIR AREA - MANAGER AREA','REPAIR AREA - GENERAL MANAGER AREA',
'REPAIR UBIS - MANAGER','REPAIR UBIS - GENERAL MANAGER','REPAIR UBIS - EXECUTIVE GENERAL MANAGER',
'REPAIR PROCUREMENT - STAFF PROCUREMENT','REPAIR PROCUREMENT - MANAGER PROCUREMENT',
'FINISH'




JABATAN USER

'OFFICER PSC','GENERAL MANAGER AREA','PROJECT MANAGER AREA','MANAGER AREA','MANAGER UBIS','GENERAL MANAGER UBIS','OFFICER PROCUREMENT','EXECUTIVE GENERAL MANAGER UBIS','STAFF PROCUREMENT','MANAGER PROCUREMENT','DIRECTOR','ADMINISTRATOR'




'GENERAL MANAGER AREA','PROJECT MANAGER AREA','MANAGER AREA',



view scheduller


CREATE VIEW vscheduller AS
SELECT id,projectid,area,status,updated_at,DATEDIFF(NOW(),updated_at) AS jmlhari FROM project where status NOT IN ('NEW','FINISH','CANCEL')





view project pr
CREATE VIEW vprojectpr AS
SELECT            a.*
FROM              vprojectimplementation a
LEFT JOIN nomor_pr_po b ON a.id=b.project_id
WHERE             a.status='FINISH' AND b.project_id IS NULL






view ubis logic

select 
`mitratel_db`.`project`.`id` AS `id`,
`mitratel_db`.`project`.`projectid` AS `projectid`,
`mitratel_db`.`project`.`sitename` AS `sitename`,
`mitratel_db`.`project`.`projectdescription` AS `projectdescription`,
`mitratel_db`.`project`.`area` AS `area`,
`mitratel_db`.`project`.`regional` AS `regional`,
`mitratel_db`.`project`.`tenantid` AS `tenantid`,
`mitratel_db`.`project`.`tower` AS `tower`,
`mitratel_db`.`project`.`projectprice` AS `projectprice`,
`mitratel_db`.`project`.`status_id` AS `status_id`,
`mitratel_db`.`project`.`filename` AS `filename`,
`mitratel_db`.`project`.`status` AS `status`,
`mitratel_db`.`project`.`created_at` AS `created_at`,
`mitratel_db`.`project`.`updated_at` AS `updated_at`,
`mitratel_db`.`tenants`.`name` AS `name`,
(select sum(`vprojectimplementation`.`total`) from `mitratel_db`.`vprojectimplementation` where (((`vprojectimplementation`.`project_id` = `mitratel_db`.`project`.`id`) and (`vprojectimplementation`.`status` = 'standart')) or (`vprojectimplementation`.`status` = 'additional'))) AS `biayaplus`,
(select sum(`vprojectimplementation`.`total`) from `mitratel_db`.`vprojectimplementation` where ((`vprojectimplementation`.`project_id` = `mitratel_db`.`project`.`id`) and (`vprojectimplementation`.`status` = 'reduction'))) AS `biayaminus` from (`mitratel_db`.`project` join `mitratel_db`.`tenants` on((`mitratel_db`.`project`.`tenantid` = `mitratel_db`.`tenants`.`tenantid`)))


CREATE VIEW vprojectall AS
SELECT 
id,projectid,no_doc,proc,ubis,sitename,siteid,
area,regional,cluster,mitra,
kode_tower_depan,tower,kode_tower_belakang,
CASE WHEN infratype = 'UNTAPPED' 
THEN 
CONCAT('GM ',tower,' M')
ELSE 
CONCAT(kode_tower_depan,' ',tower,' ',kode_tower_belakang) 
END 
AS tinggitower,
longitude,latituted,infratype,towerprovider,
provinsi,kabupaten,budget,sis,sitac,
imb,imb_lahan,qty_lahan,lahan,cme,pln,addtransport,
addpln,addcme,biayatower,status_id,filename,status,created_at,updated_at
FROM 
project 


view project project final   -   DownloadExcel
  CREATE VIEW DownloadExcel AS
  SELECT 
    project.id,project.proc,project.ubis,project.no_doc,project.projectid,
    project.sitename,project.siteid,project.area,project.regional,
    project.cluster,project.mitra,project.kode_tower_depan,
    project.tower,project.kode_tower_belakang,
    CASE WHEN infratype = 'UNTAPPED' 
    THEN 
    CONCAT('GM ',project_implementation.towerimplementation,' M')
    ELSE 
    CONCAT(project.kode_tower_depan,' ',project_implementation.towerimplementation,' ',project.kode_tower_belakang) 
    END 
    AS tinggitower,
    project.budget,project.sis,project.sitac,project.imb,project.imb_jasa,
    project.qty_lahan,project.lahan,project.biayatower,
    project.cme,project.pln,project.addtransport,project.addpln,
    project.addcme,project.longitude,project.latituted,project.infratype,
    project.towerprovider,project.provinsi,project.kabupaten,
    project.status_id,project.filename,project.status,
    project_implementation.id as projectimplementationid,
    project_implementation.towerimplementation,
    project_implementation.clusterimplementation,
    project_implementation.mitra as mitraimplementation,

	CASE WHEN infratype = 'UNTAPPED' 
    THEN 
    IFNULL(biayatower,0)
    ELSE 
    IFNULL((select (tonase*biayatower) as hasil from project_implementation_standard where project_implementation_standard.project_implementation_id=projectimplementationid),0)
    END 
    AS biayatowercetak,
    

	
		CASE WHEN infratype = 'UNTAPPED' 
    THEN 
    IFNULL(cme,0)
    ELSE 
    IFNULL((select (erection_tower+transportasi+(pondasi * pondasi_greenfiled) +bts_outdoor+me+fy) as hasil from project_implementation_standard where project_implementation_standard.project_implementation_id=projectimplementationid),0)
    END 
    AS cmecetak,
	
		CASE WHEN infratype = 'UNTAPPED' 
    THEN 
    IFNULL(pln,0)
    ELSE 
    IFNULL((select pln_connect from project_implementation_standard where project_implementation_standard.project_implementation_id=projectimplementationid),0)
    END 
    AS plncetak,
	
	
CASE WHEN infratype = 'UNTAPPED' 
    THEN 
    IFNULL(addpln+addcme+addtransport,0)
    ELSE 
    IFNULL((select sum(vprojectimplementationadditional.total) from vprojectimplementationadditional where vprojectimplementationadditional.project_implementation_id=projectimplementationid),0)
    END 
    AS biayaadditional,
	
    (IFNULL((select vprojectimplementationstandard.total from vprojectimplementationstandard where vprojectimplementationstandard.project_implementation_id=projectimplementationid),0)+IFNULL((select sum(vprojectimplementationadditional.total) from vprojectimplementationadditional where vprojectimplementationadditional.project_implementation_id=projectimplementationid),0)+IFNULL(project.sis,0)+IFNULL(project.sitac,0)+IFNULL(project.imb,0)+IFNULL(project.imb_jasa,0)+IFNULL((project.qty_lahan*project.lahan),0)+IFNULL(project.biayatower,0)+IFNULL(project.cme,0)+IFNULL(project.pln,0)+IFNULL(project.addtransport,0)+IFNULL(project.addpln,0)+IFNULL(project.addcme,0)) AS capex,


    project.created_at,project.updated_at

    
    FROM project join project_implementation on project.id=project_implementation.project_id 
  
  
  
  view project implementation new  -   vprojectimplementationnew


    CREATE VIEW vprojectimplementationnew AS
	
	SELECT 
    project.id,project.proc,project.ubis,project.no_doc,project.projectid,
    project.sitename,project.siteid,project.area,project.regional,
    project.cluster,project.mitra,project.kode_tower_depan,
    project.tower,project.kode_tower_belakang,
    project.budget,project.sis,project.sitac,project.imb,project.imb_jasa,
    project.qty_lahan,project.lahan,project.biayatower,
    project.cme,project.pln,project.addtransport,project.addpln,
    project.addcme,project.longitude,project.latituted,project.infratype,
    project.towerprovider,project.provinsi,project.kabupaten,
    project.status_id,project.filename,project.status,
project.regional as regionalnya, project.cluster as clusternya , project.tower as towernya,
    
	CASE WHEN infratype = 'UNTAPPED' 
    THEN 
   (IFNULL(project.sis,0)+IFNULL(project.sitac,0)+IFNULL(project.imb,0)+IFNULL(project.imb_jasa,0)+IFNULL((project.qty_lahan*project.lahan),0)+IFNULL(project.biayatower,0)+IFNULL(project.cme,0)+IFNULL(project.pln,0)+IFNULL(project.addtransport,0)+IFNULL(project.addpln,0)+IFNULL(project.addcme,0))
    ELSE 
    (IFNULL((select total from vprojectimplementationstandardnew where regional=regionalnya AND cluster=clusternya AND tower=towernya),0)+IFNULL(project.sis,0)+IFNULL(project.sitac,0)+IFNULL(project.imb,0)+IFNULL(project.imb_jasa,0)+IFNULL((project.qty_lahan*project.lahan),0)+IFNULL(project.biayatower,0)+IFNULL(project.cme,0)+IFNULL(project.pln,0)+IFNULL(project.addtransport,0)+IFNULL(project.addpln,0)+IFNULL(project.addcme,0)) 
    END 
	AS capex,


    project.created_at,project.updated_at

    
    FROM project where project.status='NEW'
	
	
	
	
	
	view project implementation standard new  -   vprojectimplementationstandardnew

CREATE VIEW vprojectimplementationstandardnew AS
SELECT id, regional,cluster,tower,tonase,pondasi,biayatower,erection_tower,
transportasi,pondasi_greenfiled,bts_outdoor,me,fy,pln_connect,
((tonase * biayatower)+(pondasi_greenfiled*pondasi)+erection_tower+transportasi+bts_outdoor+me+fy+pln_connect) AS total,
created_at
FROM standartimplementation


view project implementation   -   vprojectimplementation


    CREATE VIEW vprojectimplementation AS
	SELECT 
    project.id,project.proc,project.ubis,project.no_doc,project.projectid,
    project.sitename,project.siteid,project.area,project.regional,
    project.cluster,project.mitra,project.kode_tower_depan,
    project.tower,project.kode_tower_belakang,
    CASE WHEN infratype = 'UNTAPPED' 
    THEN 
    CONCAT('GM ',project_implementation.towerimplementation,' M')
    ELSE 
    CONCAT(project.kode_tower_depan,' ',project_implementation.towerimplementation,' ',project.kode_tower_belakang) 
    END 
    AS tinggitower,
    project.budget,project.sis,project.sitac,project.imb,project.imb_jasa,
    project.qty_lahan,project.lahan,project.biayatower,
    project.cme,project.pln,project.addtransport,project.addpln,
    project.addcme,project.longitude,project.latituted,project.infratype,
    project.towerprovider,project.provinsi,project.kabupaten,
    project.status_id,project.filename,project.status,
    project_implementation.id as projectimplementationid,
    project_implementation.towerimplementation,
    project_implementation.clusterimplementation,
    project_implementation.mitra as mitraimplementation,

    IFNULL ((select vprojectimplementationstandard.total from vprojectimplementationstandard where vprojectimplementationstandard.project_implementation_id=projectimplementationid),0) AS biayastandard,


    IFNULL((select sum(vprojectimplementationadditional.total) from vprojectimplementationadditional where vprojectimplementationadditional.project_implementation_id=projectimplementationid),0) AS biayaadditional,

    (IFNULL((select vprojectimplementationstandard.total from vprojectimplementationstandard where vprojectimplementationstandard.project_implementation_id=projectimplementationid),0)+IFNULL((select sum(vprojectimplementationadditional.total) from vprojectimplementationadditional where vprojectimplementationadditional.project_implementation_id=projectimplementationid),0)+IFNULL(project.sis,0)+IFNULL(project.sitac,0)+IFNULL(project.imb,0)+IFNULL(project.imb_jasa,0)+IFNULL((project.qty_lahan*project.lahan),0)+IFNULL(project.biayatower,0)+IFNULL(project.cme,0)+IFNULL(project.pln,0)+IFNULL(project.addtransport,0)+IFNULL(project.addpln,0)+IFNULL(project.addcme,0)) AS capex,
	
	(IFNULL(project.sis,0)+IFNULL(project.sitac,0)+IFNULL(project.imb,0)+IFNULL(project.imb_jasa,0)+IFNULL((project.qty_lahan*project.lahan),0)+IFNULL(project.biayatower,0)+IFNULL(project.cme,0)+IFNULL(project.pln,0)+IFNULL(project.addtransport,0)+IFNULL(project.addpln,0)+IFNULL(project.addcme,0)) 
    AS capexuntapped,
	
	CASE WHEN status = 'NEW' AND infratype='B2S'
    THEN 
    project.budget
    ELSE 
    (IFNULL((select vprojectimplementationstandard.total from vprojectimplementationstandard where vprojectimplementationstandard.project_implementation_id=projectimplementationid),0)+IFNULL((select sum(vprojectimplementationadditional.total) from vprojectimplementationadditional where vprojectimplementationadditional.project_implementation_id=projectimplementationid),0)+IFNULL(project.sis,0)+IFNULL(project.sitac,0)+IFNULL(project.imb,0)+IFNULL(project.imb_jasa,0)+IFNULL((project.qty_lahan*project.lahan),0)+IFNULL(project.biayatower,0)+IFNULL(project.cme,0)+IFNULL(project.pln,0)+IFNULL(project.addtransport,0)+IFNULL(project.addpln,0)+IFNULL(project.addcme,0)) 
    END 
	 AS capexb2s,

    project.created_at,project.updated_at

    
    FROM project left join project_implementation on project.id=project_implementation.project_id 


    
view project implementation finish   -   vprojectimplementationfinish


    CREATE VIEW vprojectimplementationfinish AS
	SELECT 
    project.id,project.proc,project.ubis,project.no_doc,project.projectid,
    project.sitename,project.siteid,project.area,project.regional,
    project.cluster,project.mitra,project.kode_tower_depan,
    project.tower,project.kode_tower_belakang,
    CASE WHEN infratype = 'UNTAPPED' 
    THEN 
    CONCAT('GM ',project_implementation.towerimplementation,' M')
    ELSE 
    CONCAT(project.kode_tower_depan,' ',project_implementation.towerimplementation,' ',project.kode_tower_belakang) 
    END 
    AS tinggitower,
    project.budget,project.sis,project.sitac,project.imb,project.imb_jasa,
    project.qty_lahan,project.lahan,project.biayatower,
    project.cme,project.pln,project.addtransport,project.addpln,
    project.addcme,project.longitude,project.latituted,project.infratype,
    project.towerprovider,project.provinsi,project.kabupaten,
    project.status_id,project.filename,project.status,
    project_implementation.id as projectimplementationid,
    project_implementation.towerimplementation,
    project_implementation.clusterimplementation,
    project_implementation.mitra as mitraimplementation,

    IFNULL ((select vprojectimplementationstandard.total from vprojectimplementationstandard where vprojectimplementationstandard.project_implementation_id=projectimplementationid),0) AS biayastandard,


    IFNULL((select sum(vprojectimplementationadditional.total) from vprojectimplementationadditional where vprojectimplementationadditional.project_implementation_id=projectimplementationid),0) AS biayaadditional,

    (IFNULL((select vprojectimplementationstandard.total from vprojectimplementationstandard where vprojectimplementationstandard.project_implementation_id=projectimplementationid),0)+IFNULL((select sum(vprojectimplementationadditional.total) from vprojectimplementationadditional where vprojectimplementationadditional.project_implementation_id=projectimplementationid),0)+IFNULL(project.sis,0)+IFNULL(project.sitac,0)+IFNULL(project.imb,0)+IFNULL(project.imb_jasa,0)+IFNULL((project.qty_lahan*project.lahan),0)+IFNULL(project.biayatower,0)+IFNULL(project.cme,0)+IFNULL(project.pln,0)+IFNULL(project.addtransport,0)+IFNULL(project.addpln,0)+IFNULL(project.addcme,0)) AS capex,


    project.created_at,project.updated_at

    
    FROM project join project_implementation on project.id=project_implementation.project_id 
	where project.status='FINISH'


    



CREATE VIEW `vnotificationsuser` AS select `notification`.`id` AS `notificationid`,`notification`.`users_id` AS `users_id`,`notification`.`status` AS `notificationstatus`,`project`.`id` AS `projectid`,`notification`.`message` AS `pesannya`,`notification`.`created_at` AS `created_at` from (`notification` join `project` on((`notification`.`project_id` = `project`.`id`)))






view project implementation additional   -   vprojectimplementationadditional

CREATE VIEW vprojectimplementationadditional AS
SELECT id, project_implementation_id,pekerjaan,satuan,qty,harga,
(qty *harga) AS total,
created_at
FROM project_implementation_addtional





view project implementation standard   -   vprojectimplementationstandard

CREATE VIEW vprojectimplementationstandard AS
SELECT id, project_implementation_id,tonase,pondasi,biayatower,erection_tower,
transportasi,pondasi_greenfiled,bts_outdoor,me,fy,pln_connect,
((tonase * biayatower)+(pondasi_greenfiled*pondasi)+erection_tower+transportasi+bts_outdoor+me+fy+pln_connect) AS total,
created_at
FROM project_implementation_standard



CREATE VIEW vprojectstatus AS
SELECT project_status.project_id,project_status.status,users.name,users.id,users.email,users.level,project_status.created_at
FROM project_status
join users
on project_status.user_id=users.id
WHERE project_status.id IN (
SELECT MAX(project_status.id)
FROM project_status
join users
on project_status.user_id=users.id
GROUP BY project_status.project_id,project_status.user_id,project_status.status
)



CREATE VIEW vprojectpo AS
SELECT project.id,nomor_pr_po.po, project.projectid,project.infratype,project.area,project.regional,nomor_pr_po.created_at,nomor_pr_po.updated_at
FROM nomor_pr_po 
JOIN project ON nomor_pr_po.project_id=project.id
GROUP BY project.id
HAVING po=''



view nodoc  -   vnodoc

CREATE VIEW vnodoc AS
SELECT COUNT(*) as nodoc FROM project WHERE no_doc is NOT null



CREATE VIEW vtotalprojecttahunan AS
SELECT project.infratype,count(project.infratype) as ordernya, YEAR(created_at) as tahun
FROM project
group by 
infratype, YEAR(created_at)


CREATE VIEW vtotalproject AS
SELECT project.infratype,count(project.infratype) as ordernya
FROM project
group by 
infratype

CREATE VIEW vtotalprojectfinishtahunan AS
select infratype,count(status) as fin from project where status ='FINISH' group by infratype,YEAR(created_at)

CREATE VIEW vtotalprojectfinish AS
select infratype,count(status) as fin from project where status ='FINISH' group by infratype

CREATE VIEW vtotalprojectcanceltahunan AS
select infratype,count(status) as canc from project where status ='CANCEL' group by infratype,YEAR(created_at)

CREATE VIEW vtotalprojectcancel AS
select infratype,count(status) as canc from project where status ='CANCEL' group by infratype


CREATE VIEW vtotalprojectprosestahunan AS
select infratype,count(status) as prog from project where status not in ('NEW','CANCEL','FINISH') group by infratype,YEAR(created_at)


CREATE VIEW vtotalprojectproses AS
select infratype,count(status) as prog from project where status not in ('NEW','CANCEL','FINISH') group by infratype


CREATE VIEW vtotalprojectnya AS
select vtotalproject.infratype,
IFNULL(vtotalproject.ordernya,0)as ordernya, 
IFNULL(vtotalprojectfinish.fin,0) as fin, 
IFNULL(vtotalprojectproses.prog,0) as prog, 
IFNULL(vtotalprojectcancel.canc,0) as canc
from vtotalproject LEFT JOIN vtotalprojectfinish
on vtotalproject.infratype=vtotalprojectfinish.infratype
LEFT JOIN vtotalprojectproses
on vtotalprojectproses.infratype=vtotalproject.infratype
LEFT JOIN vtotalprojectcancel
on vtotalprojectcancel.infratype=vtotalproject.infratype

CREATE VIEW vtotalprojectnyatahunan AS
select vtotalprojecttahunan.infratype,vtotalprojecttahunan.tahun,
IFNULL(vtotalprojecttahunan.ordernya,0)as ordernya, 
IFNULL(vtotalprojectfinishtahunan.fin,0) as fin, 
IFNULL(vtotalprojectprosestahunan.prog,0) as prog, 
IFNULL(vtotalprojectcanceltahunan.canc,0) as canc
from vtotalprojecttahunan LEFT JOIN vtotalprojectfinishtahunan
on vtotalprojecttahunan.infratype=vtotalprojectfinishtahunan.infratype
LEFT JOIN vtotalprojectprosestahunan
on vtotalprojectprosestahunan.infratype=vtotalprojecttahunan.infratype
LEFT JOIN vtotalprojectcanceltahunan
on vtotalprojectcanceltahunan.infratype=vtotalprojecttahunan.infratype


view vgrafik  -   vgrafik

CREATE VIEW vgrafik AS
SELECT DATE_FORMAT(created_at, "%Y") as tahun,DATE_FORMAT(created_at, "%M") as bulan,count(*) as jumlah,status FROM project GROUP BY YEAR(created_at), month(created_at), status






view vdistinsstandartimplementationtower  -   vdistinsstandartimplementationtower

CREATE VIEW vdistinsstandartimplementationtower AS
SELECT DISTINCT regional,tower
FROM vstandartimplementation


view vdistinsstandartimplementationcluster  -   vdistinsstandartimplementationcluster

CREATE VIEW vdistinsstandartimplementationcluster AS
SELECT DISTINCT regional,cluster
FROM vstandartimplementation


CREATE VIEW vstandartimplementation AS
SELECT id,regional,cluster,tower, tonase,pondasi,biayatower,erection_tower,transportasi,pondasi_greenfiled,bts_outdoor,me,fy,pln_connect,created_at
FROM standartimplementation






CREATE VIEW vavgprojecregionaltutp AS
SELECT regional,infratype,avg(budget) as budget,avg(capexuntapped) as capex,YEAR(created_at) as tahun, count(*) as jumlah
FROM vprojectimplementation
where infratype='UNTAPPED' 
GROUP by regional,infratype,YEAR(created_at)


CREATE VIEW vavgprojectregionalb2s AS
SELECT regional,infratype,avg(budget) as budget,avg(capexb2s) as capex,YEAR(created_at) as tahun, count(*) as jumlah
FROM vprojectimplementation
where infratype='B2S'
GROUP by regional,infratype,YEAR(created_at)


CREATE VIEW vavgprojecareatutp AS
SELECT area,infratype,avg(budget) as budget,avg(capexuntapped) as capex,YEAR(created_at) as tahun,count(*) as jumlah
FROM vprojectimplementation
where infratype='UNTAPPED'
GROUP by area,infratype,YEAR(created_at)

CREATE VIEW vavgprojectareab2s AS
SELECT area,infratype,avg(budget) as budget,avg(capexb2s) as capex,YEAR(created_at) as tahun,count(*) as jumlah
FROM vprojectimplementation
where infratype='B2S'
GROUP by area,infratype,YEAR(created_at)


CREATE VIEW vtahun AS
SELECT infratype,YEAR(created_at) as tahun
FROM project
GROUP by infratype,YEAR(created_at)



CREATE VIEW vplafon_capex_regional AS
SELECT infratype,regional, IFNULL(sum(budget),0) as budgetNya, 
CASE WHEN infratype='B2S'
THEN 
IFNULL(sum(capexb2s),0)
ELSE 
IFNULL(sum(capexuntapped),0)
END 
	 AS capexNya,
count(regional)as total
FROM vprojectimplementation
GROUP by infratype,regional



CREATE VIEW vplafon_capex_area AS
SELECT area,infratype, IFNULL(sum(budget),0) as budgetNya, 
CASE WHEN infratype='B2S'
THEN 
IFNULL(sum(capexb2s),0)
ELSE 
IFNULL(sum(capexuntapped),0)
END 
	 AS capexNya,
count(area) as total
FROM vprojectimplementation
GROUP by area,infratype



CREATE VIEW vplafon_capex_nasional AS
SELECT infratype, IFNULL(sum(budget),0) as budgetNya, 
CASE WHEN infratype='B2S'
THEN 
IFNULL(sum(capexb2s),0)
ELSE 
IFNULL(sum(capexuntapped),0)
END 
	 AS capexNya,
count(budget) as total
FROM vprojectimplementation
group by infratype



CREATE VIEW vplafon_capex_nasional_home AS
SELECT infratype, IFNULL(avg(budget),0) as budgetNya,
CASE WHEN infratype='B2S'
THEN 
IFNULL(avg(capexb2s),0)
ELSE
IFNULL(avg(capexuntapped),0)	
END 
	 AS capexNya 
FROM vprojectimplementation
group by infratype





CREATE VIEW vavgprojecnstutp AS
SELECT infratype,avg(budget) as budget,avg(capexuntapped) as capex,YEAR(created_at) as tahun, count(*) as jumlah
FROM vprojectimplementation
where infratype='UNTAPPED'
GROUP by infratype,YEAR(created_at)

CREATE VIEW vavgprojectnsb2s AS
SELECT infratype,avg(budget) as budget,avg(capexb2s) as capex,YEAR(created_at) as tahun, count(*) as jumlah
FROM vprojectimplementation
where infratype='B2S'
GROUP by infratype,YEAR(created_at)





CREATE VIEW vregional AS
SELECT DISTINCT regional
FROM project



CREATE VIEW varea AS
SELECT DISTINCT area
FROM project




CREATE VIEW vinfra AS
SELECT DISTINCT infratype
FROM project


	
	
	
	
	
	
	
	
	



