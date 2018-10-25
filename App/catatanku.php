perubahan 


karyawanController.php

public function GetNewProject(Request $request)
      if(Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
    {
            $query = DB::table('project')
 ->select('id', 'projectid','proc','ubis', 'sitename', 'siteid', 
 'area','regional', 'cluster','kode_tower_depan','tower','kode_tower_belakang', DB::raw('CONCAT(kode_tower_depan, " ", tower," ",kode_tower_belakang) AS tinggitower'), 
 'mitra','longitude','latituted','infratype','towerprovider', 'provinsi', 'kabupaten','budget','sis','sitac','imb','imb_jasa','lahan','biayatower','status',
 'created_at')
 ->where('status','NEW')
 ->orderBy('id','DESC');
    }





	   public function UpdateNewProject(Request $request,$id)
    
        'status' => 'required|in:NEW,CANCEL',

Project::where('id',$id)->update(['projectid'=>strtoupper(Input::get('projectid')),'mitra'=>strtoupper(Input::get('mitra')),'proc'=>strtoupper(Input::get('proc')),'ubis'=>strtoupper(Input::get('ubis')),'sitename'=>strtoupper(Input::get('sitename')),'siteid'=>strtoupper(Input::get('siteid')),'kabupaten'=>strtoupper(Input::get('kabupaten')),'provinsi'=>strtoupper(Input::get('provinsi')),'latituted'=>Input::get('latituted'),'longitude'=>Input::get('longitude'),'towerprovider'=>strtoupper(Input::get('towerprovider')),'infratype'=>strtoupper(Input::get('infratype')),'kode_tower_belakang'=>strtoupper(Input::get('kode_tower_belakang')),'kode_tower_depan'=>strtoupper(Input::get('kode_tower_depan')),'cluster'=>strtoupper(Input::get('cluster')),'area'=>strtoupper(Input::get('area')),'regional'=>strtoupper(Input::get('regional')),'tower'=>Input::get('tower'),'budget'=>Input::get('budget'),'sis'=>Input::get('sis'),'sitac'=>Input::get('sitac'),'imb'=>Input::get('imb'),'imb_jasa'=>Input::get('imb_jasa'),'lahan'=>Input::get('lahan'),'cme'=>Input::get('cme'),'pln'=>Input::get('pln'),'addcme'=>Input::get('addcme'),'addpln'=>Input::get('addpln'),'addtransport'=>Input::get('addtransport'),'biayatower'=>Input::get('biayatower'),'status_id'=>'0','status'=>Input::get('status')]);







	public function GetProjectDetailProses($id,$kode,$regional,$area)
    {
$cari = Project::where('id',$id)->firstOrFail();
if(!$cari)
{
	return response()->json('error', 500);
}	
else
{
	if($cari->infratype == 'UNTAPPED')
	{
		$standard = DB::table('vprojectimplementationstandard')->select('id','project_implementation_id','tonase','pondasi','biayatower','erection_tower','transportasi','pondasi_greenfiled','bts_outdoor','me','fy','pln_connect')->where('project_implementation_id',$kode)->first();

	$pesan = DB::table('vprojectstatus')
            ->select('status','created_at', 'name', 'level')
			->where([['project_id',$id],['status','APPROVED']])
            ->orderBy('created_at','ASC')
			->get();
  $additional = DB::table('vprojectimplementationadditional')->select('pekerjaan','satuan','qty','harga','total')->where('project_implementation_id',$kode)->orderBy('id','ASC')->get();
  $noprpo = Nopopr::where('project_id',$id)->orderBy('id','ASC')->get();
  $pesanlengkap = DB::table('project_status')
  ->join('users','project_status.user_id','=','users.id')
  ->select('project_status.status','project_status.message','project_status.created_at','users.name','users.level')
  ->where('project_status.project_id',$id)
  ->orderBy('project_status.id','ASC')->get();
  $levelnya = DB::table('project_status')
  ->join('users','project_status.user_id','=','users.id')
  ->select('users.level')
  ->where('project_status.project_id',$id)
  ->orderBy('project_status.id','desc')->first();
$vtower = DB::table('vdistinsstandartimplementationtower')->where('regional',$regional)->select('tower')->get();
$vcluster = DB::table('vdistinsstandartimplementationcluster')->where('regional',$regional)->select('cluster')->get();
$sregional = DB::table('vplafon_capex_regional')->where([['infratype',$cari->infratype],['regional',$regional]])->select('budgetNya','capexNya','total')->first();
if(count($sregional)>0){$sr=$sregional;}else{$sr=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
	$sarea = DB::table('vplafon_capex_area')->where([['infratype',$cari->infratype],['area',$area]])->select('budgetNya','capexNya','total')->first();
if(count($sarea)>0){$sa=$sarea;}else{$sa=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
$snasional = DB::table('vplafon_capex_nasional')->where('infratype',$cari->infratype)->select('budgetNya','capexNya','total')->first();
if(count($snasional)>0){$sn=$snasional;}else{$sn=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
$simulasi = ['regional'=>$sr,'area'=>$sa,'nasional'=>$sn];
return response()->json(['standard'=>$standard,'additional'=>$additional,'pesan'=>$pesan,'pesanlengkap'=>$pesanlengkap,'levelnya'=>$levelnya->level,'vtower'=>$vtower,'vcluster'=>$vcluster,'simulasi'=>$simulasi,'noprpo'=>$noprpo]);
  
	}
	else
	{
$standard = DB::table('vprojectimplementationstandard')->select('id','project_implementation_id','tonase','pondasi','biayatower','erection_tower','transportasi','pondasi_greenfiled','bts_outdoor','me','fy','pln_connect')->where('project_implementation_id',$kode)->first();
if(empty($standard))
{
    $standardNya = ['id'=>0,'project_implementation_id'=>0,'tonase'=>0,'pondasi'=>0,'biayatower'=>0,'erection_tower'=>0,'transportasi'=>0,'pondasi_greenfiled'=>0,'bts_outdoor'=>0,'me'=>0,'fy'=>0,'pln_connect'=>0];
$pesan = DB::table('vprojectstatus')
            ->select('status','created_at', 'name', 'level')
            ->where([['project_id',$id],['status','APPROVED']])
            ->orderBy('created_at','ASC')
            ->get();
  $additional = DB::table('vprojectimplementationadditional')->select('pekerjaan','satuan','qty','harga','total')->where('project_implementation_id',$kode)->orderBy('id','ASC')->get();
  $noprpo = Nopopr::where('project_id',$id)->orderBy('id','ASC')->get();
  $pesanlengkap = DB::table('project_status')
  ->join('users','project_status.user_id','=','users.id')
  ->select('project_status.status','project_status.message','project_status.created_at','users.name','users.level')
  ->where('project_status.project_id',$id)
  ->orderBy('project_status.id','ASC')->get();
  $levelnya = DB::table('project_status')
  ->join('users','project_status.user_id','=','users.id')
  ->select('users.level')
  ->where('project_status.project_id',$id)
  ->orderBy('project_status.id','desc')->first();
  if(empty($levelnya))
  {
    $levelNya= "ADMINISTRATOR";
  }
  else
  {
    $levelNya= $levelnya->level;
  }
$vtower = DB::table('vdistinsstandartimplementationtower')->where('regional',$regional)->select('tower')->get();
$vcluster = DB::table('vdistinsstandartimplementationcluster')->where('regional',$regional)->select('cluster')->get();
$sregional = DB::table('vplafon_capex_regional')->where([['infratype',$cari->infratype],['regional',$regional]])->select('budgetNya','capexNya','total')->first();
if(count($sregional)>0){$sr=$sregional;}else{$sr=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
    $sarea = DB::table('vplafon_capex_area')->where([['infratype',$cari->infratype],['area',$area]])->select('budgetNya','capexNya','total')->first();
if(count($sarea)>0){$sa=$sarea;}else{$sa=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
$snasional = DB::table('vplafon_capex_nasional')->where('infratype',$cari->infratype)->select('budgetNya','capexNya','total')->first();
if(count($snasional)>0){$sn=$snasional;}else{$sn=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
$simulasi = ['regional'=>$sr,'area'=>$sa,'nasional'=>$sn];

    return response()->json(['standard'=>$standardNya,'additional'=>$additional,'pesan'=>$pesan,'pesanlengkap'=>$pesanlengkap,'levelnya'=>$levelNya,'vtower'=>$vtower,'vcluster'=>$vcluster,'simulasi'=>$simulasi,'noprpo'=>$noprpo]);
}
else
{ 
	$pesan = DB::table('vprojectstatus')
            ->select('status','created_at', 'name', 'level')
			->where([['project_id',$id],['status','APPROVED']])
            ->orderBy('created_at','ASC')
			->get();
  $additional = DB::table('vprojectimplementationadditional')->select('pekerjaan','satuan','qty','harga','total')->where('project_implementation_id',$kode)->orderBy('id','ASC')->get();
  $noprpo = Nopopr::where('project_id',$id)->orderBy('id','ASC')->get();
  $pesanlengkap = DB::table('project_status')
  ->join('users','project_status.user_id','=','users.id')
  ->select('project_status.status','project_status.message','project_status.created_at','users.name','users.level')
  ->where('project_status.project_id',$id)
  ->orderBy('project_status.id','ASC')->get();
  $levelnya = DB::table('project_status')
  ->join('users','project_status.user_id','=','users.id')
  ->select('users.level')
  ->where('project_status.project_id',$id)
  ->orderBy('project_status.id','desc')->first();
$vtower = DB::table('vdistinsstandartimplementationtower')->where('regional',$regional)->select('tower')->get();
$vcluster = DB::table('vdistinsstandartimplementationcluster')->where('regional',$regional)->select('cluster')->get();
$sregional = DB::table('vplafon_capex_regional')->where([['infratype',$cari->infratype],['regional',$regional]])->select('budgetNya','capexNya','total')->first();
if(count($sregional)>0){$sr=$sregional;}else{$sr=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
	$sarea = DB::table('vplafon_capex_area')->where([['infratype',$cari->infratype],['area',$area]])->select('budgetNya','capexNya','total')->first();
if(count($sarea)>0){$sa=$sarea;}else{$sa=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
$snasional = DB::table('vplafon_capex_nasional')->where('infratype',$cari->infratype)->select('budgetNya','capexNya','total')->first();
if(count($snasional)>0){$sn=$snasional;}else{$sn=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
$simulasi = ['regional'=>$sr,'area'=>$sa,'nasional'=>$sn];
return response()->json(['standard'=>$standard,'additional'=>$additional,'pesan'=>$pesan,'pesanlengkap'=>$pesanlengkap,'levelnya'=>$levelnya->level,'vtower'=>$vtower,'vcluster'=>$vcluster,'simulasi'=>$simulasi,'noprpo'=>$noprpo]);
}
}
}      
    }









    public function ApprovalProjectRevisi(Request $request)
    {
		$valid = $this->validate($request, [
		 'id' => 'required|numeric|not_in:0', 
		 'projectid' => 'required|max:200',
         'status' => 'required',
         'budget' => 'required|numeric',
         'proc' => 'required|max:200',
         'ubis' => 'required|max:200',
         'sitename' => 'required|max:200',
         'siteid' => 'required|max:200',
         'area' => 'required|max:200',
         'regional' => 'required|max:200',
         'cluster' => 'required|max:200',
         'mitra' => 'required|max:200',
         'kode_tower_depan' => 'required|max:200',
         'tower' => 'required|numeric',
         'kode_tower_belakang' => 'required|max:200',
         'towerprovider' => 'required|max:200',
         'provinsi' => 'required',
         'kabupaten' => 'required',
         'longitude' => 'required',
         'latituted' => 'required',
         'infratype' => 'required|in:UNTAPPED,B2S',
		 'sis' => 'required|numeric',
		 'sitac' => 'required|numeric',
		 'imb' => 'required|numeric',
		 'imb_jasa' => 'required|numeric',
         'lahan' => 'required|numeric',
         'qty_lahan' => 'required|numeric',
         'cme' => 'required|numeric',
         'pln' => 'required|numeric',
         'addtransport' => 'required|numeric',
         'addpln' => 'required|numeric',
         'addcme' => 'required|numeric',
         'biayatower' => 'required|numeric',
		 'message' => 'required',
    ]);
if (!$valid)
    {
if($request->get('status') == 'NEW')
{
        $create = ProjectStatus::create(['project_id'=>$request->get('id'),'user_id'=>Auth::guard('karyawan')->user()->id,'status'=>'APPROVED','message'=>$request->get('message')]); 
Project::where('id',$request->get('id'))->update(['status'=>$request->get('status'),'infratype'=>$request->get('infratype'),'latituted'=>$request->get('latituted'),'longitude'=>$request->get('longitude'),'kabupaten'=>$request->get('kabupaten'),'provinsi'=>$request->get('provinsi'),'towerprovider'=>$request->get('towerprovider'),'kode_tower_belakang'=>$request->get('kode_tower_belakang'),'tower'=>$request->get('tower'),'kode_tower_depan'=>$request->get('kode_tower_depan'),'mitra'=>$request->get('mitra'),'cluster'=>$request->get('cluster'),'regional'=>$request->get('regional'),'area'=>$request->get('area'),'siteid'=>$request->get('siteid'),'sitename'=>$request->get('sitename'),'ubis'=>$request->get('ubis'),'proc'=>$request->get('proc'),'budget'=>$request->get('budget'),'projectid'=>$request->get('projectid'),'imb'=>$request->get('imb'),'imb_jasa'=>$request->get('imb_jasa'),'sitac'=>$request->get('sitac'),'sis'=>$request->get('sis'),'lahan'=>$request->get('lahan'),'qty_lahan'=>$request->get('qty_lahan'),'cme'=>$request->get('cme'),'pln'=>$request->get('pln'),'addtransport'=>$request->get('addtransport'),'addpln'=>$request->get('addpln'),'addcme'=>$request->get('addcme'),'biayatower'=>$request->get('biayatower'),'status_id'=>$create->id,'updated_at'=>Carbon::now()]);
ProjectImplementations::where('project_implementation_id',$request->get('projectimplementationid'))->delete();
ProjectImplementationsAddtional::where('project_implementation_id',$request->get('projectimplementationid'))->delete();
ProjectImplementationsStandard::where('project_implementation_id',$request->get('projectimplementationid'))->delete();
return response()->json(['success'=>'Perubahan Data Berhasil']);    
}
else
 {
if($request->get('infratype') == 'UNTAPPED')		
{
    $create = ProjectStatus::create(['project_id'=>$request->get('id'),'user_id'=>Auth::guard('karyawan')->user()->id,'status'=>'APPROVED','message'=>$request->get('message')]); 
Project::where('id',$request->get('id'))->update(['status'=>$request->get('status'),'infratype'=>$request->get('infratype'),'latituted'=>$request->get('latituted'),'longitude'=>$request->get('longitude'),'kabupaten'=>$request->get('kabupaten'),'provinsi'=>$request->get('provinsi'),'towerprovider'=>$request->get('towerprovider'),'kode_tower_belakang'=>$request->get('kode_tower_belakang'),'tower'=>$request->get('tower'),'kode_tower_depan'=>$request->get('kode_tower_depan'),'mitra'=>$request->get('mitra'),'cluster'=>$request->get('cluster'),'regional'=>$request->get('regional'),'area'=>$request->get('area'),'siteid'=>$request->get('siteid'),'sitename'=>$request->get('sitename'),'ubis'=>$request->get('ubis'),'proc'=>$request->get('proc'),'budget'=>$request->get('budget'),'projectid'=>$request->get('projectid'),'imb'=>$request->get('imb'),'imb_jasa'=>$request->get('imb_jasa'),'sitac'=>$request->get('sitac'),'sis'=>$request->get('sis'),'lahan'=>$request->get('lahan'),'qty_lahan'=>$request->get('qty_lahan'),'cme'=>$request->get('cme'),'pln'=>$request->get('pln'),'addtransport'=>$request->get('addtransport'),'addpln'=>$request->get('addpln'),'addcme'=>$request->get('addcme'),'biayatower'=>$request->get('biayatower'),'status_id'=>$create->id,'updated_at'=>Carbon::now()]);
ProjectImplementations::where('id',$request->get('projectimplementationid'))->update(['towerimplementation'=>$request->get('tower'),'clusterimplementation'=>$request->get('cluster'),'mitra'=>$request->get('mitra')]);
ProjectImplementationsAddtional::where('project_implementation_id',$request->get('projectimplementationid'))->delete();
ProjectImplementationsStandard::where('project_implementation_id',$request->get('projectimplementationid'))->delete();
return response()->json(['success'=>'Perubahan Data Berhasil']);	
}
else
{
	
	$standard =  Input::get('standard');
	$addtional =  Input::get('addtional');
	$projectimplementationid = $request->get('projectimplementationid');
$dataSet = [];
$dataSet2 = [];
$dataSet4 = [];
    $create = ProjectStatus::create(['project_id'=>$request->get('id'),'user_id'=>Auth::guard('karyawan')->user()->id,'status'=>'APPROVED','message'=>$request->get('message')]); 	
ProjectImplementationsAddtional::where('project_implementation_id',$projectimplementationid)->delete();
ProjectImplementationsStandard::where('project_implementation_id',$projectimplementationid)->delete();
if(count($addtional) > 0)
{
	foreach ($addtional as $key =>$ss) {
$dataSet2[] = ['project_implementation_id'=>$projectimplementationid,'pekerjaan'=>strtoupper($ss['pekerjaan']),'satuan'=>strtoupper($ss['satuan']),'qty'=>$ss['qty'],'harga'=>$ss['harga'],'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
 }			 
ProjectImplementationsAddtional::insert($dataSet2); // Eloquent approach
 
}


ProjectImplementationsStandard::insert(['project_implementation_id'=>$projectimplementationid,'tonase'=>$standard['tonase'],'pondasi'=>$standard['pondasi'],'biayatower'=>$standard['biayatower'],'erection_tower'=>$standard['erection_tower'],'transportasi'=>$standard['transportasi'],'pondasi_greenfiled'=>$standard['pondasi_greenfiled'],'bts_outdoor'=>$standard['bts_outdoor'],'me'=>$standard['me'],'fy'=>$standard['fy'],'pln_connect'=>$standard['pln_connect'],'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()]); // Eloquent approach

Project::where('id',$request->get('id'))->update(['status'=>$request->get('status'),'infratype'=>$request->get('infratype'),'latituted'=>$request->get('latituted'),'longitude'=>$request->get('longitude'),'kabupaten'=>$request->get('kabupaten'),'provinsi'=>$request->get('provinsi'),'towerprovider'=>$request->get('towerprovider'),'kode_tower_belakang'=>$request->get('kode_tower_belakang'),'tower'=>$request->get('tower'),'kode_tower_depan'=>$request->get('kode_tower_depan'),'mitra'=>$request->get('mitra'),'cluster'=>$request->get('cluster'),'regional'=>$request->get('regional'),'area'=>$request->get('area'),'siteid'=>$request->get('siteid'),'sitename'=>$request->get('sitename'),'ubis'=>$request->get('ubis'),'proc'=>$request->get('proc'),'budget'=>$request->get('budget'),'projectid'=>$request->get('projectid'),'imb'=>$request->get('imb'),'imb_jasa'=>$request->get('imb_jasa'),'sitac'=>$request->get('sitac'),'sis'=>$request->get('sis'),'lahan'=>$request->get('lahan'),'qty_lahan'=>$request->get('qty_lahan'),'cme'=>0,'pln'=>0,'addtransport'=>0,'addpln'=>0,'addcme'=>0,'biayatower'=>0,'status_id'=>$create->id,'updated_at'=>Carbon::now()]);
ProjectImplementations::where('id',$request->get('projectimplementationid'))->update(['towerimplementation'=>$request->get('tower'),'clusterimplementation'=>$request->get('cluster'),'mitra'=>$request->get('mitra')]);
return response()->json(['success'=>'Perubahan Data Berhasil']);
	
}		
	}	
    }
else
    {
 return response()->json('error', $valid);
    }
    }





















 