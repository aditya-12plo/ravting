<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Notifications\Notifiable;
use Response,View,Input,Auth,Session,Validator,File,Hash,DB,Excel,Mail;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Validation\Rule;
use PDF;
use Carbon\Carbon;
use App\Http\Requests\ErrorFormUploadTenant;
use App\Models\StandartimplementationTower;
use App\Models\Standartimplementation;
use App\Models\ProjectImplementationsAddtional;
use App\Models\ProjectImplementationsStandard;
use App\Models\ProjectImplementations;
use App\Models\Tenant;
use App\Models\User;
use App\Models\ProjectStatus;
use App\Models\Pemberitahuan;
use App\Models\Project;
use App\Models\Nopopr;
use App\Models\Pesan;
use App\Models\Log;

class KaryawanController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('karyawan.auth');
		$this->data['title']  = 'Selamat Datang';
		$this->data['tahunprojectb2s']  = DB::table('vtahun')->where('infratype','B2S')->get();
		$this->data['tahunprojectuntp']  = DB::table('vtahun')->where('infratype','UNTAPPED')->get();
    }

    
    public function index()
    {
		 //$this->data['ttlpesan']  = Pemberitahuan::where([['users_id',Auth::guard('karyawan')->user()->id],['status','0']])->count();
        return view('Karyawan.templates.home')->with($this->data);
    }


/* home */







/* send notif android */
public function SendingNotif ($projectID, $isApprove, $sendTo, $area){
	$idUser = Auth::guard('karyawan')->user()->id ;
        $getProject = DB::table('project')->where('id','=',$projectID)->get()[0];
        $getSender    = DB::table('users')->where('id','=',$idUser)->get()[0];

        if (strtoupper($sendTo) == "ALL"){
            $getReceiver = DB::table('project_status')->select('users.id', 'users.email')
                            ->join('users','users.id','=','project_status.user_id')
                            ->where('project_status.project_id','=',$projectID)
                            ->groupBy('project_status.user_id')->get();

        }else{
            $getReceiver = DB::table('users')->select('id','email')
                        ->where('level','=',$sendTo)
                        ->where(function($filter)use($sendTo,$area){
                            if (strpos(strtoupper($sendTo), "AREA") || strtoupper($sendTo) == "STAFF PROCUREMENT"){
                                $filter->where('area','=',$area);
                            }else if (strtoupper($sendTo) == "MANAGER UBIS"){
                                $filter->where('area','=',$area)
                                        ->orWhere('area2','=',$area);
                            }
                        })->get();
        }


        $msg = "Project ID ".$getProject->projectid." Menunggu Approval.";
        $detail = "Telah Ada Proses ".(($isApprove)?"APPROVE":"REPAIR")." dari ".$getSender->name." (".$getSender->level.").";

        //push notification
        $arrIDS = array();
        $arrEmail = array();
        foreach ($getReceiver as $item) {
            DB::table('notification')
                ->insert([
                    "project_id"    => $projectID,
                    "sender_id"     => $getSender->id,
                    "users_id"      => $item->id,
                    "message"       => $msg,
                    "detail"        => $detail,
                    "status"        => 0,
                    "created_at"    => date('Y-m-d H:i:s'),
                    "updated_at"    => date('Y-m-d H:i:s')
                ]);

            array_push($arrEmail, $item->email);

            $getIDS = DB::table('user_session')->select('player_ids')
                        ->where('id_user','=',$item->id)
                        ->whereNotNull('player_ids')->get();

            $arrIDS = array();
            foreach ($getIDS as $item) {
                $ids = $item->player_ids;
                if (strlen($ids) > 10){
                    array_push($arrIDS, $ids);
                }
            }

            if (count($arrIDS) > 0){
                $content = array("en" => $msg);
                $fields = array(
                    'app_id' => env('APP_ID'),
                    // 'included_segments' => $arrIDS,
                    'include_player_ids' => $arrIDS,
                    'data' => array("foo" => "bar"),
                    'contents' => $content
                );
                
                $fields = json_encode($fields); 
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, env('URL_NOTIF'));
                curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8',
                                                           'Authorization: Basic '.env('PROJECT_ID')));
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
                curl_setopt($ch, CURLOPT_HEADER, FALSE);
                curl_setopt($ch, CURLOPT_POST, TRUE);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);

                curl_exec($ch);
                curl_close($ch);
            }
        }

    }
/* send notif android */


/* avg plafon */
public function avgUNTAPPED()
    {

$tableB2s = DB::table('vplafon_capex_nasional_home')->where('infratype','UNTAPPED')->select('budgetNya')->first();
return $tableB2s->budgetNya;
    }
public function avgB2S()
    {

$tableB2s = DB::table('vplafon_capex_nasional_home')->where('infratype','B2S')->select('budgetNya')->first();
return $tableB2s->budgetNya;
    }
/* avg plafon */



public function AreaProfile()
    {
if(Auth::guard('karyawan')->user()->level == 'MANAGER AREA' || Auth::guard('karyawan')->user()->level == 'GENERAL MANAGER AREA')
{
	$status = 'true';
}
else
{
	$status = 'false';
}
return response()->json(['status'=>$status,'area'=>Auth::guard('karyawan')->user()->area]);
    }

	
/* home */	
	
	
	
/* procurement */


	   public function GetProfileProcurementReviewerM()
    {
       if(Auth::guard('karyawan')->user()->level == 'MANAGER PROCUREMENT' || Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
         {
            return response()->json(true);
         }
         else
         {
            return response()->json('error',500);
         }
    }

     public function GetProfileProcurementReviewerOfficer()
    {
       if(Auth::guard('karyawan')->user()->level == 'OFFICER PROCUREMENT' || Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
         {
            return response()->json(true);
         }
         else
         {
            return response()->json('error',500);
         }
    }
  
	   public function GetProfileProcurementReviewer()
    {
       if(Auth::guard('karyawan')->user()->level == 'OFFICER PROCUREMENT' || Auth::guard('karyawan')->user()->level == 'MANAGER PROCUREMENT' || Auth::guard('karyawan')->user()->level == 'STAFF PROCUREMENT' || Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
         {
            return response()->json(true);
         }
         else
         {
            return response()->json('error',500);
         }
    }
	
 
       public function GetBiayaStandart(Request $request)
    {
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = Standartimplementation::select('id','regional','cluster','tower','tonase','pondasi','biayatower','erection_tower','transportasi','pondasi_greenfiled','bts_outdoor','me','fy','pln_connect','created_at')->orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('tower', 'LIKE', $like)
            ->orWhere('regional', 'LIKE', $like)
            ->orWhere('cluster', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('tower', 'LIKE', $like)
            ->orWhere('regional', 'LIKE', $like)
            ->orWhere('cluster', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('tower', 'LIKE', $like)
            ->orWhere('regional', 'LIKE', $like)
            ->orWhere('cluster', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('tower', 'LIKE', $like)
           ->orWhere('regional', 'LIKE', $like)
            ->orWhere('cluster', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
       public function GetBiayaStandartTower(Request $request)
    {
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = DB::table('vstandartimplementationtower')->select('id','regional','cluster','tower','qty','harga','satuan','jumlah','created_at')->orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('tower', 'LIKE', $like)
            ->orWhere('regional', 'LIKE', $like)
            ->orWhere('cluster', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('tower', 'LIKE', $like)
            ->orWhere('regional', 'LIKE', $like)
            ->orWhere('cluster', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('tower', 'LIKE', $like)
            ->orWhere('regional', 'LIKE', $like)
            ->orWhere('cluster', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('tower', 'LIKE', $like)
           ->orWhere('regional', 'LIKE', $like)
            ->orWhere('cluster', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
    public function uploadbiaya(Request $request)
    {
         $valid = $this->validate($request, [
        'file_name' => 'required|mimes:xlsx',
    ]);
         if(!$valid)
		 {
			$extension  = Input::file('file_name')->getClientOriginalExtension(); // getting image extension
if($extension == 'xlsx')
{

		   $x = 0;
			$path = $request->file('file_name')->getRealPath();
			$data = Excel::load($path, function($reader) {})->get();
			if(!empty($data) && $data->count()){

foreach ($data->toArray() as $key => $value) {
					if(!empty($value)){
foreach ($value as $key => $content) {						
$insert[] = ['regional' => strtoupper($content['regional']), 'cluster' => strtoupper($content['cluster']),'tower' => $content['tinggi_tower'], 'tonase' => $content['tonase'], 'pondasi' => $content['pondasi_m3'],'biayatower' => $content['tower'],  'erection_tower' => $content['erection_tower'],  'transportasi' => $content['transportasi'],   'pondasi_greenfiled' => $content['pondasi_greenfiled'],   'bts_outdoor' => $content['bts_outdoor'], 'me' => $content['me'],  'fy' => $content['f_y_10mx12m'],  'pln_connect' => $content['pln_connect_10.6'], 'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];		 	 
$rules[$key.'.regional'] = 'required|max:255';
$rules[$key.'.cluster'] = 'required|max:255';
$rules[$key.'.tower'] = 'required|numeric|not_in:0';
$rules[$key.'.tonase'] = 'required|numeric|not_in:0';
$rules[$key.'.pondasi'] = 'required|numeric|not_in:0';
$rules[$key.'.biayatower'] = 'required|numeric|not_in:0';
$rules[$key.'.erection_tower'] = 'required|numeric|not_in:0';
$rules[$key.'.transportasi'] = 'required|numeric|not_in:0';
$rules[$key.'.pondasi_greenfiled'] = 'required|numeric|not_in:0';
$rules[$key.'.bts_outdoor'] = 'required|numeric|not_in:0';
$rules[$key.'.me'] = 'required|numeric|not_in:0';
$rules[$key.'.fy'] = 'required|numeric|not_in:0';
$rules[$key.'.pln_connect'] = 'required|numeric|not_in:0';
		 }	
						}
					}
			
if(!empty($insert))
					{

$validator = Validator::make($insert, $rules);
if($validator->fails()) {
  return response()->json(['file_name'=>$validator->errors()]);
} else {
   $masuk = DB::table('standartimplementation')->insert($insert);
							if(!$masuk)
							{
								return response()->json(['file_name'=>'Terdapat Masalah Dalam Pemasukan Data, Silahkan Cek Kembali Record dalam file.']);
							}
							else{
								return response()->json(['success'=>'Data Berhasil Dimasukan Semua']);
							}
}
	
					}
					else
					{
						return response()->json(['file_name'=>'Tidak ada data yang dimasukan']);
					}					
					
			
					
				}
													
}
else
{
    return response()->json(['biaya'=>'File upload hanya berektensi .xlsx']);
}
         }
         else
         {
			return response()->json('error', $valid);
         }
    }
	
	
    public function uploadbiayatower(Request $request)
    {
         $valid = $this->validate($request, [
        'file_name' => 'required|mimes:xlsx',
    ]);
         if(!$valid)
		 {
			$extension  = Input::file('file_name')->getClientOriginalExtension(); // getting image extension
if($extension == 'xlsx')
{
		   $x = 0;
			$path = $request->file('file_name')->getRealPath();
			$data = Excel::load($path, function($reader) {})->get();
			if(!empty($data) && $data->count()){

foreach ($data->toArray() as $key => $value) {
					if(!empty($value)){
foreach ($value as $key => $content) {						
$insert[] = ['regional' => strtoupper($content['regional']), 'cluster' => strtoupper($content['cluster']),'tower' => $content['tower'],'satuan' => strtoupper($content['satuan']),'harga' => $content['harga'],  'qty' => $content['qty'], 'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];		 	 
$rules[$key.'.regional'] = 'required|max:255';
$rules[$key.'.cluster'] = 'required|max:255';
$rules[$key.'.tower'] = 'required|numeric|digits_between:1,10';
$rules[$key.'.satuan'] = 'required|max:20';
$rules[$key.'.harga'] = 'required|numeric';
$rules[$key.'.qty'] = 'required|numeric';
		 }	
						}
					}
			
if(!empty($insert))
					{

$validator = Validator::make($insert, $rules);
if($validator->fails()) {
  return response()->json(['file_name'=>$validator->errors()]);
} else {
   $masuk = DB::table('standartimplementation_tower')->insert($insert);
							if(!$masuk)
							{
								return response()->json(['file_name'=>'Terdapat Masalah Dalam Pemasukan Data, Silahkan Cek Kembali Record dalam file.']);
							}
							else{
								return response()->json(['success'=>'Data Berhasil Dimasukan Semua']);
							}
}
	
					}
					else
					{
						return response()->json(['file_name'=>'Tidak ada data yang dimasukan']);
					}					
					
			
					
				}
								
					
}
else
{
    return response()->json(['biaya'=>'File upload hanya berektensi .xlsx']);
}
         }
         else
         {
			return response()->json('error', $valid);
         }
    }
	
	
	
	
	  public function UpdateBiayaStandard(Request $request, $id)
    {
		
		$valid = $this->validate($request, [
        'regional' => 'required|max:200',
        'cluster' => 'required|max:200',
        'tower' => 'required|numeric|digits_between:1,10',
        'tonase' => 'required|numeric',
        'pondasi' => 'required|numeric',
        'biayatower' => 'required|numeric',
        'erection_tower' => 'required|numeric',
        'transportasi' => 'required|numeric',
        'pondasi_greenfiled' => 'required|numeric',
        'bts_outdoor' => 'required|numeric',
        'me' => 'required|numeric',
        'fy' => 'required|numeric',
        'pln_connect' => 'required|numeric',
    ]);
         if(!$valid)
		 {
$cek = Standartimplementation::select('id')->where([['regional',strtoupper($request->regional)],['cluster',strtoupper($request->cluster)],['tower',$request->tower]])->get();
if(count($cek) > 1)
{
return response()->json(['biaya'=>'Data Biaya Untuk Regional '.$request->regional.' , CLuster '.$request->cluster.' dan Tinggi Tower '.$request->tower.'M Sudah Pernah Di Masukan.']);	
}
elseif(count($cek) == 1)
{
if($cek[0]['id'] == $id)
{
Standartimplementation::where('id',$id)->update(['regional'=>strtoupper($request->regional),'cluster'=>strtoupper($request->cluster),'tower'=>$request->tower,'tonase'=>$request->tonase,'pondasi'=>$request->pondasi,'biayatower'=>$request->biayatower,'erection_tower'=>$request->erection_tower,'transportasi'=>$request->transportasi,'pondasi_greenfiled'=>$request->pondasi_greenfiled,'bts_outdoor'=>$request->bts_outdoor,'me'=>$request->me,'fy'=>$request->fy,'pln_connect'=>$request->pln_connect]);	
return response()->json(['success'=>'Data Berhasil Di Rubah']);
}
else
{
return response()->json(['biaya'=>'Data Biaya Untuk Regional '.$request->regional.' , CLuster '.$request->cluster.' dan Tinggi Tower '.$request->tower.'M Sudah Pernah Di Masukan.']);	
}
}
else
{
Standartimplementation::where('id',$id)->update(['regional'=>strtoupper($request->regional),'cluster'=>strtoupper($request->cluster),'tower'=>$request->tower,'tonase'=>$request->tonase,'pondasi'=>$request->pondasi,'biayatower'=>$request->biayatower,'erection_tower'=>$request->erection_tower,'transportasi'=>$request->transportasi,'pondasi_greenfiled'=>$request->pondasi_greenfiled,'bts_outdoor'=>$request->bts_outdoor,'me'=>$request->me,'fy'=>$request->fy,'pln_connect'=>$request->pln_connect]);	
return response()->json(['success'=>'Data Berhasil Di Rubah']);
}

         }
         else
         {
			return response()->json('error', $valid);
         }
    }
	
	
	  public function DeleteBiayaStandart($regional,$cluster,$tower)
    {

			Standartimplementation::where([['regional',$regional],['cluster',$cluster],['tower',$tower]])->delete();
            return response()->json(['success'=>'Data Berhasil Di Hapus']);
    }
	
	
	
	  public function BiayaStandartTowerManual(Request $request)
    {
		$valid = $this->validate($request, [
        'tower' => 'required|numeric|digits_between:1,10',
        'harga' => 'required|numeric|digits_between:1,10',
        'qty' => 'required|numeric|digits_between:1,10',
        'cluster' => 'required|max:200',
        'regional' => 'required|max:200',
        'satuan' => 'required|max:20',
    ]);
         if(!$valid)
		 {
$cek =  StandartimplementationTower::where([['tower',Input::get('tower')],['regional',strtoupper(Input::get('regional'))],['cluster',strtoupper(Input::get('cluster'))]])->first();
if(count($cek)> 0)
{
	
	return response()->json(['regional'=>'Data sudah pernah dimasukan']);
}	
else
{
StandartimplementationTower::create(['regional'=>strtoupper(Input::get('regional')),'cluster'=>strtoupper(Input::get('cluster')),'tower'=>Input::get('tower'),'satuan'=>strtoupper(Input::get('satuan')),'harga'=>Input::get('harga'),'qty'=>Input::get('qty')]);				 
return response()->json(['success'=>'Data Berhasil Di Masukan']);

}
         }
         else
         {
			return response()->json('error', $valid);
         }
    }

	
	  public function UpdateBiayaStandardTower(Request $request, $id)
    {
		$valid = $this->validate($request, [
        'tower' => 'required|numeric|digits_between:1,10',
        'harga' => 'required|numeric|digits_between:1,10',
        'qty' => 'required|numeric|digits_between:1,10',
        'cluster' => 'required|max:200',
        'regional' => 'required|max:200',
        'satuan' => 'required|max:20',
    ]);
         if(!$valid)
		 {
$cek =  StandartimplementationTower::where([['tower',Input::get('tower')],['regional',strtoupper(Input::get('regional'))],['cluster',strtoupper(Input::get('cluster'))]])->first();
if(count($cek)> 0)
{
if($cek->id == $id)
{
StandartimplementationTower::where('id',$id)->update(['regional'=>strtoupper(Input::get('regional')),'cluster'=>strtoupper(Input::get('cluster')),'tower'=>Input::get('tower'),'satuan'=>strtoupper(Input::get('satuan')),'harga'=>Input::get('harga'),'qty'=>Input::get('qty')]);				 
return response()->json(['success'=>'Data Berhasil Di Rubah']);	
}	
else
{
return response()->json(['regional'=>'Data sudah pernah dimasukan']);	
}
		
}	
else
{			 
StandartimplementationTower::where('id',$id)->update(['regional'=>strtoupper(Input::get('regional')),'cluster'=>strtoupper(Input::get('cluster')),'tower'=>Input::get('tower'),'satuan'=>strtoupper(Input::get('satuan')),'harga'=>Input::get('harga'),'qty'=>Input::get('qty')]);				 
return response()->json(['success'=>'Data Berhasil Di Rubah']);
}
         }
         else
         {
			return response()->json('error', $valid);
         }
    }

    
	  public function DeleteBiayaStandartTower($id)
    {

			StandartimplementationTower::where('id',$id)->delete();
            return response()->json(['success'=>'Data Berhasil Di Hapus']);
    }
	
	
	
  
       public function GetNewProject(Request $request)
    {
        $perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;

    if(Auth::guard('karyawan')->user()->level == 'MANAGER UBIS')
    {
      $query = DB::table('project')
 ->select('id', 'projectid','proc','ubis', 'sitename', 'siteid', 
 'area','regional', 'cluster','kode_tower_depan','tower','kode_tower_belakang', DB::raw('CONCAT(kode_tower_depan, " ", tower," ",kode_tower_belakang) AS tinggitower'), 
 'mitra','longitude','latituted','infratype','towerprovider', 'provinsi', 'kabupaten','budget','sis','sitac','imb','imb_jasa','lahan','biayatower',
 'created_at')
 ->where([['status','NEW'],['area',Auth::guard('karyawan')->user()->area]])
 ->orWhere([['status','NEW'],['area',Auth::guard('karyawan')->user()->area2]])
 ->orderBy('id','DESC'); 
    }
    if(Auth::guard('karyawan')->user()->level == 'GENERAL MANAGER UBIS')
    {
      $query = DB::table('project')
 ->select('id', 'projectid','proc','ubis', 'sitename', 'siteid', 
 'area','regional', 'cluster','kode_tower_depan','tower','kode_tower_belakang', DB::raw('CONCAT(kode_tower_depan, " ", tower," ",kode_tower_belakang) AS tinggitower'), 
 'mitra','longitude','latituted','infratype','towerprovider', 'provinsi', 'kabupaten','budget','sis','sitac','imb','imb_jasa','lahan','biayatower',
 'created_at')
 ->where('status','NEW')
 ->orderBy('id','DESC');
    }
    if(Auth::guard('karyawan')->user()->level == 'EXECUTIVE GENERAL MANAGER UBIS')
    {
      $area = null;
      $area2 = null;
    }
    if(Auth::guard('karyawan')->user()->level == 'STAFF PROCUREMENT')
    {
      $query = DB::table('project')
 ->select('id', 'projectid','proc','ubis', 'sitename', 'siteid', 
 'area','regional', 'cluster','kode_tower_depan','tower','kode_tower_belakang', DB::raw('CONCAT(kode_tower_depan, " ", tower," ",kode_tower_belakang) AS tinggitower'), 
 'mitra','longitude','latituted','infratype','towerprovider', 'provinsi', 'kabupaten','budget','sis','sitac','imb','imb_jasa','lahan','biayatower',
 'created_at')
 ->where([['status','NEW'],['area',Auth::guard('karyawan')->user()->area]])
 ->orderBy('id','DESC');
    }
    if(Auth::guard('karyawan')->user()->level == 'MANAGER PROCUREMENT')
    {
      $query = DB::table('project')
 ->select('id', 'projectid','proc','ubis', 'sitename', 'siteid', 
 'area','regional', 'cluster','kode_tower_depan','tower','kode_tower_belakang', DB::raw('CONCAT(kode_tower_depan, " ", tower," ",kode_tower_belakang) AS tinggitower'), 
 'mitra','longitude','latituted','infratype','towerprovider', 'provinsi', 'kabupaten','budget','sis','sitac','imb','imb_jasa','lahan','biayatower',
 'created_at')
 ->where('status','NEW')
 ->orderBy('id','DESC');
 }
    if(Auth::guard('karyawan')->user()->level == 'OFFICER PROCUREMENT')
    {
      $query = DB::table('project')
 ->select('id', 'projectid','proc','ubis', 'sitename', 'siteid', 
 'area','regional', 'cluster','kode_tower_depan','tower','kode_tower_belakang', DB::raw('CONCAT(kode_tower_depan, " ", tower," ",kode_tower_belakang) AS tinggitower'), 
 'mitra','longitude','latituted','infratype','towerprovider', 'provinsi', 'kabupaten','budget','sis','sitac','imb','imb_jasa','lahan','biayatower',
 'created_at')
 ->where('status','NEW')
 ->orderBy('id','DESC');
 }
    if(Auth::guard('karyawan')->user()->level == 'DIRECTOR')
    {
            $query = DB::table('project')
 ->select('id', 'projectid','proc','ubis', 'sitename', 'siteid', 
 'area','regional', 'cluster','kode_tower_depan','tower','kode_tower_belakang', DB::raw('CONCAT(kode_tower_depan, " ", tower," ",kode_tower_belakang) AS tinggitower'), 
 'mitra','longitude','latituted','infratype','towerprovider', 'provinsi', 'kabupaten','budget','sis','sitac','imb','imb_jasa','lahan','biayatower',
 'created_at')
 ->where('status','NEW')
 ->orderBy('id','DESC');
    }
    if(Auth::guard('karyawan')->user()->level == 'OFFICER PSC')
    {
            $query = DB::table('project')
 ->select('id', 'projectid','proc','ubis', 'sitename', 'siteid', 
 'area','regional', 'cluster','kode_tower_depan','tower','kode_tower_belakang', DB::raw('CONCAT(kode_tower_depan, " ", tower," ",kode_tower_belakang) AS tinggitower'), 
 'mitra','longitude','latituted','infratype','towerprovider', 'provinsi', 'kabupaten','budget','sis','sitac','imb','imb_jasa','lahan','biayatower',
 'created_at')
 ->where('status','NEW')
 ->orderBy('id','DESC');
    }
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

     if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('sitename', 'LIKE', $like)
            ->orWhere('area', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like)
            ->orWhere('mitra', 'LIKE', $like)
            ->orWhere('siteid', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('sitename', 'LIKE', $like)
			->orWhere('area', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like)
      ->orWhere('mitra', 'LIKE', $like)
            ->orWhere('siteid', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('sitename', 'LIKE', $like)
			->orWhere('area', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like)
      ->orWhere('mitra', 'LIKE', $like)
            ->orWhere('siteid', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('sitename', 'LIKE', $like)
			->orWhere('area', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like)
      ->orWhere('mitra', 'LIKE', $like)
            ->orWhere('siteid', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
  
  
	
       public function GetAllProject(Request $request)
    {
				$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;

		$query = DB::table('vprojectimplementation')
      ->orderBy('id','DESC');

	   if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('area', 'LIKE', $like)
            ->orWhere('regional', 'LIKE', $like)
            ->orWhere('cluster', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('area', 'LIKE', $like)
            ->orWhere('regional', 'LIKE', $like)
            ->orWhere('cluster', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('area', 'LIKE', $like)
            ->orWhere('regional', 'LIKE', $like)
            ->orWhere('cluster', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('area', 'LIKE', $like)
            ->orWhere('regional', 'LIKE', $like)
            ->orWhere('cluster', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
	     public function AddNewProject(Request $request)
    {
	   $valid = $this->validate($request, [
        'projectid' => 'required|max:200|unique:project,projectid',
        'sitename' => 'required|max:200',
        'proc' => 'required|max:200',
        'ubis' => 'required|max:200',
        'siteid' => 'required|max:200',
        'area' => 'required|max:200',
        'regional' => 'required|max:200',
        'cluster' => 'required|max:200',
        'mitra' => 'required|max:200',
        'kode_tower_depan' => 'required|max:200',
        'kode_tower_belakang' => 'required|max:200',
        'infratype' => 'required|in:UNTAPPED,B2S',
        'towerprovider' => 'required|max:200',
        'longitude' => 'required',
        'latituted' => 'required',
        'provinsi' => 'required',
        'kabupaten' => 'required',
        'tower' => 'required|numeric|digits_between:1,10',
        'budget' => 'required|numeric|not_in:0',
        'sis' => 'required|numeric|not_in:0',
        'sitac' => 'required|numeric|not_in:0',
        'imb' => 'required|numeric',
        'imb_jasa' => 'required|numeric',
        'cme' => 'required|numeric',
        'pln' => 'required|numeric',
        'addtransport' => 'required|numeric',
        'addpln' => 'required|numeric',
        'addcme' => 'required|numeric',
        'lahan' => 'required|numeric',
    ]);
	
         if(!$valid)
		 {
Project::create(['projectid'=>strtoupper(Input::get('projectid')),'mitra'=>strtoupper(Input::get('mitra')),'proc'=>strtoupper(Input::get('proc')),'ubis'=>strtoupper(Input::get('ubis')),'sitename'=>strtoupper(Input::get('sitename')),'siteid'=>strtoupper(Input::get('siteid')),'kabupaten'=>strtoupper(Input::get('kabupaten')),'provinsi'=>strtoupper(Input::get('provinsi')),'latituted'=>Input::get('latituted'),'longitude'=>Input::get('longitude'),'towerprovider'=>strtoupper(Input::get('towerprovider')),'infratype'=>strtoupper(Input::get('infratype')),'kode_tower_belakang'=>strtoupper(Input::get('kode_tower_belakang')),'kode_tower_depan'=>strtoupper(Input::get('kode_tower_depan')),'cluster'=>strtoupper(Input::get('cluster')),'area'=>strtoupper(Input::get('area')),'regional'=>strtoupper(Input::get('regional')),'tower'=>Input::get('tower'),'budget'=>Input::get('budget'),'sis'=>Input::get('sis'),'sitac'=>Input::get('sitac'),'imb'=>Input::get('imb'),'imb_jasa'=>Input::get('imb_jasa'),'lahan'=>Input::get('lahan'),'addcme'=>Input::get('addcme'),'addpln'=>Input::get('addpln'),'addtransport'=>Input::get('addtransport'),'pln'=>Input::get('pln'),'cme'=>Input::get('cme'),'biayatower'=>Input::get('biayatower'),'status_id'=>'0','status'=>'NEW']);
return response()->json(['success'=>'Penambahan Data Project Berhasil']);

		 }
         else
         {
			return response()->json('error', $valid);
         }
    }
	
	
	   public function UpdateNewProject(Request $request,$id)
    {
		
			$valid = $this->validate($request, [
        'projectid' => 'required|max:200|unique:project,projectid,'.$id,
        'sitename' => 'required|max:200',
        'proc' => 'required|max:200',
        'ubis' => 'required|max:200',
        'siteid' => 'required|max:200',
        'area' => 'required|max:200',
        'regional' => 'required|max:200',
        'cluster' => 'required|max:200',
        'mitra' => 'required|max:200',
        'kode_tower_depan' => 'required|max:200',
        'kode_tower_belakang' => 'required|max:200',
        'infratype' => 'required|in:UNTAPPED,B2S',
        'towerprovider' => 'required|max:200',
        'longitude' => 'required',
        'latituted' => 'required',
        'provinsi' => 'required',
        'kabupaten' => 'required',
        'tower' => 'required|numeric|digits_between:1,10',
        'budget' => 'required|numeric|not_in:0',
        'sis' => 'required|numeric|not_in:0',
        'sitac' => 'required|numeric|not_in:0',
        'imb' => 'required|numeric',
        'imb_jasa' => 'required|numeric',
		'cme' => 'required|numeric',
        'pln' => 'required|numeric',
        'addtransport' => 'required|numeric',
        'addpln' => 'required|numeric',
        'addcme' => 'required|numeric',
        'lahan' => 'required|numeric',
        'status' => 'required|in:NEW,CANCEL',
    ]);
		
	   
         if(!$valid)
		 {
Project::where('id',$id)->update(['projectid'=>strtoupper(Input::get('projectid')),'mitra'=>strtoupper(Input::get('mitra')),'proc'=>strtoupper(Input::get('proc')),'ubis'=>strtoupper(Input::get('ubis')),'sitename'=>strtoupper(Input::get('sitename')),'siteid'=>strtoupper(Input::get('siteid')),'kabupaten'=>strtoupper(Input::get('kabupaten')),'provinsi'=>strtoupper(Input::get('provinsi')),'latituted'=>Input::get('latituted'),'longitude'=>Input::get('longitude'),'towerprovider'=>strtoupper(Input::get('towerprovider')),'infratype'=>strtoupper(Input::get('infratype')),'kode_tower_belakang'=>strtoupper(Input::get('kode_tower_belakang')),'kode_tower_depan'=>strtoupper(Input::get('kode_tower_depan')),'cluster'=>strtoupper(Input::get('cluster')),'area'=>strtoupper(Input::get('area')),'regional'=>strtoupper(Input::get('regional')),'tower'=>Input::get('tower'),'budget'=>Input::get('budget'),'sis'=>Input::get('sis'),'sitac'=>Input::get('sitac'),'imb'=>Input::get('imb'),'imb_jasa'=>Input::get('imb_jasa'),'lahan'=>Input::get('lahan'),'cme'=>Input::get('cme'),'pln'=>Input::get('pln'),'addcme'=>Input::get('addcme'),'addpln'=>Input::get('addpln'),'addtransport'=>Input::get('addtransport'),'biayatower'=>Input::get('biayatower'),'status_id'=>'0','status'=>Input::get('status')]);
return response()->json(['success'=>'Perubahan data Project Berhasil']);
         }
         else
         {
			return response()->json('error', $valid);
         }
		}
			
	
	
	       public function DeleteProject($id)
    {
		
	   $cek = Project::findOrFail($id);
         if(!$cek)
		 {
			 return response()->json('error',500);
         }
         else
         {
            Project::where('id',$id)->delete();
			return response()->json(['success'=>'Project Berhasil Di Hapus']);
         }
    }
	
	
	
	
   public function uploadProject(Request $request)
    {
         $valid = $this->validate($request, [
        'file_name' => 'required|mimes:xlsx',
    ]);
         if(!$valid)
		 {
			$extension  = Input::file('file_name')->getClientOriginalExtension(); // getting image extension
if($extension == 'xlsx')
{
		   $x = 0;
			$path = $request->file('file_name')->getRealPath();
			$data = Excel::load($path, function($reader) {})->get();
			if(!empty($data) && $data->count()){
				foreach ($data->toArray() as $key => $value) {
					if(!empty($value)){
						
						foreach ($value as $key => $v) {						
$insert[] = ['projectid' => strtoupper($v['projectid']), 'proc' => strtoupper($v['proc']), 'ubis' => strtoupper($v['ubis']), 'area' => strtoupper($v['area']), 'regional' => strtoupper($v['regional']), 'sitename' => strtoupper($v['sitename']), 'siteid' => strtoupper($v['siteid']),'cluster' => strtoupper($v['cluster']),'mitra' => $v['mitra'],'kode_tower_depan' => strtoupper($v['tipetower']),'tower' => $v['tinggitower'],'kode_tower_belakang' => strtoupper($v['jenistower']),'budget' => $v['budget'],'longitude' => $v['long'],'latituted' => $v['lat'],'infratype' => strtoupper($v['infratype']),'towerprovider' => strtoupper($v['towerprovider']),'provinsi' => strtoupper($v['provinsi']),'kabupaten' => strtoupper($v['kabupaten']), 'sis' => $v['sis'],'sitac' => $v['sitac'],'imb' => $v['retribusiimb'],'imb_jasa' => $v['jasaimb'],'cme' => $v['cme'],'pln' => $v['pln'],'addtransport' => $v['addtransport'],'addpln' => $v['addpln'],'addcme' => $v['addcme'],'qty_lahan' => '1','lahan' => $v['lahan'],'biayatower' => $v['tower'],'status_id'=>'0', 'no_doc'=>null,  'filename'=>null, 'status'=>'NEW', 'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];	
$rules[$key.'.projectid'] = 'required|max:200|unique:project,projectid';		
$rules[$key.'.sitename'] = 'required|max:200';		
$rules[$key.'.siteid'] = 'required|max:200';		
$rules[$key.'.area'] = 'required|max:200';		
$rules[$key.'.regional'] = 'required|max:200';		
$rules[$key.'.cluster'] = 'required|max:200';		
$rules[$key.'.mitra'] = 'required|max:200';		
$rules[$key.'.kode_tower_depan'] = 'required|max:200';		
$rules[$key.'.kode_tower_belakang'] = 'required|max:200';		
$rules[$key.'.infratype'] = 'required|max:200';		
$rules[$key.'.towerprovider'] = 'required|max:200';		
$rules[$key.'.longitude'] = 'required';		
$rules[$key.'.latituted'] = 'required';		
$rules[$key.'.provinsi'] = 'required';		
$rules[$key.'.kabupaten'] = 'required';		
$rules[$key.'.budget'] = 'required|numeric|not_in:0';		
$rules[$key.'.sis'] = 'required|numeric|not_in:0';		
$rules[$key.'.sitac'] = 'required|numeric|not_in:0';		
$rules[$key.'.imb'] = 'required|numeric';			
$rules[$key.'.imb_jasa'] = 'required|numeric';		
$rules[$key.'.cme'] = 'required|numeric';		
$rules[$key.'.pln'] = 'required|numeric';		
$rules[$key.'.addtransport'] = 'required|numeric';		
$rules[$key.'.addpln'] = 'required|numeric';		
$rules[$key.'.addcme'] = 'required|numeric';		
$rules[$key.'.lahan'] = 'required|numeric';		
$rules[$key.'.biayatower'] = 'required|numeric';		
$rules[$key.'.tower'] = 'required|numeric|not_in:0';	
		
		}
							
						}
					}

					if(!empty($insert))
					{
$validator = Validator::make($insert, $rules);
if($validator->fails()) {
return response()->json(['file_name'=>'Silahkan perbaiki file yang anda masukan','errornya'=>$validator->errors()]);
//return response()->json(['file_name'=>'Silahkan perbaiki file yang anda masukan','errornya'=>$validator->errors()]);
} else {						
						
DB::table('project')->insert($insert);
return response()->json(['success'=>'Data Berhasil Dimasukan Semua']);
							
}					
					}
					else
					{
						return response()->json(['file_name'=>'Tidak ada data yang dimasukan']);
					}
			
				}
		
				
			}
else
{
    return response()->json(['file_name'=>'File upload hanya berektensi .xlsx']);
}
         }
         else
         {
			return response()->json('error', $valid);
         }
    }
	
	
/* procurement */
	
	
	
	
	
	
	
	
	
	
	/* user */
	 public function listuser(Request $request)
    {
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = User::orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('email', 'LIKE', $like)
            ->orWhere('name', 'LIKE', $like)
            ->orWhere('level', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('email', 'LIKE', $like)
            ->orWhere('name', 'LIKE', $like)
            ->orWhere('level', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('email', 'LIKE', $like)
            ->orWhere('name', 'LIKE', $like)
            ->orWhere('level', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('email', 'LIKE', $like)
            ->orWhere('name', 'LIKE', $like)
            ->orWhere('level', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
	  public function Addkaryawan(Request $request)
    {
if(Input::get('level')=='MANAGER AREA' || Input::get('level')=='GENERAL MANAGER AREA' || Input::get('level')=='STAFF PROCUREMENT')
{
		$valid = $this->validate($request, [
        'email' => 'required|max:191|unique:users,email',
        'area' => 'required|max:255',
        'name' => 'required|max:255',
        'password' => 'required|max:255',
        'level' => 'required',
    ]);	
}
elseif(Input::get('level')=='MANAGER UBIS')
{
		$valid = $this->validate($request, [
        'email' => 'required|max:191|unique:users,email',
        'area' => 'required|max:255',
        'area2' => 'required|max:255',
        'name' => 'required|max:255',
        'password' => 'required|max:255',
        'level' => 'required',
    ]);	
}
else
{
$valid = $this->validate($request, [
        'email' => 'required|max:191|unique:users,email',
        'name' => 'required|max:255',
        'password' => 'required|max:255',
        'level' => 'required',
    ]);	
}
if (!$valid)
    {
if(Input::get('level')=='MANAGER AREA' || Input::get('level')=='GENERAL MANAGER AREA' || Input::get('level')=='STAFF PROCUREMENT')
{
$masuk = array('name' => strtoupper(Input::get('name')),'email' => Input::get('email'),'password' => Hash::make(Input::get('password')),'password_api' => md5(Input::get('password')),'level'=>Input::get('level'),'area'=>strtoupper(Input::get('area')));	
}
elseif(Input::get('level')=='MANAGER UBIS')
{
$masuk = array('name' => strtoupper(Input::get('name')),'email' => Input::get('email'),'password' => Hash::make(Input::get('password')),'password_api' => md5(Input::get('password')),'level'=>Input::get('level'),'area'=>strtoupper(Input::get('area')),'area2'=>strtoupper(Input::get('area2')));	
}
else
{
$masuk = array('name' => strtoupper(Input::get('name')),'email' => Input::get('email'),'password' => Hash::make(Input::get('password')),'password_api' => md5(Input::get('password')),'level'=>Input::get('level'),'area'=>null,'area2'=>null);
}		
Log::create(['email' => Auth::guard('karyawan')->user()->email, 'table_action'=>'users' ,'action' => 'insert', 'data' => json_encode($masuk)]);
User::create($masuk);
return response()->json(['success'=>'Data Karyawan Berhasil Di Masukan']);
    }
else
    {
 return response()->json('error', $valid);
    }
    }
	
	
	  public function Deletekaryawan($id)
    {
		$cek = User::findOrFail($id);
         if(!$cek)
         {
            return response()->json('error',500);
         }
         else
         {
			 Log::create(['email' => Auth::guard('karyawan')->user()->email, 'table_action'=>'users' ,'action' => 'delete', 'data' => json_encode($cek)]);

			 $cek->delete();
            return response()->json(['success'=>'Data Berhasil Di Hapus']);
         }
    }
	
		
	
	  public function Updatekaryawan(Request $request,$id)
    {
if(Input::get('level')=='MANAGER AREA' || Input::get('level')=='GENERAL MANAGER AREA' || Input::get('level')=='STAFF PROCUREMENT')
{
		$valid = $this->validate($request, [
        'email' => 'required|max:191|unique:users,email,'.$id,
        'name' => 'required|max:255',
        'area' => 'required|max:255',
		'level' => 'required',
    ]);	
}
if(Input::get('level')=='MANAGER UBIS')
{
		$valid = $this->validate($request, [
        'email' => 'required|max:191|unique:users,email,'.$id,
        'name' => 'required|max:255',
        'area' => 'required|max:255',
        'area2' => 'required|max:255',
		'level' => 'required',
    ]);	
}
else
{
		$valid = $this->validate($request, [
        'email' => 'required|max:191|unique:users,email,'.$id,
        'name' => 'required|max:255',
		'level' => 'required',
    ]);
}

         if(!$valid)
		 {
			 if(Input::get('password') == "")
			 {
if(Input::get('level')=='MANAGER AREA' || Input::get('level')=='GENERAL MANAGER AREA' || Input::get('level')=='STAFF PROCUREMENT')
{
$rubah = array('name' => strtoupper(Input::get('name')),'email' => Input::get('email'),'level'=>Input::get('level'),'area'=>strtoupper(Input::get('area')));	
}
elseif(Input::get('level')=='MANAGER UBIS')
{
$rubah = array('name' => strtoupper(Input::get('name')),'email' => Input::get('email'),'level'=>Input::get('level'),'area'=>strtoupper(Input::get('area')),'area2'=>strtoupper(Input::get('area2')));	
}
else
{
$rubah = array('name' => strtoupper(Input::get('name')),'email' => Input::get('email'),'level'=>Input::get('level'));
}
User::where("id",$id)->update($rubah);
return response()->json(['success'=>'Data Berhasil Dirubah']); 
			 }
			 else
			 {
if(Input::get('level')=='MANAGER AREA' || Input::get('level')=='GENERAL MANAGER AREA' || Input::get('level')=='STAFF PROCUREMENT')
{
$rubah = array('name' => strtoupper(Input::get('name')),'email' => Input::get('email'),'level'=>Input::get('level'),'area'=>strtoupper(Input::get('area')));	
}
elseif(Input::get('level')=='MANAGER UBIS')
{
$rubah = array('name' => strtoupper(Input::get('name')),'email' => Input::get('email'),'level'=>Input::get('level'),'area'=>strtoupper(Input::get('area')),'area2'=>strtoupper(Input::get('area2')));	
}
else
{
$rubah = array('name' => strtoupper(Input::get('name')),'email' => Input::get('email'),'password' => Hash::make($request->password),'password_api' => md5($request->password),'level'=>Input::get('level'),'area'=>'');
}
User::where("id",$id)->update($rubah);
return response()->json(['success'=>'Data Dan Password Berhasil Dirubah']); 				 
			 }
         }
         else
         {
			return response()->json('error', $valid);
         }
    }
	
	
	/* user */
	
	
	
	
	
	/* get office profile */
		   public function GetProfileOffice()
    {
       if(Auth::guard('karyawan')->user()->level == 'OFFICER PROCUREMENT' || Auth::guard('karyawan')->user()->level == 'OFFICER PSC' || Auth::guard('karyawan')->user()->level == 'MANAGER UBIS' || Auth::guard('karyawan')->user()->level == 'GENERAL MANAGER UBIS' || Auth::guard('karyawan')->user()->level == 'EXECUTIVE GENERAL MANAGER UBIS' || Auth::guard('karyawan')->user()->level == 'STAFF PROCUREMENT' || Auth::guard('karyawan')->user()->level == 'MANAGER PROCUREMENT' || Auth::guard('karyawan')->user()->level == 'DIRECTOR' || Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
         {
            return response()->json(true);
         }
         else
         {
            return response()->json('error',500);
         }
    }
	
	/* get office profile */
	
	
	
	

/* manager area */


	       public function GetProfileAreaM()
    {
       if(Auth::guard('karyawan')->user()->level == 'MANAGER AREA' || Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
         {
            return response()->json('ok');
         }
         else
         {
            return response()->json('error',500);
         }
    }

	       public function GetProfileAreaMAG()
    {
       if(Auth::guard('karyawan')->user()->level == 'GENERAL MANAGER AREA' ||Auth::guard('karyawan')->user()->level == 'MANAGER AREA' || Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
         {
            return response()->json('ok');
         }
         else
         {
            return response()->json('error',500);
         }
    }


	 public function GetNewProjectMA(Request $request)
    {
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = DB::table('vprojectall')->select('id', 'projectid','proc','ubis', 'sitename', 'siteid', 
 'area','regional', 'cluster','kode_tower_depan','tower','kode_tower_belakang','tinggitower', 
 'mitra','longitude','latituted','infratype','towerprovider', 'provinsi', 'kabupaten','budget','sis','sitac','imb','imb_jasa','qty_lahan','lahan','biayatower','cme','pln','addtransport','addpln',
 'addcme','created_at')
 ->where([['status','NEW'],['area',Auth::guard('karyawan')->user()->area]])->orderBy('id','DESC');;
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('sitename', 'LIKE', $like)
            ->orWhere('cluster', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('sitename', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('sitename', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('sitename', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	

	
	
       public function GetProjectRejectMA(Request $request)
    {
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = DB::table('vprojectimplementation')
			->where([['area',Auth::guard('karyawan')->user()->area],['status','CANCEL']])
            ->orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('sitename', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like)
			->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('sitename', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like)
			->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('sitename', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like)
			->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('sitename', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like)
			->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
    public function GetRepairProjectAreaM(Request $request)
    {
        $perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = DB::table('vprojectimplementation')
			->where([['area',Auth::guard('karyawan')->user()->area],['status','REPAIR AREA - MANAGER AREA']])
            ->orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('sitename', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like)
			->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('sitename', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like)
			->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('sitename', 'LIKE', $like)
             ->orWhere('projectid', 'LIKE', $like)
			->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('sitename', 'LIKE', $like)
             ->orWhere('projectid', 'LIKE', $like)
			->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
	
	 public function GetProjectProgressMA(Request $request)
    {
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
		$query = DB::table('vprojectimplementation')
			->where('area',Auth::guard('karyawan')->user()->area)
            ->whereNotIn('status',['FINISH','CANCEL','NEW'])
			->orderBy('id','DESC');
        
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
	 public function GetProjectFinalMA(Request $request)
    {
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = DB::table('vprojectimplementation')
			->where([['area',Auth::guard('karyawan')->user()->area],['status','FINISH']])
			->orderBy('id','DESC');
        
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	

	       public function GetDetailStandartImplementationMA($regional,$cluster,$tower)
    {
if(!$regional || !$tower || !$cluster)
{
	return response()->json(['error'=>500]);
}
else
{	
$standard = DB::table('vstandartimplementation')->select('id','regional','cluster','tower','tonase','pondasi','biayatower','erection_tower','transportasi','pondasi_greenfiled','bts_outdoor','me','fy','pln_connect')->where([['regional',$regional],['cluster',$cluster],['tower',$tower]])->first();
return response()->json(['standard'=>$standard]);
	
}
   
    }


	       public function GetDetailStandartImplementationArea($regional,$cluster,$tower,$area,$infratype)
    {
if(!$regional)
{
	return response()->json('error');
}
else
{
if($infratype=='UNTAPPED')
{
$standard = Standartimplementation::where([['regional',$regional],['cluster',$cluster],['tower',$tower]])->select('id','regional','cluster','tower','tonase','pondasi','biayatower','erection_tower','transportasi','pondasi_greenfiled','bts_outdoor','me','fy','pln_connect')->first();	
$vtower = DB::table('vdistinsstandartimplementationtower')->where('regional',$regional)->select('tower')->get();
$vcluster = DB::table('vdistinsstandartimplementationcluster')->where('regional',$regional)->select('cluster')->get();
$sregional = DB::table('vplafon_capex_regional')->where([['regional',$regional],['infratype','UNTAPPED']])->select('budgetNya','capexNya','total')->first();
if(count($sregional)>0){$sr=$sregional;}else{$sr=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
$sarea = DB::table('vplafon_capex_area')->where([['area',$area],['infratype','UNTAPPED']])->select('budgetNya','capexNya','total')->first();
if(count($sarea)>0){$sa=$sarea;}else{$sa=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
$snasional = DB::table('vplafon_capex_nasional')->where('infratype','UNTAPPED')->select('budgetNya','capexNya','total')->first();
if(count($snasional)>0){$sn=$snasional;}else{$sn=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
$simulasi = ['regional'=>$sr,'area'=>$sa,'nasional'=>$sn];
return response()->json(['standard'=>$standard,'vtower'=>$vtower,'vcluster'=>$vcluster,'simulasi'=>$simulasi]);
	
}
else
{
$standard = Standartimplementation::where([['regional',$regional],['cluster',$cluster],['tower',$tower]])->select('id','regional','cluster','tower','tonase','pondasi','biayatower','erection_tower','transportasi','pondasi_greenfiled','bts_outdoor','me','fy','pln_connect')->first();
if(empty($standard))
{
	return response()->json('error');
}
else
{	
$vtower = DB::table('vdistinsstandartimplementationtower')->where('regional',$regional)->select('tower')->get();
$vcluster = DB::table('vdistinsstandartimplementationcluster')->where('regional',$regional)->select('cluster')->get();
$sregional = DB::table('vplafon_capex_regional')->where([['regional',$regional],['infratype','B2S']])->select('budgetNya','capexNya','total')->first();
if(count($sregional)>0){$sr=$sregional;}else{$sr=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
$sarea = DB::table('vplafon_capex_area')->where([['area',$area],['infratype','B2S']])->select('budgetNya','capexNya','total')->first();
if(count($sarea)>0){$sa=$sarea;}else{$sa=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
$snasional = DB::table('vplafon_capex_nasional')->where('infratype','B2S')->select('budgetNya','capexNya','total')->first();
if(count($snasional)>0){$sn=$snasional;}else{$sn=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
$simulasi = ['regional'=>$sr,'area'=>$sa,'nasional'=>$sn];
return response()->json(['standard'=>$standard,'vtower'=>$vtower,'vcluster'=>$vcluster,'simulasi'=>$simulasi]);
}
}	
	
}
   
    }

/* manager area */	





/* upload dokumen */

            public function uploaddokumen(Request $request)
    {
        $id = Input::get('id');
         $cek = Project::findOrFail($id);
         if(!$cek)
{
 return response()->json(['file_name'=>'Code Not Found']);
}
else
{
    if (Input::file('file_name'))
    {
        $destinationPath = 'files/'; // upload path
        $extension  = Input::file('file_name')->getClientOriginalExtension(); // getting image extension
if($extension == 'pdf')
{
   $fileName   = time().'.'.$extension; // renameing image
   if(file_exists($destinationPath.$fileName))
    {
File::delete($destinationPath .$fileName);
    }   
    else
    {
        if(!empty($cek->filename ))
        {
            File::delete($destinationPath .$cek->filename);
        }
$upload_success     = Input::file('file_name')->move($destinationPath, $fileName);
if(!$upload_success)
{
 return response()->json(['file_name'=>'File Upload Gagal']);
}
else
{
$cek->filename = $fileName;
$cek->save();
return response()->json(['success'=>'Upload File Berhasil','filename'=>$fileName]);

}
    }
}
else
{
    return response()->json(['file_name'=>'File upload hanya berektensi .pdf']);
}
    }
	else
	{
	 return response()->json(['file_name'=>'Silahkan Pilih File']);	
	}
}
    }	
	
	
	
	
            public function deletefile(Request $request)
    {
		$id = Input::get('projectid');
         $cek = Project::findOrFail($id);
         if(!$cek)
{
 return response()->json(['file_name'=>'Code Not Found']);
}
else
{
        $destinationPath = 'files/'; // upload path
$delete_success     = File::delete($destinationPath .$cek->filename);
if(!$delete_success)
{
 return response()->json(['file_name'=>'Delete File Gagal']);
}
else
{
$cek->filename = null;
$cek->save();
return response()->json(['success'=>'File Berhasil Di Hapus']);

}
    


    
}
    }
/* upload dokumen */	
	
	
	

	

/* pesan */	
       public function GetMessageNya($id)
    {
            $pesan = DB::table('project_status')
            ->join('users', 'users.id', '=', 'project_status.user_id')
            ->select('project_status.*', 'users.name', 'users.level')
            ->where('project_status.project_id',$id)->orderBy('project_status.id','ASC')->get();
            return response()->json($pesan);
         
    }
	
	
/* pesan */	



/* send email */
public function sendEmail($projectid,$emailNya,$nama,$name,$messageNya){
   $masuk = array(
        'projectid' => $projectid,
        'message' => $messageNya,
        'name' => $name); 
		$content = view('email_content')->with($masuk);

	Mail::send('email', ['contentMessage' => $content], function($message) use ($emailNya, $nama) {
         $message->to($emailNya, $nama)->subject('E-MAPPING (Electronic Budgeting Approval Mitratel B2S)');
         $message->from('info@mitratel.com','E-MAPPING (Electronic Budgeting Approval Mitratel B2S)');
      });	

return response()->json(['email'=>'send']);
}	
/* send email */	
	

	
	
	
	
	/*submit data*/
	

	
	/*submit data*/
	
	
	
	
	public function GetProfileAdminstrator()
    {
       if(Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
         {
            return response()->json('ok');
         }
         else
         {
            return response()->json('error',500);
         }
    }
	
	
	/*detail project*/
	
       
		
       public function GetProjectDetailProsesGrafikuNtp($id,$kode,$regional,$area)
    {
$cari = DB::table('vprojectimplementation')->where('id',$id)->first();
if(empty($cari))
{
	return response()->json('error');
}	
else
{

$standard = DB::table('vprojectimplementationstandard')->select('id','project_implementation_id','tonase','pondasi','biayatower','erection_tower','transportasi','pondasi_greenfiled','bts_outdoor','me','fy','pln_connect')->where('project_implementation_id',$kode)->first();

	$pesan = DB::table('vprojectstatus')
            ->select('status','created_at', 'name', 'level')
			->where([['project_id',$id],['status','APPROVED']])
            ->orderBy('created_at','ASC')
			->get();
  $additional = DB::table('vprojectimplementationadditional')->select('pekerjaan','satuan','qty','harga','total')->where('project_implementation_id',$kode)->orderBy('id','ASC')->get();
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
return response()->json(['project'=>$cari,'standard'=>$standard,'additional'=>$additional,'pesan'=>$pesan,'pesanlengkap'=>$pesanlengkap,'levelnya'=>$levelnya->level,'vtower'=>$vtower,'vcluster'=>$vcluster,'simulasi'=>$simulasi]);

}      
    }
	
		
       public function GetProjectDetailProsesGrafikB2s($id,$kode,$regional,$area)
    {
$cari = DB::table('vprojectimplementation')->where('id',$id)->first();
if(empty($cari))
{
	return response()->json('error');
}	
else
{

$standard = DB::table('vprojectimplementationstandard')->select('id','project_implementation_id','tonase','pondasi','biayatower','erection_tower','transportasi','pondasi_greenfiled','bts_outdoor','me','fy','pln_connect')->where('project_implementation_id',$kode)->first();
if(empty($standard))
{
	return response()->json('error');
}
else
{
	$pesan = DB::table('vprojectstatus')
            ->select('status','created_at', 'name', 'level')
			->where([['project_id',$id],['status','APPROVED']])
            ->orderBy('created_at','ASC')
			->get();
  $additional = DB::table('vprojectimplementationadditional')->select('pekerjaan','satuan','qty','harga','total')->where('project_implementation_id',$kode)->orderBy('id','ASC')->get();
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
return response()->json(['project'=>$cari,'standard'=>$standard,'additional'=>$additional,'pesan'=>$pesan,'pesanlengkap'=>$pesanlengkap,'levelnya'=>$levelnya->level,'vtower'=>$vtower,'vcluster'=>$vcluster,'simulasi'=>$simulasi]);
   
}

}      
    }
	
		
		
       public function GetProjectDetailRegionaluNtpGrafik($regional)
    {
$cari = DB::table('vprojectimplementation')->where([['regional',$regional],['infratype','UNTAPPED'],['status','FINISH']])->get();
if(empty($cari))
{
	return response()->json('error');
}	
else
{
return response()->json(['project'=>$cari]);
}      
    }
     		
       public function GetProjectDetailRegionalB2sGrafik($regional)
    {
$cari = DB::table('vprojectimplementation')->where([['regional',$regional],['infratype','B2S'],['status','FINISH']])->get();
if(empty($cari))
{
	return response()->json('error');
}	
else
{
return response()->json(['project'=>$cari]);
}      
    }
     	
       public function GetProjectDetailAreaB2sGrafik($area)
    {
$cari = DB::table('vprojectimplementation')->where([['area',$area],['infratype','B2S'],['status','FINISH']])->get();
if(empty($cari))
{
	return response()->json('error');
}	
else
{
return response()->json(['project'=>$cari]);
}      
    }
     
       public function GetProjectDetailAreaUntpGrafik($area)
    {
$cari = DB::table('vprojectimplementation')->where([['area',$area],['infratype','UNTAPPED'],['status','FINISH']])->get();
if(empty($cari))
{
	return response()->json('error');
}	
else
{
return response()->json(['project'=>$cari]);
}      
    }
     
	
		
       public function GetProjectDetailProsesOffice($id,$kode,$regional)
    {
$standard = DB::table('vprojectimplementationstandard')->select('pekerjaan','satuan','qty','harga','total')->where('project_implementation_id',$kode)->get();
$pesan = DB::table('vprojectstatus')
            ->select('status','created_at', 'name', 'level')
			->where([['project_id',$id],['status','APPROVED']])
            ->orderBy('created_at','ASC')
			->get();
$pesanreject = DB::table('vprojectstatus')
            ->select('status','created_at', 'name', 'level')
			->where([['project_id',$id],['status','REJECT']])
            ->orderBy('created_at','ASC')
			->get();
  $additional = DB::table('vprojectimplementationadditional')->select('pekerjaan','satuan','qty','harga','total')->where('project_implementation_id',$kode)->orderBy('id','ASC')->get();
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

            return response()->json(['standard'=>$standard,'additional'=>$additional,'pesan'=>$pesan,'pesanreject'=>$pesanreject,'pesanlengkap'=>$pesanlengkap,'levelnya'=>$levelnya->level]);
         
    }
	
		
	
	/*detail project*/
	
	
	
	
	
	
	
	/* Download Excel */
	public function downloadExcelDataBaru(Request $request)
	{
$data = $request->data;	
$ShowData = DB::table('vprojectall')
->whereIn('id', $data)->get();
return Excel::create('ExportData', function($excel) use ($ShowData){
    $excel->sheet('ExportDataBaru', function($sheet) use ($ShowData){
			 $sheet->loadView('DownloadExcelDataBaru')
			 ->with('data',$ShowData);
			 $sheet->setOrientation('landscape');
			});
	
})->export('xlsx');	


	}
	

	
	
	
	
	
	
	
	/* Download Excel */
	
	
	
	


/*profil*/
    public function profil()
    {
        $cek = User::findOrFail(Auth::guard('karyawan')->user()->id);
        return response()->json($cek);
    }
	
	
    public function q_UpdatePassword(Request $request)
    {

$valid = $this->validate($request, [
        'password' => 'required|max:255',
        'password_confirmation' => 'required|max:255|same:password'
    ]);
if (!$valid)
    {
$edit = array('password' => Hash::make($request->password),'password_api'=>md5($request->password));
User::where("id",Auth::guard('karyawan')->user()->id)->update($edit);

return response()->json(['success'=>'Password Berhasil Dirubah']);

    }
else
    {
 return response()->json('error', $valid);
    }

    }

/*profil*/

	


/* general manager area */


	       public function GetProfileAreaPM()
    {
       if(Auth::guard('karyawan')->user()->level == 'GENERAL MANAGER AREA' || Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
         {
            return response()->json('ok');
         }
         else
         {
            return response()->json('error',500);
         }
    }


    public function GetProjectAreaPM(Request $request)
    {
        $perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
		$query = DB::table('vprojectimplementation')
			->where([['area',Auth::guard('karyawan')->user()->area],['status','AREA - GENERAL MANAGER AREA']])
			->orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
			}
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
		}
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
		}
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
			}
        return $query->paginate($perPage);
    }


    public function GetProjectRepairAreaPM(Request $request)
    {
        $perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
		$query = DB::table('vprojectimplementation')
			->where([['area',Auth::guard('karyawan')->user()->area],['status','REPAIR AREA - GENERAL MANAGER AREA']])
			->orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
			}
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
		}
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
		}
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
			}
        return $query->paginate($perPage);
    }

	
/* general manager area */	





/* project */

	
		
/* project */	




	
/* grafik */
		
    
	
		
    public function years()
    {
		$years_awal=2017;
		$carbon = Carbon::now();
		$year = $carbon->year;
		for($years_awal;$years_awal <= $year;$years_awal++)
		{
			$data[] = $years_awal;
		}
        return response()->json(['sekarang'=>$year,'tahun'=>$data]);
    }
	
		
       public function DataGrafik(Request $request)
    {
if($request->get('tahun')=='')
{
$tahun = Carbon::createFromFormat('Y-m-d H:i:s', Carbon::now())->year;	
}	
else
{
$tahun = $request->get('tahun');	
}
		
		
/* final */			
$AJan = DB::table('vgrafik')->select(DB::raw('IFNULL(jumlah,0) as jml'))->where([['tahun',$tahun],['bulan','January'],['status','FINISH']])->first();			
if($AJan==''){$HAJan = 0;}else{$HAJan=$AJan->jml;}
$AFeb = DB::table('vgrafik')->select(DB::raw('IFNULL(jumlah,0) as jml'))->where([['tahun',$tahun],['bulan','February'],['status','FINISH']])->first();			
if($AFeb==''){$HAFeb = 0;}else{$HAFeb=$AFeb->jml;}
$AMar = DB::table('vgrafik')->select(DB::raw('IFNULL(jumlah,0) as jml'))->where([['tahun',$tahun],['bulan','March'],['status','FINISH']])->first();			
if($AMar==''){$HAMar = 0;}else{$HAMar=$AMar->jml;}
$AApr = DB::table('vgrafik')->select(DB::raw('IFNULL(jumlah,0) as jml'))->where([['tahun',$tahun],['bulan','April'],['status','FINISH']])->first();			
if($AApr==''){$HAApr = 0;}else{$HAApr=$AApr->jml;}
$AMay = DB::table('vgrafik')->select(DB::raw('IFNULL(jumlah,0) as jml'))->where([['tahun',$tahun],['bulan','May'],['status','FINISH']])->first();			
if($AMay==''){$HAMay = 0;}else{$HAMay=$AMay->jml;}
$AJun = DB::table('vgrafik')->select(DB::raw('IFNULL(jumlah,0) as jml'))->where([['tahun',$tahun],['bulan','June'],['status','FINISH']])->first();			
if($AJun==''){$HAJun = 0;}else{$HAJun=$AJun->jml;}
$AJul = DB::table('vgrafik')->select(DB::raw('IFNULL(jumlah,0) as jml'))->where([['tahun',$tahun],['bulan','July'],['status','FINISH']])->first();			
if($AJul==''){$HAJul = 0;}else{$HAJul=$AJul->jml;}
$AAug = DB::table('vgrafik')->select(DB::raw('IFNULL(jumlah,0) as jml'))->where([['tahun',$tahun],['bulan','August'],['status','FINISH']])->first();			
if($AAug==''){$HAAug = 0;}else{$HAAug=$AAug->jml;}
$ASep = DB::table('vgrafik')->select(DB::raw('IFNULL(jumlah,0) as jml'))->where([['tahun',$tahun],['bulan','September'],['status','FINISH']])->first();			
if($ASep==''){$HASep = 0;}else{$HASep=$ASep->jml;}
$AOct = DB::table('vgrafik')->select(DB::raw('IFNULL(jumlah,0) as jml'))->where([['tahun',$tahun],['bulan','October'],['status','FINISH']])->first();			
if($AOct==''){$HAOct = 0;}else{$HAOct=$AOct->jml;}
$ANov = DB::table('vgrafik')->select(DB::raw('IFNULL(jumlah,0) as jml'))->where([['tahun',$tahun],['bulan','November'],['status','FINISH']])->first();			
if($ANov==''){$HANov = 0;}else{$HANov=$ANov->jml;}
$ADec = DB::table('vgrafik')->select(DB::raw('IFNULL(jumlah,0) as jml'))->where([['tahun',$tahun],['bulan','December'],['status','FINISH']])->first();			
if($ADec==''){$HADec = 0;}else{$HADec=$ADec->jml;}	
/* reject */			
$RJan = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','January'],['status','CANCEL']])->first();			
if($RJan==''){$RRJan = 0;}else{$RRJan=$RJan->jumlah;}	
$RFeb = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','February'],['status','CANCEL']])->first();			
if($RFeb==''){$RRFeb = 0;}else{$RRFeb=$RFeb->jumlah;}
$RMar = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','March'],['status','CANCEL']])->first();			
if($RMar==''){$RRMar = 0;}else{$RRMar=$RMar->jumlah;}
$RApr = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','April'],['status','CANCEL']])->first();			
if($RApr==''){$RRApr = 0;}else{$RRApr=$RApr->jumlah;}
$RMay = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','May'],['status','CANCEL']])->first();			
if($RMay==''){$RRMay = 0;}else{$RRMay=$RMay->jumlah;}
$RJun = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','June'],['status','CANCEL']])->first();			
if($RJun==''){$RRJun = 0;}else{$RRJun=$RJun->jumlah;}
$RJul = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','July'],['status','CANCEL']])->first();			
if($RJul==''){$RRJul = 0;}else{$RRJul=$RJul->jumlah;}
$RAug = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','August'],['status','CANCEL']])->first();			
if($RAug==''){$RRAug = 0;}else{$RRAug=$RAug->jumlah;}
$RSep = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','September'],['status','CANCEL']])->first();			
if($RSep==''){$RRSep = 0;}else{$RRSep=$RSep->jumlah;}
$ROct = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','October'],['status','CANCEL']])->first();			
if($ROct==''){$RROct = 0;}else{$RROct=$ROct->jumlah;}
$RNov = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','November'],['status','CANCEL']])->first();			
if($RNov==''){$RRNov = 0;}else{$RRNov=$RNov->jumlah;}
$RDec = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','December'],['status','CANCEL']])->first();			
if($RDec==''){$RRDec = 0;}else{$RRDec=$RDec->jumlah;}
		
	
/* progress */			
$PJan = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','January']])->whereNotIn('status',['FINISH','CANCEL','NEW'])->first();			
if($PJan==''){$PPJan = 0;}else{$PPJan=$PJan->jumlah;}
$PFeb = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','February']])->whereNotIn('status',['FINISH','CANCEL','NEW'])->first();			
if($PFeb==''){$PPFeb = 0;}else{$PPFeb=$PFeb->jumlah;}
$PMar = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','March']])->whereNotIn('status',['FINISH','CANCEL','NEW'])->first();			
if($PMar==''){$PPMar = 0;}else{$PPMar=$PMar->jumlah;}
$PApr = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','April']])->whereNotIn('status',['FINISH','CANCEL','NEW'])->first();			
if($PApr==''){$PPApr = 0;}else{$PPApr=$PApr->jumlah;}
$PMay = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','May']])->whereNotIn('status',['FINISH','CANCEL','NEW'])->first();			
if($PMay==''){$PPMay = 0;}else{$PPMay=$PMay->jumlah;}
$PJun = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','June']])->whereNotIn('status',['FINISH','CANCEL','NEW'])->first();			
if($PJun==''){$PPJun = 0;}else{$PPJun=$PJun->jumlah;}
$PJul = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','July']])->whereNotIn('status',['FINISH','CANCEL','NEW'])->first();			
if($PJul==''){$PPJul = 0;}else{$PPJul=$PJul->jumlah;}
$PAug = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','August']])->whereNotIn('status',['FINISH','CANCEL','NEW'])->first();			
if($PAug==''){$PPAug = 0;}else{$PPAug=$PAug->jumlah;}
$PSep = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','September']])->whereNotIn('status',['FINISH','CANCEL','NEW'])->first();			
if($PSep==''){$PPSep = 0;}else{$PPSep=$PSep->jumlah;}
$POct = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','October']])->whereNotIn('status',['FINISH','CANCEL','NEW'])->first();			
if($POct==''){$PPOct = 0;}else{$PPOct=$POct->jumlah;}
$PNov = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','November']])->whereNotIn('status',['FINISH','CANCEL','NEW'])->first();			
if($PNov==''){$PPNov = 0;}else{$PPNov=$PNov->jumlah;}
$PDec = DB::table('vgrafik')->select('jumlah')->where([['tahun',$tahun],['bulan','December']])->whereNotIn('status',['FINISH','CANCEL','NEW'])->first();			
if($PDec==''){$PPDec = 0;}else{$PPDec=$PDec->jumlah;}
		
return response()->json(['dataA'=>[$HAJan, $HAFeb, $HAMar, $HAApr , $HAMay, $HAJun, $HAJul, $HAAug, $HASep, $HAOct, $HANov, $HADec],'dataB'=>[$RRJan, $RRFeb,$RRMar,$RRApr,$RRMay,$RRJun,$RRJul,$RRAug,$RRSep,$RROct,$RRNov,$RRDec],'dataC'=>[$PPJan,$PPFeb,$PPMar,$PPApr,$PPMay,$PPJun,$PPJul,$PPAug,$PPSep,$PPOct,$PPNov,$PPDec]]);
    }
/* grafik */




	
	/* Ubis */
		   public function GetProfileUbisReviewerM()
    {
       if(Auth::guard('karyawan')->user()->level == 'MANAGER UBIS' || Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
         {
            return response()->json(true);
         }
         else
         {
            return response()->json('error',500);
         }
    }
	
	 public function GetProfileUbisReviewerGMU()
    {
       if(Auth::guard('karyawan')->user()->level == 'GENERAL MANAGER UBIS' || Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
         {
            return response()->json(true);
         }
         else
         {
            return response()->json('error',500);
         }
    }
	
	 public function GetProfileUbisReviewerEGMU()
    {
       if(Auth::guard('karyawan')->user()->level == 'EXECUTIVE GENERAL MANAGER UBIS' || Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
         {
            return response()->json(true);
         }
         else
         {
            return response()->json('error',500);
         }
    }
	
	/* Ubis */
	
	
	
	/* get project by level */
    public function GetProjectApproval(Request $request)
    {
		if(Auth::guard('karyawan')->user()->level == 'MANAGER UBIS')
		{
			$status = 'UBIS - MANAGER';
			$query = DB::table('vprojectimplementation')
									->where(function ($query) {
    $query->where([['status','UBIS - MANAGER'],['area',Auth::guard('karyawan')->user()->area]])
          ->orWhere([['status','UBIS - MANAGER'],['area',Auth::guard('karyawan')->user()->area2]]);
})
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'GENERAL MANAGER UBIS')
		{
			$status = '';
			$query = DB::table('vprojectimplementation')
			->where('status','UBIS - GENERAL MANAGER')
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'EXECUTIVE GENERAL MANAGER UBIS')
		{ 
			$query = DB::table('vprojectimplementation')
			->where('status','UBIS - EXECUTIVE GENERAL MANAGER')
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'STAFF PROCUREMENT')
		{ 
			$query = DB::table('vprojectimplementation')
			->where([['status','PROCUREMENT - STAFF PROCUREMENT'],['area',Auth::guard('karyawan')->user()->area]])
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'MANAGER PROCUREMENT')
		{ 
			$query = DB::table('vprojectimplementation')
			->where('status','PROCUREMENT - MANAGER PROCUREMENT')
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'DIRECTOR')
		{
			$query = DB::table('vprojectimplementation')
			->where('status','DIRECTOR')
			->orderBy('id','DESC');
		}
        $perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
		
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
			}
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
		}
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
		}
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
			}
        return $query->paginate($perPage);
    }
	
    public function GetProjectRepair(Request $request)
    {
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
		
		if(Auth::guard('karyawan')->user()->level == 'MANAGER UBIS')
		{ 
			$query = DB::table('vprojectimplementation')
						->where(function ($query) {
    $query->where([['status','REPAIR UBIS - MANAGER'],['area',Auth::guard('karyawan')->user()->area]])
          ->orWhere([['status','REPAIR UBIS - MANAGER'],['area',Auth::guard('karyawan')->user()->area2]]);
})
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'GENERAL MANAGER UBIS')
		{
			$query = DB::table('vprojectimplementation')
			->where('status','REPAIR UBIS - GENERAL MANAGER')
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'EXECUTIVE GENERAL MANAGER UBIS')
		{
			 
			$query = DB::table('vprojectimplementation')
			->where('status','REPAIR UBIS - EXECUTIVE GENERAL MANAGER')
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'STAFF PROCUREMENT')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','REPAIR PROCUREMENT - STAFF PROCUREMENT'],['area', Auth::guard('karyawan')->user()->area]])
			->orderBy('id','DESC');
		}
        
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
			}
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
		}
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
		}
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
			}
        return $query->paginate($perPage);
    }
	
	
	
	 public function GetProjectProgressAll(Request $request)
    {
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
		if(Auth::guard('karyawan')->user()->level == 'MANAGER UBIS')
		{
			$query = DB::table('vprojectimplementation')
			->where('area',Auth::guard('karyawan')->user()->area)
			->whereNotIn('status',['FINISH','CANCEL','NEW'])
            ->orWhere('area',Auth::guard('karyawan')->user()->area2)
            ->whereNotIn('status',['FINISH','CANCEL','NEW'])
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'GENERAL MANAGER UBIS')
		{
			$query = DB::table('vprojectimplementation')
			->whereNotIn('status',['FINISH','CANCEL','NEW'])
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'EXECUTIVE GENERAL MANAGER UBIS')
		{
			$query = DB::table('vprojectimplementation')
			->whereNotIn('status',['FINISH','CANCEL','NEW'])
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'STAFF PROCUREMENT')
		{
			$query = DB::table('vprojectimplementation')
			->where('area',Auth::guard('karyawan')->user()->area)
			->whereNotIn('status',['FINISH','CANCEL','NEW'])
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'MANAGER PROCUREMENT')
		{
			$query = DB::table('vprojectimplementation')
			->whereNotIn('status',['FINISH','CANCEL','NEW'])
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'DIRECTOR')
		{
			$query = DB::table('vprojectimplementation')
			->whereNotIn('status',['FINISH','CANCEL','NEW'])
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
		{
			$query = DB::table('vprojectimplementation')
			->whereNotIn('status',['FINISH','CANCEL','NEW'])
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'OFFICER PROCUREMENT')
		{
			$query = DB::table('vprojectimplementation')
			->whereNotIn('status',['FINISH','CANCEL','NEW'])
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'OFFICER PSC')
		{
			$query = DB::table('vprojectimplementation')
			->whereNotIn('status',['FINISH','CANCEL','NEW'])
			->orderBy('id','DESC');
		}
		
        
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
	
	
	
	 public function GetProjectRejectAll(Request $request)
    {
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
		if(Auth::guard('karyawan')->user()->level == 'MANAGER UBIS')
		{ 
						$query = DB::table('vprojectimplementation')
			->where(function ($query) {
    $query->where([['status','CANCEL'],['area',Auth::guard('karyawan')->user()->area]])
          ->orWhere([['status','CANCEL'],['area',Auth::guard('karyawan')->user()->area2]]);
})
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'GENERAL MANAGER UBIS')
		{
			$query = DB::table('vprojectimplementation')
			 ->where('status','CANCEL')
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'EXECUTIVE GENERAL MANAGER UBIS')
		{
			$query = DB::table('vprojectimplementation')
			 ->where('status','CANCEL')
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'STAFF PROCUREMENT')
		{
			$query = DB::table('vprojectimplementation')
			 ->where([['status','CANCEL'],['area',Auth::guard('karyawan')->user()->area]])
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'MANAGER PROCUREMENT')
		{
			$query = DB::table('vprojectimplementation')
			 ->where('status','CANCEL')
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'DIRECTOR')
		{
			$query = DB::table('vprojectimplementation')
			 ->where('status','CANCEL')
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
		{
			$query = DB::table('vprojectimplementation')
			 ->where('status','CANCEL')
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'OFFICER PROCUREMENT')
		{
			$query = DB::table('vprojectimplementation')
			 ->where('status','CANCEL')
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'OFFICER PSC')
		{
			$query = DB::table('vprojectimplementation')
			 ->where('status','CANCEL')
			->orderBy('id','DESC');
		}
		
        
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
	
	 public function GetProjectFinalAll(Request $request)
    {
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
		if(Auth::guard('karyawan')->user()->level == 'MANAGER UBIS')
		{ 
			$query = DB::table('vprojectimplementation')
			->where(function ($query) {
    $query->where([['status','FINISH'],['area',Auth::guard('karyawan')->user()->area]])
          ->orWhere([['status','FINISH'],['area',Auth::guard('karyawan')->user()->area2]]);
})
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'STAFF PROCUREMENT')
		{ 
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['area',Auth::guard('karyawan')->user()->area]])
			->orderBy('id','DESC');
		}
		else
		{
			$query = DB::table('vprojectimplementation')
			->where('status','FINISH')
			->orderBy('id','DESC');
		}
		
        
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('area', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('projectid', 'LIKE', $like)
			->orWhere('area', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
			->orWhere('area', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('projectid', 'LIKE', $like)
			->orWhere('area', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	 public function GetProjectFinalAllB2S(Request $request)
    {
		$tahun = $request->tahun;
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
		if(Auth::guard('karyawan')->user()->level == 'MANAGER UBIS')
		{ 
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['area',Auth::guard('karyawan')->user()->area],['infratype','B2S']])
			->orWhere([['status','FINISH'],['area',Auth::guard('karyawan')->user()->area2],['infratype','B2S']])
			->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'GENERAL MANAGER UBIS')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['infratype','B2S']])
			->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'EXECUTIVE GENERAL MANAGER UBIS')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['infratype','B2S']])
			->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'STAFF PROCUREMENT')
		{ 
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['area',Auth::guard('karyawan')->user()->area],['infratype','B2S']])
			->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'MANAGER PROCUREMENT')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['infratype','B2S']])
			->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'DIRECTOR')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['infratype','B2S']])
			->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		
		if(Auth::guard('karyawan')->user()->level == 'OFFICER PROCUREMENT')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['infratype','B2S']])
			->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		
		if(Auth::guard('karyawan')->user()->level == 'OFFICER PSC')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['infratype','B2S']])
			->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		
        
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('area', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('projectid', 'LIKE', $like)
			->orWhere('area', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
			->orWhere('area', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('projectid', 'LIKE', $like)
			
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
	 public function GetProjectFinalAllUNTAPPED(Request $request)
    {
		$tahun = $request->tahun;
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
		if(Auth::guard('karyawan')->user()->level == 'MANAGER UBIS')
		{ 
			$query = DB::table('vprojectimplementation')
			->where(function ($query) {
    $query->where([['status','FINISH'],['area',Auth::guard('karyawan')->user()->area],['infratype','UNTAPPED']])
          ->orWhere([['status','FINISH'],['area',Auth::guard('karyawan')->user()->area2],['infratype','UNTAPPED']]);
})->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'GENERAL MANAGER UBIS')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['infratype','UNTAPPED']])
			->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'EXECUTIVE GENERAL MANAGER UBIS')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['infratype','UNTAPPED']])
			->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'STAFF PROCUREMENT')
		{ 
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['area',Auth::guard('karyawan')->user()->area],['infratype','UNTAPPED']])
			->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'MANAGER PROCUREMENT')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['infratype','UNTAPPED']])
			->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'DIRECTOR')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['infratype','UNTAPPED']])
			->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'OFFICER PROCUREMENT')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['infratype','UNTAPPED']])
			->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'OFFICER PSC')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','FINISH'],['infratype','UNTAPPED']])
			->whereYear('created_at', $tahun)
			->orderBy('id','DESC');
		}
		
        
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
	/* get project by level */
	
	
	
	/* approved project by level */
	


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
	/* approved project by level */
	
	
	
	
	/* Director */
			   public function GetProfileBOD()
    {
       if(Auth::guard('karyawan')->user()->level == 'DIRECTOR' || Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
         {
            return response()->json(true);
         }
         else
         {
            return response()->json('error',500);
         }
    }
	/* Director */
	
	
	
	
	
	
	


	       public function GetProfileOfficerPSC()
    {
       if(Auth::guard('karyawan')->user()->level == 'OFFICER PSC' || Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
         {
            return response()->json('ok');
         }
         else
         {
            return response()->json('error',500);
         }
    }
	
	  public function GetProjectPSC(Request $request)
    {
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = DB::table('vprojectpr')
            ->orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('sitename', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like)
			->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('sitename', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like)
			->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('sitename', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like)
			->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('sitename', 'LIKE', $like)
            ->orWhere('projectid', 'LIKE', $like)
			->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
	
	  public function GetProjectSPPO(Request $request)
    {
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = DB::table('vprojectpo')->where('area',Auth::guard('karyawan')->user()->area)
            ->orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
			->orWhere('area', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('projectid', 'LIKE', $like)
			->orWhere('area', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
			->orWhere('area', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('projectid', 'LIKE', $like)
			->orWhere('area', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
	  public function SubmitPR(Request $request)
    {
        $valid = $this->validate($request, [
         'message' => 'required',
		 'area' => 'required',
         'id' => 'required|numeric|not_in:0',
    ]);
if (!$valid)
    {
    $projectid = $request->get('projectid');  
    $id = $request->get('id');  
    $pr =  Input::get('pr');
    $area =  Input::get('area');
    $message =  'Pesan APPROVAL dari '.Auth::guard('karyawan')->user()->name.' :'.Input::get('message');


$dataSet = [];
$dataSet2 = [];
$dataSet4 = [];

if(count($pr) > 0)
{
    foreach ($pr as $key =>$ss) {
$dataSet2[] = ['project_id'=>$id,'workjobs'=>strtoupper($ss['pekerjaan']),'nopr'=>strtoupper($ss['noPR']),'po'=>'','created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
 }
$pesan = User::where([['level','STAFF PROCUREMENT'],['area',$area]])->select('id','email','name')->get(); 
foreach ($pesan as $p) {
             $dataSet4[] = ['project_id'=>$id,'users_id'=>$p['id'],'message'=>'Project '.$projectid.' Menunggu Approval','status'=>'0', 'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
$emailNya[] = $p['email'];

}
if(count($emailNya)>0)
{
	$masukEmail = array(
        'projectid' => $projectid,
        'message' => $message,
    'kata' => 'Silahkan Masukan No PO untuk Project ID '.$projectid,
        'name' => Auth::guard('karyawan')->user()->name); 
$this->KirimEmailKeDua($emailNya,$masukEmail) ;
}

$create = ProjectStatus::create(['project_id'=>$id,'user_id'=>Auth::guard('karyawan')->user()->id,'status'=>'APPROVED','message'=>$message]);   
Nopopr::insert($dataSet2); // Eloquent approach
Project::where('id',$request->get('id'))->update(['status_id'=>$create->id,'updated_at'=>Carbon::now()]);
 return response()->json(['success'=>'NO PR berhasil dimasukan']);
}
else
{
	return response()->json(['nodata'=>'Tidak ada data yang dimasukan']);
}       
    }
else
    {
 return response()->json('error', $valid);
    }
    }
	  public function SubmitPO(Request $request)
    {
        $valid = $this->validate($request, [
         'message' => 'required',
		 'area' => 'required',
         'id' => 'required|numeric|not_in:0',
    ]);
if (!$valid)
    {
    $projectid = $request->get('projectid');  
    $id = $request->get('id');  
    $po =  Input::get('po');
    $area =  Input::get('area');
    $message =  'Pesan APPROVAL dari '.Auth::guard('karyawan')->user()->name.' :'.Input::get('message');


$dataSet = [];
$dataSet2 = [];
$dataSet4 = [];

if(count($po) > 0)
{
	
    foreach ($po as $key =>$ss) {
$dataSet2[] = ['project_id'=>$id,'workjobs'=>strtoupper($ss['workjobs']),'nopr'=>strtoupper($ss['nopr']),'po'=>strtoupper($ss['po']),'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
 }


$create = ProjectStatus::create(['project_id'=>$id,'user_id'=>Auth::guard('karyawan')->user()->id,'status'=>'APPROVED','message'=>$message]);   
Nopopr::where('project_id',$id)->delete();
Nopopr::insert($dataSet2); // Eloquent approach
Project::where('id',$request->get('id'))->update(['status_id'=>$create->id,'updated_at'=>Carbon::now()]);
 return response()->json(['success'=>'NO PR berhasil dimasukan']);
}
else
{
	return response()->json(['nodata'=>'Tidak ada data yang dimasukan']);
}       
    }
else
    {
 return response()->json('error', $valid);
    }
    }

public function KirimEmailKeDua($emailNya,$isipesan)
    {

      $content = view('email_content_pr_po')->with($isipesan);
Mail::send('email', ['contentMessage' => $content], function($messageNya) use ($emailNya) {
         $messageNya->to($emailNya)->subject('Notification MITRATel-RAVTING (MITRATEL ELECTRONIC REVIEW AND APPROVAL BUDGETING)');
         $messageNya->from('MITRATel-RAVTING@mitratel.com','MITRATel-RAVTING (MITRATEL ELECTRONIC REVIEW AND APPROVAL BUDGETING)');
      });

    }	
	
	
       public function GetProjectDetailPRPO($id)
    {
$cari = Project::where('id',$id)->firstOrFail();
if(!$cari)
{
	return response()->json('error', 500);
}	
else
{
$pesanlengkap = DB::table('project_status')
  ->join('users','project_status.user_id','=','users.id')
  ->select('project_status.status','project_status.message','project_status.created_at','users.name','users.level')
  ->where('project_status.project_id',$id)
  ->orderBy('project_status.id','ASC')->get();
$noprpo = Nopopr::where('project_id',$id)->get();
return response()->json(['pesanlengkap'=>$pesanlengkap,'noprpo'=>$noprpo]);
   

}      
    }
	
	   public function GetProjectDetailNya($id,$kode,$regional,$area)
    {
$cari = Project::where('id',$id)->firstOrFail();
if(!$cari)
{
  return response()->json('error', 500);
} 
else
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
  $noprpo = Nopopr::where('project_id',$kode)->orderBy('id','ASC')->get();
  $pesanlengkap = DB::table('project_status')
  ->join('users','project_status.user_id','=','users.id')
  ->select('project_status.status','project_status.message','project_status.created_at','users.name','users.level')
  ->where('project_status.project_id',$id)
  ->orderBy('project_status.id','ASC')->get();
 

return response()->json(['standard'=>$standardNya,'additional'=>$additional,'pesan'=>$pesan,'pesanlengkap'=>$pesanlengkap,'noprpo'=>$noprpo]);
  
  }
  else
  {
$standard = DB::table('vprojectimplementationstandard')->select('id','project_implementation_id','tonase','pondasi','biayatower','erection_tower','transportasi','pondasi_greenfiled','bts_outdoor','me','fy','pln_connect')->where('project_implementation_id',$kode)->first();
if(empty($standard))
{
  $standard = ['id'=>0,'project_implementation_id'=>0,'tonase'=>0,'pondasi'=>0,'biayatower'=>0,'erection_tower'=>0,'transportasi'=>0,'pondasi_greenfiled'=>0,'bts_outdoor'=>0,'me'=>0,'fy'=>0,'pln_connect'=>0];
  $pesan = DB::table('vprojectstatus')
            ->select('status','created_at', 'name', 'level')
      ->where([['project_id',$id],['status','APPROVED']])
            ->orderBy('created_at','ASC')
      ->get();
      $noprpo = Nopopr::where('project_id',$id)->orderBy('id','ASC')->get();
  $additional = DB::table('vprojectimplementationadditional')->select('pekerjaan','satuan','qty','harga','total')->where('project_implementation_id',$kode)->orderBy('id','ASC')->get();
  $pesanlengkap = DB::table('project_status')
  ->join('users','project_status.user_id','=','users.id')
  ->select('project_status.status','project_status.message','project_status.created_at','users.name','users.level')
  ->where('project_status.project_id',$id)
  ->orderBy('project_status.id','ASC')->get();
  

return response()->json(['standard'=>$standard,'additional'=>$additional,'pesan'=>$pesan,'pesanlengkap'=>$pesanlengkap,'noprpo'=>$noprpo]);
  
}
else
{
  $pesan = DB::table('vprojectstatus')
            ->select('status','created_at', 'name', 'level')
      ->where([['project_id',$id],['status','APPROVED']])
            ->orderBy('created_at','ASC')
      ->get();
	  $noprpo = Nopopr::where('project_id',$id)->orderBy('id','ASC')->get();
  $additional = DB::table('vprojectimplementationadditional')->select('pekerjaan','satuan','qty','harga','total')->where('project_implementation_id',$kode)->orderBy('id','ASC')->get();
  $pesanlengkap = DB::table('project_status')
  ->join('users','project_status.user_id','=','users.id')
  ->select('project_status.status','project_status.message','project_status.created_at','users.name','users.level')
  ->where('project_status.project_id',$id)
  ->orderBy('project_status.id','ASC')->get();
  

return response()->json(['standard'=>$standard,'additional'=>$additional,'pesan'=>$pesan,'pesanlengkap'=>$pesanlengkap,'noprpo'=>$noprpo]);
   
}
}
}    
}      
    }

	
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
	
	
	public function printPDF(Request $request)
	{
		
$header = $request->palanya;		
$standard =  $request->standard;	
$additional =  $request->additional;
$noprpo =  $request->noprpo;
$pesan =  $request->pesan;
if(!$request->pesanreject)
{
	$pesanreject =  [];
}
else
{
$pesanreject =  $request->pesanreject;
}
$data = ['header'=>$header , 'standard'=>$standard,'additional'=>$additional,'noprpo'=>$noprpo,'pesan'=>$pesan,'pesanreject'=>$pesanreject];
PDF::setOptions(['dpi' => 150, 'defaultFont' => 'sans-serif']);		
$pdf = PDF::loadView('DownloadPDF', $data)->setPaper('a4', 'portrait');
return $pdf->download($header['projectid'].'.pdf');


	}
	
	
		
	public function downloadExcel(Request $request)
	{
		
$header = $request->palanya;		
$standard =  $request->standard;	
$additional =  $request->additional;
$noprpo =  $request->noprpo;
$pesan =  $request->pesan;
if(!$request->pesanreject)
{
	$pesanreject =  [];
}
else
{
$pesanreject =  $request->pesanreject;
}
		
return Excel::create($header['projectid'], function($excel) use ($header , $standard,$additional,$noprpo,$pesan,$pesanreject){
    $excel->sheet($header['projectid'], function($sheet) use ($header , $standard,$additional,$noprpo,$pesan,$pesanreject){
			 $sheet->loadView('DownloadExcel')
			 ->with('header',$header)
			 ->with('standard',$standard)
			 ->with('additional',$additional)
			 ->with('noprpo',$noprpo)
			 ->with('pesan',$pesan)
			 ->with('pesanreject',$pesanreject);
			 $sheet->setOrientation('landscape');
			});
	
})->export('xlsx');	


	}
	
	
	public function downloadExcelData(Request $request)
	{
$data = $request->data;	
$ShowData = DB::table('DownloadExcel')
->whereIn('id', $data)->get();

foreach($ShowData as $a)
{
	$detail = DB::table('vprojectimplementationadditional')->where('project_implementation_id', $a->projectimplementationid)->get();
	$noprpoNya = Nopopr::where('project_id',$a->id)->orderBy('id','ASC')->get();
	$kode = $a->id;
	$additional[] = ['id'=>$kode,'detail'=>$detail];
	$noprpo[] = ['id'=>$kode,'detail'=>$noprpoNya];
}
$datanya = ['head'=>$ShowData, 'additional'=>$additional, 'noprpo'=>$noprpo];
return Excel::create('ExportData', function($excel) use ($datanya){
    $excel->sheet('ExportData', function($sheet) use ($datanya){
			 $sheet->loadView('DownloadExcelData')
			 ->with('data',$datanya);
			 $sheet->setOrientation('landscape');
			});
	
})->export('xlsx');	


	}
	
	
	
	
	
	
	
public function KirimEmailDetail($emailNya,$isipesan)
    {

      $content = view('email_content_detail')->with($isipesan);
Mail::send('email', ['contentMessage' => $content], function($messageNya) use ($emailNya) {
         $messageNya->to($emailNya)->subject('Notification MITRATel-RAVTING (MITRATEL ELECTRONIC REVIEW AND APPROVAL BUDGETING)');
         $messageNya->from('MITRATel-RAVTING@mitratel.com','MITRATel-RAVTING (MITRATEL ELECTRONIC REVIEW AND APPROVAL BUDGETING)');
      });

    }

	
	 public function ApprovalProjectMU(Request $request)
    {
		$valid = $this->validate($request, [
        'message' => 'required',
        'kabupaten' => 'required',
        'sitename' => 'required|max:255',
        'mitra' => 'required|max:255',
        'towerimplementation' => 'required|numeric|not_in:0',
        'clusterimplementation' => 'required',
    ]);
if (!$valid)
    {
if($request->get('infratype') == 'UNTAPPED')
{
$plafonnya = $this->avgUNTAPPED();    
$id = $request->get('id');	
	$projectid = $request->get('projectid');	
	$message = 'Pesan APPROVAL dari '.Auth::guard('karyawan')->user()->name.' :'.$request->get('message');
	$statusnya = $request->get('statusnya');
	$created = $request->get('created');
	$status	= 'APPROVED';
$dataSet4 = [];
$create = ProjectStatus::create(['project_id'=>$id,'user_id'=>Auth::guard('karyawan')->user()->id,'status'=>$status,'message'=>$message]);	
$cekPRoject = ProjectImplementations::where('project_id',$id)->first();
if($cekPRoject)
{
	ProjectImplementations::where('project_id',$id)->delete();
	ProjectImplementationsAddtional::where('project_implementation_id',$cekPRoject->id)->delete();
	ProjectImplementationsStandard::where('project_implementation_id',$cekPRoject->id)->delete();
}

$masukPRoject = ProjectImplementations::create(['project_id'=>$id,'towerimplementation'=>Input::get('towerimplementation'),'clusterimplementation'=>strtoupper(Input::get('clusterimplementation')),'mitra'=>strtoupper(Input::get('mitra'))]);	

$pesan = User::where([['level','GENERAL MANAGER AREA'],['AREA',$request->area]])->select('id','email','name')->get();
foreach ($pesan as $p) {
$dataSet4[] = ['project_id'=>$id,'users_id'=>$p['id'],'message'=>'Project '.$projectid.' Menunggu Approval','status'=>'0', 'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];

		
		$emailNya[] = $p['email'];

}

//Pemberitahuan::insert($dataSet4); // Eloquent approach
$array_bulan = array(1=>"I","II","III", "IV", "V","VI","VII","VIII","IX","X", "XI","XII");
$pp = DB::table('vnodoc')->select('nodoc')->first();
$nodoc = ($pp->nodoc+1).'/'.$projectid.'/'.$array_bulan[Carbon::createFromFormat('Y-m-d H:i:s', $created)->month].'/'.Carbon::createFromFormat('Y-m-d H:i:s', $created)->year;
Project::where('id',$id)->update(['no_doc'=>$nodoc,'budget'=>$plafonnya,'tower'=>Input::get('towerimplementation'),'cluster'=>strtoupper(Input::get('clusterimplementation')),'infratype'=>$request->get('infratype'),'sitename'=>$request->get('sitename'),'kabupaten'=>$request->get('kabupaten'),'qty_lahan'=>$request->get('qty_lahan'),'lahan'=>$request->get('lahan'),'cme'=>$request->get('cme'),'pln'=>$request->get('pln'),'addtransport'=>$request->get('addtransport'),'addpln'=>$request->get('addpln'),'addcme'=>$request->get('addcme'),'biayatower'=>$request->get('biayatower'),'longitude'=>$request->get('longitude'),'latituted'=>$request->get('latituted'),'mitra'=>strtoupper(Input::get('mitra')),'status_id'=>$create->id,'status'=>$statusnya,'updated_at'=>Carbon::now()]);
$vprojectimplementation = DB::table('vprojectimplementation')->where('id',$id)->first();
$masukEmail = array(
        'projectid' => $projectid,
        'message' => $message,
        'infratype' => $request->get('infratype'),
        'vprojectimplementation' => $vprojectimplementation,
    'kata' => 'Project '.$projectid.' Menunggu Approval Anda',
        'name' => Auth::guard('karyawan')->user()->name); 
$this->KirimEmailDetail($emailNya,$masukEmail) ;
$this->SendingNotif($request->get('id'),$status,'GENERAL MANAGER AREA',$request->area) ;

return response()->json(['success'=>'Project Menunggu Approval GENERAL MANAGER AREA']);	
}
else
{
    $plafonnya = $this->avgB2S(); 
	$id = $request->get('id');	
	$projectid = $request->get('projectid');	
	$message = 'Pesan APPROVAL dari '.Auth::guard('karyawan')->user()->name.' :'.$request->get('message');
	$statusnya = $request->get('statusnya');
	$created = $request->get('created');
	$status	= 'APPROVED';
	$standard =  Input::get('standard');
	$addtional =  Input::get('addtional');
$dataSet = [];
$dataSet2 = [];
$dataSet4 = [];
$create = ProjectStatus::create(['project_id'=>$id,'user_id'=>Auth::guard('karyawan')->user()->id,'status'=>$status,'message'=>$message]);	
$cekPRoject = ProjectImplementations::where('project_id',$id)->first();
if($cekPRoject)
{
	ProjectImplementations::where('project_id',$id)->delete();
	ProjectImplementationsAddtional::where('project_implementation_id',$cekPRoject->id)->delete();
	ProjectImplementationsStandard::where('project_implementation_id',$cekPRoject->id)->delete();
}

$masukPRoject = ProjectImplementations::create(['project_id'=>$id,'towerimplementation'=>strtoupper(Input::get('towerimplementation')),'clusterimplementation'=>strtoupper(Input::get('clusterimplementation')),'sitenametenant'=>strtoupper(Input::get('sitenametenant')),'sitenamepo'=>strtoupper(Input::get('sitenamepo')),'mitra'=>strtoupper(Input::get('mitra')),'contract'=>strtoupper(Input::get('contract')),'jobs'=>strtoupper(Input::get('jobs'))]);	
ProjectImplementationsStandard::insert(['project_implementation_id'=>$masukPRoject->id,'tonase'=>$standard['tonase'],'pondasi'=>$standard['pondasi'],'biayatower'=>$standard['biayatower'],'erection_tower'=>$standard['erection_tower'],'transportasi'=>$standard['transportasi'],'pondasi_greenfiled'=>$standard['pondasi_greenfiled'],'bts_outdoor'=>$standard['bts_outdoor'],'me'=>$standard['me'],'fy'=>$standard['fy'],'pln_connect'=>$standard['pln_connect'],'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()]); // Eloquent approach
if(count($addtional) > 0)
{
	foreach ($addtional as $key =>$ss) {
$dataSet2[] = ['project_implementation_id'=>$masukPRoject->id,'pekerjaan'=>strtoupper($ss['pekerjaan']),'satuan'=>strtoupper($ss['satuan']),'qty'=>$ss['qty'],'harga'=>$ss['harga'],'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
 }			 
ProjectImplementationsAddtional::insert($dataSet2); // Eloquent approach
 
}
$pesan = User::where([['level','GENERAL MANAGER AREA'],['AREA',$request->area]])->select('id','email','name')->get();
foreach ($pesan as $p) {
             $dataSet4[] = ['project_id'=>$id,'users_id'=>$p['id'],'message'=>'Project '.$projectid.' Menunggu Approval','status'=>'0', 'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
$emailNya[] = $p['email'];

}


//Pemberitahuan::insert($dataSet4); // Eloquent approach
$array_bulan = array(1=>"I","II","III", "IV", "V","VI","VII","VIII","IX","X", "XI","XII");
$pp = DB::table('vnodoc')->select('nodoc')->first();
$nodoc = ($pp->nodoc+1).'/'.$projectid.'/'.$array_bulan[Carbon::createFromFormat('Y-m-d H:i:s', $created)->month].'/'.Carbon::createFromFormat('Y-m-d H:i:s', $created)->year;
Project::where('id',$id)->update(['no_doc'=>$nodoc,'tower'=>Input::get('towerimplementation'),'cluster'=>strtoupper(Input::get('clusterimplementation')),'budget'=>$plafonnya,'infratype'=>$request->get('infratype'),'sitename'=>$request->get('sitename'),'kabupaten'=>$request->get('kabupaten'),'qty_lahan'=>$request->get('qty_lahan'),'lahan'=>$request->get('lahan'),'cme'=>'0','pln'=>'0','addtransport'=>'0','addpln'=>'0','addcme'=>'0','biayatower'=>'0','longitude'=>$request->get('longitude'),'latituted'=>$request->get('latituted'),'mitra'=>strtoupper(Input::get('mitra')),'status_id'=>$create->id,'status'=>$statusnya,'updated_at'=>Carbon::now()]);
$vprojectimplementation = DB::table('vprojectimplementation')->where('id',$id)->first();
$masukEmail = array(
        'projectid' => $projectid,
        'message' => $message,
		'infratype' => $request->get('infratype'),
        'vprojectimplementation' => $vprojectimplementation,
    'kata' => 'Project '.$projectid.' Menunggu Approval Anda',
        'name' => Auth::guard('karyawan')->user()->name); 
$this->KirimEmailDetail($emailNya,$masukEmail) ;
$this->SendingNotif($request->get('id'),$status,'GENERAL MANAGER AREA',$request->area) ;
return response()->json(['success'=>'Project Menunggu Approval GENERAL MANAGER AREA']);
	
}

    }
else
    {
 return response()->json('error', $valid);
    }
    }

	
	  public function ApprovalProjectPM(Request $request)
    {
		$valid = $this->validate($request, [
         'message' => 'required',
         'kabupaten' => 'required',
        'sitename' => 'required|max:255',
        'levelnya' => 'required',
        'statusnya' => 'required',
    ]);
if (!$valid)
    {
		
$cekPRojectNya = Project::where('id',$request->get('id'))->first();		
if($request->get('infratype') == 'UNTAPPED')		
{
$plafonnya = $this->avgUNTAPPED(); 
$id = $request->get('id');	
	$projectid = $request->get('projectid');	
	$message = 'Pesan APPROVAL dari '.Auth::guard('karyawan')->user()->name.' :'.$request->get('message');
	$statusnya = $request->get('statusnya');
	$created = $request->get('created');
	$status	= 'APPROVED';
$levelnya = $request->get('levelnya');
$projectimplementationid = $request->get('projectimplementationid');
$dataSet4 = [];

$create = ProjectStatus::create(['project_id'=>$id,'user_id'=>Auth::guard('karyawan')->user()->id,'status'=>$status,'message'=>$message]);	

    ProjectImplementations::where('id',$projectimplementationid)->update(['towerimplementation'=>strtoupper(Input::get('towerimplementation')),'clusterimplementation'=>strtoupper(Input::get('clusterimplementation')),'mitra'=>strtoupper(Input::get('mitra'))]);
    ProjectImplementationsAddtional::where('project_implementation_id',$projectimplementationid)->delete();
    ProjectImplementationsStandard::where('project_implementation_id',$projectimplementationid)->delete();

$pesan = User::where('level',$request->get('levelnya'))->select('id','email','name')->get();
foreach ($pesan as $p) {
$dataSet4[] = ['project_id'=>$id,'users_id'=>$p['id'],'message'=>'Project '.$projectid.' Menunggu Approval','status'=>'0', 'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
$emailNya[] = $p['email'];

}


//Pemberitahuan::insert($dataSet4); // Eloquent approach
Project::where('id',$id)->update(['budget'=>$plafonnya,'infratype'=>$request->get('infratype'),'sitename'=>$request->get('sitename'),'kabupaten'=>$request->get('kabupaten'),'qty_lahan'=>$request->get('qty_lahan'),'lahan'=>$request->get('lahan'),'cme'=>$request->get('cme'),'pln'=>$request->get('pln'),'addtransport'=>$request->get('addtransport'),'addpln'=>$request->get('addpln'),'addcme'=>$request->get('addcme'),'biayatower'=>$request->get('biayatower'),'mitra'=>strtoupper(Input::get('mitra')),'status_id'=>$create->id,'status'=>$statusnya,'updated_at'=>Carbon::now()]);
$vprojectimplementation = DB::table('vprojectimplementation')->where('id',$id)->first();
$masukEmail = array(
        'projectid' => $projectid,
        'message' => $message,
        'infratype' => $request->get('infratype'),
        'vprojectimplementation' => $vprojectimplementation,
    'kata' => 'Project '.$projectid.' Menunggu Approval Anda',
        'name' => Auth::guard('karyawan')->user()->name); 
$this->KirimEmailDetail($emailNya,$masukEmail) ;
$this->SendingNotif($request->get('id'),$status,$levelnya,$cekPRojectNya->area) ;
return response()->json(['success'=>'Project Menunggu Approval '.$request->get('levelnya')]);	
}
else
{
	$plafonnya = $this->avgB2S(); 
	$id = $request->get('id');	
	$projectid = $request->get('projectid');	
	$message = 'Pesan APPROVAL dari '.Auth::guard('karyawan')->user()->name.' :'.$request->get('message');
	$statusnya = $request->get('statusnya');
	$created = $request->get('created');
	$status	= 'APPROVED';
	$standard =  Input::get('standard');
	$addtional =  Input::get('addtional');
	$levelnya = $request->get('levelnya');
	$projectimplementationid = $request->get('projectimplementationid');
$dataSet = [];
$dataSet2 = [];
$dataSet4 = [];
$create = ProjectStatus::create(['project_id'=>$id,'user_id'=>Auth::guard('karyawan')->user()->id,'status'=>$status,'message'=>$message]);	
ProjectImplementationsAddtional::where('project_implementation_id',$projectimplementationid)->delete();
ProjectImplementationsStandard::where('project_implementation_id',$projectimplementationid)->delete();
ProjectImplementations::where('id',$projectimplementationid)->update(['towerimplementation'=>strtoupper(Input::get('towerimplementation')),'clusterimplementation'=>strtoupper(Input::get('clusterimplementation')),'mitra'=>strtoupper(Input::get('mitra'))]);
if(count($addtional) > 0)
{
	foreach ($addtional as $key =>$ss) {
$dataSet2[] = ['project_implementation_id'=>$projectimplementationid,'pekerjaan'=>strtoupper($ss['pekerjaan']),'satuan'=>strtoupper($ss['satuan']),'qty'=>$ss['qty'],'harga'=>$ss['harga'],'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
 }			 
ProjectImplementationsAddtional::insert($dataSet2); // Eloquent approach
 
}

$pesan = User::where('level',$levelnya)->select('id','email','name')->get();
foreach ($pesan as $p) {
             $dataSet4[] = ['project_id'=>$id,'users_id'=>$p['id'],'message'=>'Project '.$projectid.' Menunggu Approval','status'=>'0', 'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
$emailNya[] = $p['email'];

}


ProjectImplementationsStandard::insert(['project_implementation_id'=>$projectimplementationid,'tonase'=>$standard['tonase'],'pondasi'=>$standard['pondasi'],'biayatower'=>$standard['biayatower'],'erection_tower'=>$standard['erection_tower'],'transportasi'=>$standard['transportasi'],'pondasi_greenfiled'=>$standard['pondasi_greenfiled'],'bts_outdoor'=>$standard['bts_outdoor'],'me'=>$standard['me'],'fy'=>$standard['fy'],'pln_connect'=>$standard['pln_connect'],'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()]); // Eloquent approach
//Pemberitahuan::insert($dataSet4); // Eloquent approach
Project::where('id',$id)->update(['budget'=>$plafonnya,'infratype'=>$request->get('infratype'),'sitename'=>$request->get('sitename'),'kabupaten'=>$request->get('kabupaten'),'qty_lahan'=>$request->get('qty_lahan'),'lahan'=>$request->get('lahan'),'cme'=>'0','pln'=>'0','addtransport'=>'0','addpln'=>'0','addcme'=>'0','biayatower'=>'0','mitra'=>strtoupper(Input::get('mitra')),'status_id'=>$create->id,'status'=>$statusnya]);
$vprojectimplementation = DB::table('vprojectimplementation')->where('id',$id)->first();
$masukEmail = array(
        'projectid' => $projectid,
        'message' => $message,
        'infratype' => $request->get('infratype'),
        'vprojectimplementation' => $vprojectimplementation,
    'kata' => 'Project '.$projectid.' Menunggu Approval Anda',
        'name' => Auth::guard('karyawan')->user()->name); 
$this->KirimEmailDetail($emailNya,$masukEmail) ;
$this->SendingNotif($request->get('id'),$status,$levelnya,$cekPRojectNya->area) ;
return response()->json(['success'=>'Project Menunggu Approval '.$request->get('levelnya')]);
	
}	

    }
else
    {
 return response()->json('error', $valid);
    }
    }

	
	
	
	
	
	  public function SubmitProjectRepair(Request $request)
    {
$valid = $this->validate($request, [
        'message' => 'required',
        'kabupaten' => 'required',
        'sitename' => 'required|max:255',
        'mitra' => 'required|max:255',
        'towerimplementation' => 'required|numeric|not_in:0',
        'clusterimplementation' => 'required',
    ]);
if (!$valid)
    {
if($request->get('infratype') == 'UNTAPPED')
{
$plafonnya = $this->avgUNTAPPED(); 
$id = $request->get('id');	
	$projectid = $request->get('projectid');	
	$message = 'Pesan APPROVAL dari '.Auth::guard('karyawan')->user()->name.' :'.$request->get('message');
	$statusnya = $request->get('statusnya');
	$created = $request->get('created');
	$status	= 'APPROVED';
	$levelnya = $request->get('levelnya');
	$projectimplementationid = $request->get('projectimplementationid');
$dataSet4 = [];
$create = ProjectStatus::create(['project_id'=>$id,'user_id'=>Auth::guard('karyawan')->user()->id,'status'=>$status,'message'=>$message]);	
ProjectImplementationsAddtional::where('project_implementation_id',$projectimplementationid)->delete();
ProjectImplementationsStandard::where('project_implementation_id',$projectimplementationid)->delete();
ProjectImplementations::where('id',$projectimplementationid)->update(['towerimplementation'=>strtoupper(Input::get('towerimplementation')),'clusterimplementation'=>strtoupper(Input::get('clusterimplementation')),'mitra'=>strtoupper(Input::get('mitra'))]);	
if($levelnya == 'GENERAL MANAGER AREA')
{
$pesan = User::where([['level',$levelnya],['AREA',$request->area]])->select('id','email','name')->get();
}
else
{
$pesan = User::where('level',$levelnya)->select('id','email','name')->get();
}
foreach ($pesan as $p) {
$dataSet4[] = ['project_id'=>$id,'users_id'=>$p['id'],'message'=>'Project '.$projectid.' Menunggu Approval','status'=>'0', 'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
$emailNya[] = $p['email'];

}


//Pemberitahuan::insert($dataSet4); // Eloquent approach
Project::where('id',$id)->update(['budget'=>$plafonnya,'infratype'=>$request->get('infratype'),'sitename'=>$request->get('sitename'),'kabupaten'=>$request->get('kabupaten'),'qty_lahan'=>$request->get('qty_lahan'),'lahan'=>$request->get('lahan'),'cme'=>$request->get('cme'),'pln'=>$request->get('pln'),'addtransport'=>$request->get('addtransport'),'addpln'=>$request->get('addpln'),'addcme'=>$request->get('addcme'),'biayatower'=>$request->get('biayatower'),'longitude'=>$request->get('longitude'),'latituted'=>$request->get('latituted'),'mitra'=>strtoupper(Input::get('mitra')),'status_id'=>$create->id,'status'=>$statusnya,'updated_at'=>Carbon::now()]);
$vprojectimplementation = DB::table('vprojectimplementation')->where('id',$id)->first();
$masukEmail = array(
        'projectid' => $projectid,
        'message' => $message,
        'infratype' => $request->get('infratype'),
        'vprojectimplementation' => $vprojectimplementation,
    'kata' => 'Project '.$projectid.' Menunggu Approval Anda',
        'name' => Auth::guard('karyawan')->user()->name); 
$this->KirimEmailDetail($emailNya,$masukEmail) ;
$this->SendingNotif($request->get('id'),$status,$levelnya,$request->area) ;
return response()->json(['success'=>'Project Menunggu Approval '.$levelnya]);	

}
else
{
	$plafonnya = $this->avgB2S(); 
	$id = $request->get('id');	
	$projectid = $request->get('projectid');	
	$message = 'Pesan APPROVAL dari '.Auth::guard('karyawan')->user()->name.' :'.$request->get('message');
	$statusnya = $request->get('statusnya');
	$created = $request->get('created');
	$status	= 'APPROVED';
	$standard =  Input::get('standard');
	$addtional =  Input::get('addtional');
	$levelnya = $request->get('levelnya');
	$projectimplementationid = $request->get('projectimplementationid');
$dataSet = [];
$dataSet2 = [];
$dataSet4 = [];
$create = ProjectStatus::create(['project_id'=>$id,'user_id'=>Auth::guard('karyawan')->user()->id,'status'=>$status,'message'=>$message]);	
ProjectImplementationsAddtional::where('project_implementation_id',$projectimplementationid)->delete();
ProjectImplementationsStandard::where('project_implementation_id',$projectimplementationid)->delete();
ProjectImplementations::where('id',$projectimplementationid)->update(['towerimplementation'=>strtoupper(Input::get('towerimplementation')),'clusterimplementation'=>strtoupper(Input::get('clusterimplementation')),'mitra'=>strtoupper(Input::get('mitra'))]);	
if(count($addtional) > 0)
{
	foreach ($addtional as $key =>$ss) {
$dataSet2[] = ['project_implementation_id'=>$projectimplementationid,'pekerjaan'=>strtoupper($ss['pekerjaan']),'satuan'=>strtoupper($ss['satuan']),'qty'=>$ss['qty'],'harga'=>$ss['harga'],'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
 }			 
ProjectImplementationsAddtional::insert($dataSet2); // Eloquent approach
 
}
if($levelnya == 'GENERAL MANAGER AREA')
{
$pesan = User::where([['level',$levelnya],['AREA',$request->area]])->select('id','email','name')->get();
}
else
{
$pesan = User::where('level',$levelnya)->select('id','email','name')->get();
}
foreach ($pesan as $p) {
             $dataSet4[] = ['project_id'=>$id,'users_id'=>$p['id'],'message'=>'Project '.$projectid.' Menunggu Approval','status'=>'0', 'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
$emailNya[] = $p['email'];

}

$this->SendingNotif($request->get('id'),$status,$levelnya,$request->area) ;
ProjectImplementationsStandard::insert(['project_implementation_id'=>$projectimplementationid,'tonase'=>$standard['tonase'],'pondasi'=>$standard['pondasi'],'biayatower'=>$standard['biayatower'],'erection_tower'=>$standard['erection_tower'],'transportasi'=>$standard['transportasi'],'pondasi_greenfiled'=>$standard['pondasi_greenfiled'],'bts_outdoor'=>$standard['bts_outdoor'],'me'=>$standard['me'],'fy'=>$standard['fy'],'pln_connect'=>$standard['pln_connect'],'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()]); // Eloquent approach
//Pemberitahuan::insert($dataSet4); // Eloquent approach
Project::where('id',$id)->update(['budget'=>$plafonnya,'infratype'=>$request->get('infratype'),'sitename'=>$request->get('sitename'),'kabupaten'=>$request->get('kabupaten'),'qty_lahan'=>$request->get('qty_lahan'),'lahan'=>$request->get('lahan'),'cme'=>'0','pln'=>'0','addtransport'=>'0','addpln'=>'0','addcme'=>'0','biayatower'=>'0','longitude'=>$request->get('longitude'),'latituted'=>$request->get('latituted'),'mitra'=>strtoupper(Input::get('mitra')),'status_id'=>$create->id,'status'=>$statusnya,'updated_at'=>Carbon::now()]);
$vprojectimplementation = DB::table('vprojectimplementation')->where('id',$id)->first();
$masukEmail = array(
        'projectid' => $projectid,
        'message' => $message,
        'infratype' => $request->get('infratype'),
        'vprojectimplementation' => $vprojectimplementation,
    'kata' => 'Project '.$projectid.' Menunggu Approval Anda',
        'name' => Auth::guard('karyawan')->user()->name); 
$this->KirimEmailDetail($emailNya,$masukEmail) ;
return response()->json(['success'=>'Project Menunggu Approval '.$levelnya]);

}	
	
    }
else
    {
 return response()->json('error', $valid);
    }
    }
	
	
	  public function RepairItemProject(Request $request)
    {
		$valid = $this->validate($request, [
        'message' => 'required',
    ]);
if (!$valid)
    {
	$id = $request->get('id');	
	$level = $request->get('level');
	$message = 'Pesan REJECT dari '.Auth::guard('karyawan')->user()->name.' :'.$request->get('message');
	$statusnya = $request->get('statusnya');
	if($statusnya == 'CANCEL')
	{
		$status	= 'CANCEL';
	}
	else
	{
		$status	= 'REPAIR';
	}
	
$dataSet4 = [];
$cek = Project::where('id',$id)->first();
$projectid = $cek->projectid;
$create = ProjectStatus::create(['project_id'=>$id,'user_id'=>Auth::guard('karyawan')->user()->id,'status'=>$status,'message'=>$message]);
if($level == 'MANAGER AREA' || $level == 'GENERAL MANAGER AREA')
{
	$pesan = User::where([['level',$level],['area',$cek->area]])->select('id','email','name')->get();
  $kata = 'Project Menunggu Perbaikan Dari '.$level;
	$kataEmailNya = 'Project '.$projectid.' Menunggu Perbaikan Anda';
	$this->SendingNotif($request->get('id'),$status,$level,$cek->area) ;
}
elseif($level == 'STAFF PROCUREMENT')
{
	$pesan = User::where([['level',$level],['area',$cek->area]])->select('id','email','name')->get();
  $kata = 'Project Menunggu Perbaikan Dari '.$level;
	$kataEmailNya = 'Project '.$projectid.' Menunggu Perbaikan Anda';
	$this->SendingNotif($request->get('id'),$status,$level,$cek->area) ;
}
elseif($level == 'MANAGER UBIS')
{
	$pesan = User::where([['level',$level],['area',$cek->area]])->orWhere([['level',$level],['area2',$cek->area]])->select('id','email','name')->get();
  $kata = 'Project Menunggu Perbaikan Dari '.$level;
	$kataEmailNya = 'Project '.$projectid.' Menunggu Perbaikan Anda';
	$this->SendingNotif($request->get('id'),$status,$level,$cek->area) ;
}
elseif($level == 'CANCEL')
{
	$pesan = DB::table('vprojectstatus')->select('id','name', 'email')
            ->where('project_id',$id)
			->whereNotIn('level', ['GENERAL MANAGER AREA','DIRECTOR','EXECUTIVE GENERAL MANAGER UBIS','GENERAL MANAGER UBIS'])
            ->groupBy('id')
            ->get();
	$kata = 'Project Berhasil Di Drop ';
  $kataEmailNya = 'Project '.$projectid.' DiBatalkan';
  $this->SendingNotif($request->get('id'),$status,'ALL','') ;
}
else
{
	$pesan = User::where('level',$level)->select('id','email','name')->get();
	$kata = 'Project Menunggu Perbaikan Dari '.$level;
  $kataEmailNya = 'Project '.$projectid.' Menunggu Perbaikan Anda';
  $this->SendingNotif($request->get('id'),$status,$level,'') ;
}

foreach ($pesan as $p) {
             $dataSet4[] = ['project_id'=>$id,'users_id'=>$p->id,'message'=>'Project '.$cek->projectid.' Menunggu Perbaikan','status'=>'0', 'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
$emailNya[] = $p->email;

}
$vprojectimplementation = DB::table('vprojectimplementation')->where('id',$id)->first();
$masukEmail = array(
        'projectid' => $projectid,
        'message' => $message,
        'infratype' => $request->get('infratype'),
        'vprojectimplementation' => $vprojectimplementation,
    'kata' => $kataEmailNya,
        'name' => Auth::guard('karyawan')->user()->name); 
$this->KirimEmailDetail($emailNya,$masukEmail) ;

//Pemberitahuan::insert($dataSet4); // Eloquent approach
$cek->status_id = $create->id;
$cek->status = $statusnya;
$cek->save();
return response()->json(['success'=>$kata]);
    }
else
    {
 return response()->json('error', $valid);
    }
    }
	  public function ApprovalProjectOffice(Request $request)
    {
        $valid = $this->validate($request, [
         'message' => 'required',
         'qty_lahan' => 'required|numeric|not_in:0',
         'id' => 'required|numeric|not_in:0',
         'projectimplementationid' => 'required|numeric|not_in:0',
         'projectid' => 'required',
         'infratype' => 'required',
         'kabupaten' => 'required',
         'mitra' => 'required',
        'sitename' => 'required|max:255',
         'sis' => 'required|numeric',
         'sitac' => 'required|numeric',
         'imb' => 'required|numeric',
         'imb_jasa' => 'required|numeric',
         'lahan' => 'required|numeric',
        'levelnya' => 'required|max:255',
        'statusnya' => 'required|max:255',
    ]);
if (!$valid)
    {
$cek = Project::where('id',$request->get('id'))->first();
if($request->get('infratype') == 'UNTAPPED')        
{
    $plafonnya = $this->avgUNTAPPED(); 
    $id = $request->get('id');  
    $projectid = $request->get('projectid');    
    $message = 'Pesan APPROVAL dari '.Auth::guard('karyawan')->user()->name.' :'.$request->get('message');
    $statusnya = $request->get('statusnya');
    $created = $request->get('created');
    $status = 'APPROVED';
    $levelnya = $request->get('levelnya');
    $projectimplementationid = $request->get('projectimplementationid');


$dataSet4 = [];
$create = ProjectStatus::create(['project_id'=>$id,'user_id'=>Auth::guard('karyawan')->user()->id,'status'=>$status,'message'=>$message]);  
if($levelnya == 'FINISH')
{
    $pesan = DB::table('vprojectstatus')->select('id','name', 'email')
            ->where('project_id',$id)
			->whereNotIn('level', ['GENERAL MANAGER AREA','DIRECTOR','EXECUTIVE GENERAL MANAGER UBIS','GENERAL MANAGER UBIS'])
            ->groupBy('id')
            ->get();
    $kata = 'Project Selesai';
    $kataEmail = 'Project '.$projectid.' Telah Selesai';
	$messagePesan = 'BOQ FINAL APPROVED SEBAGAI DASAR PR/PO';
}
else
{
	if($levelnya == 'MANAGER AREA' || $levelnya == 'GENERAL MANAGER AREA' || $levelnya == 'STAFF PROCUREMENT' )
	{
		$pesan = User::where([['level',$levelnya],['area',$cek->area]])->select('id','email','name')->get();
		$this->SendingNotif($request->get('id'),$status,$levelnya,$cek->area) ;
	}
	elseif($levelnya == 'MANAGER UBIS')
	{
		$pesan = User::where([['level',$levelnya],['area',$cek->area]])->orWhere([['level',$levelnya],['area2',$cek->area]])->select('id','email','name')->get();
		$this->SendingNotif($request->get('id'),$status,$levelnya,$cek->area) ;
	}
	else
	{
		$pesan = User::where('level',$levelnya)->select('id','email','name')->get();
		$this->SendingNotif($request->get('id'),$status,$levelnya,'') ;
	}

$kata = 'Project Menunggu Approval '.$levelnya;
$kataEmail = 'Project '.$projectid.' Menunggu Approval Anda';
$messagePesan =  $message;
}
foreach ($pesan as $p) {
$dataSet4[] = ['project_id'=>$id,'users_id'=>$p->id,'message'=>'Project '.$projectid.' Menunggu Approval','status'=>'0', 'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
$emailNya[] = $p->email;

}


//Pemberitahuan::insert($dataSet4); // Eloquent approach
ProjectImplementationsAddtional::where('project_implementation_id',$projectimplementationid)->delete();
ProjectImplementationsStandard::where('project_implementation_id',$projectimplementationid)->delete();
ProjectImplementations::where('id',$projectimplementationid)->update(['mitra'=>strtoupper(Input::get('mitra'))]);
Project::where('id',$id)->update(['budget'=>$plafonnya,'infratype'=>$request->get('infratype'),'sitename'=>strtoupper($request->get('sitename')),'kabupaten'=>strtoupper($request->get('kabupaten')),'mitra'=>strtoupper(Input::get('mitra')),'sis'=>$request->get('sis'),'sitac'=>$request->get('sitac'),'imb'=>$request->get('imb'),'imb_jasa'=>$request->get('imb_jasa'),'qty_lahan'=>$request->get('qty_lahan'),'lahan'=>$request->get('lahan'),'cme'=>$request->get('cme'),'pln'=>$request->get('pln'),'addtransport'=>$request->get('addtransport'),'addpln'=>$request->get('addpln'),'addcme'=>$request->get('addcme'),'biayatower'=>$request->get('biayatower'),'status_id'=>$create->id,'status'=>$statusnya,'updated_at'=>Carbon::now()]);
$vprojectimplementation = DB::table('vprojectimplementation')->where('id',$id)->first();
$masukEmail = array(
        'projectid' => $projectid,
        'message' => $messagePesan,
        'infratype' => $request->get('infratype'),
        'vprojectimplementation' => $vprojectimplementation,
    'kata' => $kataEmail ,
        'name' => Auth::guard('karyawan')->user()->name); 
$this->KirimEmailDetail($emailNya,$masukEmail) ;
return response()->json(['success'=>$kata]);    
}
else
{
    $plafonnya = $this->avgB2S(); 
    $id = $request->get('id');  
    $projectid = $request->get('projectid');    
    $message = 'Pesan APPROVAL dari '.Auth::guard('karyawan')->user()->name.' :'.$request->get('message');
    $statusnya = $request->get('statusnya');
    $created = $request->get('created');
    $status = 'APPROVED';
    $standard =  Input::get('standard');
    $addtional =  Input::get('addtional');
    $levelnya = $request->get('levelnya');
    $projectimplementationid = $request->get('projectimplementationid');


$dataSet = [];
$dataSet2 = [];
$dataSet4 = [];
$create = ProjectStatus::create(['project_id'=>$id,'user_id'=>Auth::guard('karyawan')->user()->id,'status'=>$status,'message'=>$message]);  
ProjectImplementationsAddtional::where('project_implementation_id',$projectimplementationid)->delete();
ProjectImplementationsStandard::where('project_implementation_id',$projectimplementationid)->delete();
if(count($addtional) > 0)
{
    foreach ($addtional as $key =>$ss) {
$dataSet2[] = ['project_implementation_id'=>$projectimplementationid,'pekerjaan'=>strtoupper($ss['pekerjaan']),'satuan'=>strtoupper($ss['satuan']),'qty'=>$ss['qty'],'harga'=>$ss['harga'],'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
 }           
ProjectImplementationsAddtional::insert($dataSet2); // Eloquent approach
 
}
if($levelnya == 'FINISH')
{
    $pesan = DB::table('vprojectstatus')->select('id','name', 'email')
            ->where('project_id',$id)
			->whereNotIn('level', ['GENERAL MANAGER AREA','DIRECTOR','EXECUTIVE GENERAL MANAGER UBIS','GENERAL MANAGER UBIS'])
            ->groupBy('id')
            ->get();
    $kata = 'Project Selesai';
    $kataEmail = 'Project '.$projectid.' Telah Selesai';
	$messagePesan = 'BOQ FINAL APPROVED SEBAGAI DASAR PR/PO';
	$this->SendingNotif($request->get('id'),$status,'ALL','') ;
}
else
{
if($levelnya == 'MANAGER AREA' || $levelnya == 'GENERAL MANAGER AREA' || $levelnya == 'STAFF PROCUREMENT' )
	{
		$pesan = User::where([['level',$levelnya],['area',$cek->area]])->select('id','email','name')->get();
		$this->SendingNotif($request->get('id'),$status,$levelnya,$cek->area) ;
	}
	elseif($levelnya == 'MANAGER UBIS')
	{
		$pesan = User::where([['level',$levelnya],['area',$cek->area]])->orWhere([['level',$levelnya],['area2',$cek->area]])->select('id','email','name')->get();
		$this->SendingNotif($request->get('id'),$status,$levelnya,$cek->area) ;
	}
	else
	{
		$pesan = User::where('level',$levelnya)->select('id','email','name')->get();
		$this->SendingNotif($request->get('id'),$status,$levelnya,'') ;
	}
$kata = 'Project Menunggu Approval '.$levelnya;
$kataEmail = 'Project '.$projectid.' Menunggu Approval Anda';
$messagePesan = $message;
}
foreach ($pesan as $p) {
             $dataSet4[] = ['project_id'=>$id,'users_id'=>$p['id'],'message'=>'Project '.$projectid.' Menunggu Approval','status'=>'0', 'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
$emailNya[] = $p['email'];

}


ProjectImplementationsStandard::insert(['project_implementation_id'=>$projectimplementationid,'tonase'=>$standard['tonase'],'pondasi'=>$standard['pondasi'],'biayatower'=>$standard['biayatower'],'erection_tower'=>$standard['erection_tower'],'transportasi'=>$standard['transportasi'],'pondasi_greenfiled'=>$standard['pondasi_greenfiled'],'bts_outdoor'=>$standard['bts_outdoor'],'me'=>$standard['me'],'fy'=>$standard['fy'],'pln_connect'=>$standard['pln_connect'],'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()]); // Eloquent approach
//Pemberitahuan::insert($dataSet4); // Eloquent approach
ProjectImplementations::where('id',$projectimplementationid)->update(['mitra'=>strtoupper(Input::get('mitra'))]);
Project::where('id',$id)->update(['budget'=>$plafonnya,'infratype'=>$request->get('infratype'),'sitename'=>strtoupper($request->get('sitename')),'kabupaten'=>strtoupper($request->get('kabupaten')),'mitra'=>strtoupper(Input::get('mitra')),'sis'=>$request->get('sis'),'sitac'=>$request->get('sitac'),'imb'=>$request->get('imb'),'imb_jasa'=>$request->get('imb_jasa'),'qty_lahan'=>$request->get('qty_lahan'),'lahan'=>$request->get('lahan'),'cme'=>0,'pln'=>0,'addtransport'=>0,'addpln'=>0,'addcme'=>0,'biayatower'=>0,'status_id'=>$create->id,'status'=>$statusnya,'updated_at'=>Carbon::now()]);
$vprojectimplementation = DB::table('vprojectimplementation')->where('id',$id)->first();
$masukEmail = array(
        'projectid' => $projectid,
        'message' => $messagePesan,
    'kata' => $kataEmail,
        'infratype' => $request->get('infratype'),
        'vprojectimplementation' => $vprojectimplementation,
        'name' => Auth::guard('karyawan')->user()->name); 
$this->KirimEmailDetail($emailNya,$masukEmail) ;
return response()->json(['success'=>$kata]);
    
}       
        
    }
else
    {
 return response()->json('error', $valid);
    }
    } 
	
	   public function DataGrafikAVGuNtp(Request $request)
    {
$valid = $this->validate($request, [
        'tahun' => 'required|numeric|not_in:0',
    ]);		
	if (!$valid)
    {
$tahun = $request->tahun;
$tableB2s = DB::table('vtotalprojectnyatahunan')->where([['infratype','UNTAPPED'],['tahun',$tahun]])->select('infratype','ordernya','fin','prog','canc')->first();
$placapb2s = DB::table('vavgprojecnstutp')->where([['infratype','UNTAPPED'],['tahun',$tahun]])->select('infratype','budget','capex','jumlah')->first();
$placapb2sarea = DB::table('vavgprojecareatutp')->where('tahun',$tahun)->select('area','capex','jumlah')->get();
$placapunp = DB::table('vavgprojecregionaltutp')->where([['infratype','UNTAPPED'],['tahun',$tahun]])->select('regional','budget','capex','jumlah')->get();
foreach($placapunp as $reg)
{
	$listregionalcapex[] = $reg->regional.' ('.$reg->jumlah.') (Rp. '.number_format($reg->capex, 2 , '.' , ',' ).')';
	$regional[] = $reg->regional;
	$capexregional[] = $reg->capex;
}
foreach($placapb2sarea as $are)
{
	$listareacapex[] = $are->area.' ('.$are->jumlah.') (Rp. '.number_format($are->capex, 2 , '.' , ',' ).')';
	$area[] = $are->area;
	$capexarea[] = $are->capex;
}
return response()->json(['tableB2s'=>$tableB2s,'placapb2s'=>$placapb2s,'placapunp'=>$placapunp,'regional'=>$regional,'capexregional'=>$capexregional,'listregionalcapex'=>$listregionalcapex,'area'=>$area,'capexarea'=>$capexarea,'listareacapex'=>$listareacapex]);
 
 }
	else
	{
		 return response()->json('error', 500);
	}
	}
	
	
	
      public function DataGrafikAVGB2s(Request $request)
    {
$valid = $this->validate($request, [
        'tahun' => 'required|numeric|not_in:0',
    ]);		
	if (!$valid)
    {
$tahun = $request->tahun;
$tableB2s = DB::table('vtotalprojectnyatahunan')->where([['infratype','B2S'],['tahun',$tahun]])->select('infratype','ordernya','fin','prog','canc')->first();
$placapb2s = DB::table('vavgprojectnsb2s')->where([['infratype','B2S'],['tahun',$tahun]])->select('infratype','budget','capex','jumlah')->first();
$placapb2sarea = DB::table('vavgprojectareab2s')->where('tahun',$tahun)->select('area','capex','jumlah')->get();
$placapunp = DB::table('vavgprojectregionalb2s')->where([['infratype','B2S'],['tahun',$tahun]])->select('regional','budget','capex','jumlah')->get();
foreach($placapunp as $reg)
{
	$listregionalcapex[] = $reg->regional.' ('.$reg->jumlah.') (Rp. '.number_format($reg->capex, 2 , '.' , ',' ).')';
	$regional[] = $reg->regional;
	$capexregional[] = $reg->capex;
}
foreach($placapb2sarea as $are)
{
	$listareacapex[] = $are->area.' ('.$are->jumlah.') (Rp. '.number_format($are->capex, 2 , '.' , ',' ).')';
	$area[] = $are->area;
	$capexarea[] = $are->capex;
}
return response()->json(['tableB2s'=>$tableB2s,'listregionalcapex'=>$listregionalcapex,'placapb2s'=>$placapb2s,'placapunp'=>$placapunp,'regional'=>$regional,'capexregional'=>$capexregional,'area'=>$area,'capexarea'=>$capexarea,'listareacapex'=>$listareacapex]);
 
    }
	else
	{
		 return response()->json('error', 500);
	}
	
	}
	
	
	
	   public function GetHome()
    {
		
$tahun = Carbon::now();
$tableB2s = DB::table('vtotalprojectnyatahunan')->where([['infratype','B2S'],['tahun',$tahun->year]])->select('infratype','ordernya','fin','prog','canc')->first();
$tableUNTAPPED = DB::table('vtotalprojectnyatahunan')->where([['infratype','UNTAPPED'],['tahun',$tahun->year]])->select('infratype','ordernya','fin','prog','canc')->first();
$placapb2s = DB::table('vavgprojectnsb2s')->where([['infratype','B2S'],['tahun',$tahun->year]])->select('infratype','budget','capex','jumlah')->first();
$placapUNTAPPED = DB::table('vavgprojecnstutp')->where([['infratype','UNTAPPED'],['tahun',$tahun->year]])->select('infratype','budget','capex','jumlah')->first();
$placapb2sarea = DB::table('vavgprojectareab2s')->where('tahun',$tahun->year)->select('area','capex','jumlah')->get();
$placapUNTAPPEDarea = DB::table('vavgprojecareatutp')->where('tahun',$tahun->year)->select('area','capex','jumlah')->get();
$placapb2SnYA = DB::table('vavgprojectregionalb2s')->where([['infratype','B2S'],['tahun',$tahun->year]])->select('regional','budget','capex','jumlah')->get();
$placapunp = DB::table('vavgprojecregionaltutp')->where([['infratype','UNTAPPED'],['tahun',$tahun->year]])->select('regional','budget','capex','jumlah')->get();


$placapb2sareaUser = DB::table('vavgprojectareab2s')->where([['tahun',$tahun->year],['area',Auth::guard('karyawan')->user()->area]])->select('area','budget','capex','jumlah')->first();
$placapUNTAPPEDareaUser = DB::table('vavgprojecareatutp')->where([['tahun',$tahun->year],['area',Auth::guard('karyawan')->user()->area]])->select('area','budget','capex','jumlah')->first();


foreach($placapunp as $reg)
{
	$jumlahregional[] = $reg->jumlah;
	$regional[] = $reg->regional;
	$capexregional[] = $reg->capex;
}
foreach($placapb2SnYA as $rega)
{
	$jumlahregionalB2S[] = $rega->jumlah;
	$regionalB2S[] = $rega->regional;
	$capexregionalB2S[] = $rega->capex;
}
foreach($placapb2sarea as $are)
{
	$jumlaharea[] = $are->jumlah;
	$area[] = $are->area;
	$capexarea[] = $are->capex;
}

foreach($placapUNTAPPEDarea as $areU)
{
	$jumlahareaUTP[] = $areU->jumlah;
	$areaUTP[] = $areU->area;
	$capexareaUTP[] = $areU->capex;
}

$areaUser = array();
$areaUTPUser = array();


if(empty($placapb2sareaUser->area)){$areaUser = ['capex'=>0,'budget'=>0,'jumlah'=>0];}else{$areaUser = ['capex'=>$placapb2sareaUser->capex,'budget'=>$placapb2sareaUser->budget,'jumlah'=>$placapb2sareaUser->jumlah];}

if(empty($placapUNTAPPEDareaUser->area)){$areaUTPUser = ['capex'=>0,'budget'=>0,'jumlah'=>0];}else{$areaUTPUser = ['capex'=>$placapUNTAPPEDareaUser->capex,'budget'=>$placapUNTAPPEDareaUser->budget,'jumlah'=>$placapUNTAPPEDareaUser->jumlah];}




return response()->json(['tableB2s'=>$tableB2s,'tableUNTAPPED'=>$tableUNTAPPED,'placapb2s'=>$placapb2s,'placapUNTAPPED'=>$placapUNTAPPED,'placapunp'=>$placapunp,'regionalB2S'=>$regionalB2S,'capexregional'=>$capexregionalB2S,'regional'=>$regional,'capexregional'=>$capexregional,'area'=>$area,'capexarea'=>$capexarea,'areaUTP'=>$areaUTP,'capexareaUTP'=>$capexareaUTP,'areaUser'=>$areaUser,'areaUTPUser'=>$areaUTPUser,'tahun'=>$tahun->year]);
  
    }
	
	
           public function simulasi($area,$regional,$cluster,$infratype)
    {
		$sregional = array();
		$sa = array();
		$snasional = array();
if($infratype == 'UNTAPPED')
{
$sregional = DB::table('vplafon_capex_regional')->where([['regional',$regional],['infratype','UNTAPPED']])->select('budgetNya','capexNya','total')->first();
if(count($sregional) > 0 ){$sr=$sregional;}else{$sr=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}

$sarea = DB::table('vplafon_capex_area')->where([['area',$area],['infratype','UNTAPPED']])->select('budgetNya','capexNya','total')->first();
if(count($sarea) > 0){$sa=$sarea;}else{$sa=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}

$snasional = DB::table('vplafon_capex_nasional')->where('infratype','UNTAPPED')->select('budgetNya','capexNya','total')->first();
if(count($snasional) > 0){$sn=$snasional;}else{$sn=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}

return response()->json(['regional'=>$sr,'area'=>$sa,'nasional'=>$sn]);

}
else if($infratype == 'B2S')
{   
 $sregional = DB::table('vplafon_capex_regional')->where([['regional',$regional],['infratype','B2S']])->select('budgetNya','capexNya','total')->first();
if(count($sregional) > 0){$sr=$sregional;}else{$sr=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
$sarea = DB::table('vplafon_capex_area')->where([['area',$area],['infratype','B2S']])->select('budgetNya','capexNya','total')->first();
if(count($sarea) > 0){$sa=$sarea;}else{$sa=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
$snasional = DB::table('vplafon_capex_nasional')->where('infratype','B2S')->select('budgetNya','capexNya','total')->first();
if(count($snasional) > 0){$sn=$snasional;}else{$sn=['budgetNya'=>0,'capexNya'=>0,'total'=>0];}
return response()->json(['regional'=>$sr,'area'=>$sa,'nasional'=>$sn]);
}
else
{
    return response()->json('error');
}
   
    }
	
	 public function GetProjectApprovalEGMUB2S(Request $request)
    {
		
		if(Auth::guard('karyawan')->user()->level == 'EXECUTIVE GENERAL MANAGER UBIS')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','UBIS - EXECUTIVE GENERAL MANAGER'],['infratype','B2S']])
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'DIRECTOR')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','DIRECTOR'],['infratype','B2S']])
			->orderBy('id','DESC');
		}
        $perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
		
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
			}
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
		}
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
		}
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
			}
        return $query->paginate($perPage);
    }

	 public function GetProjectApprovalEGMUUNTAPPED(Request $request)
    {
		
		if(Auth::guard('karyawan')->user()->level == 'EXECUTIVE GENERAL MANAGER UBIS')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','UBIS - EXECUTIVE GENERAL MANAGER'],['infratype','UNTAPPED']])
			->orderBy('id','DESC');
		}
		if(Auth::guard('karyawan')->user()->level == 'DIRECTOR')
		{
			$query = DB::table('vprojectimplementation')
			->where([['status','DIRECTOR'],['infratype','UNTAPPED']])
			->orderBy('id','DESC');
		}
        $perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
		
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
			}
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$min)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
		}
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
		}
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)
			->orWhere('cluster', 'LIKE', $like)
			->orWhere('regional', 'LIKE', $like);
			}
        return $query->paginate($perPage);
    }

		public function simulasiB2Smasal(Request $request)
	{
$data = $request->data;	
$infratype = $request->infratype;	
$ShowData = DB::table('vprojectimplementation')->select('area','regional','budget','capex')->whereIn('id', $data)->get();

$dataRegionalNya = array();
$dataAreaNya = array();
$capex = 0;
$budget = 0;
$groupsregional = array();
$groupsarea = array();
$sr = array();
$listregional = array();
$listregionalbudgetNya = array();
$listregionalcapexNya = array();
$listregionaltotal = array();
$sa = array();
$listarea = array();
$listareabudgetNya = array();
$listareacapexNya = array();
$listareatotal = array();
foreach($ShowData as $a)
{
 $Arrayregional = $a->regional;
 if (!isset($groupsregional[$Arrayregional])) 
{
$groupsregional[$Arrayregional] = array('regional' => $Arrayregional ,'budget' => $a->budget, 'capex' => $a->capex,'total'=> 1);
} else {
$groupsregional[$Arrayregional]['budget'] = $groupsregional[$Arrayregional]['budget'] + $a->budget;
$groupsregional[$Arrayregional]['capex'] = $groupsregional[$Arrayregional]['capex'] +$a->capex;
$groupsregional[$Arrayregional]['total'] = $groupsregional[$Arrayregional]['total'] + 1;
}

$Arrayarea = $a->area;
 if (!isset($groupsarea[$Arrayarea])) 
{
$groupsarea[$Arrayarea] = array('area' => $Arrayarea ,'budget' => $a->budget, 'capex' => $a->capex,'total'=> 1);
} else {
$groupsarea[$Arrayarea]['budget'] = $groupsarea[$Arrayarea]['budget'] + $a->budget;
$groupsarea[$Arrayarea]['capex'] = $groupsarea[$Arrayarea]['capex'] +$a->capex;
$groupsarea[$Arrayarea]['total'] = $groupsarea[$Arrayarea]['total'] + 1;
}

$capex += $a->capex;
$budget += $a->budget;
}

if($infratype == 'B2S')
{
//total data regional
foreach($groupsregional as $rgnl)
{
$sregional = DB::table('vplafon_capex_regional')->where([['regional',$rgnl['regional']],['infratype','B2S']])->select('budgetNya','capexNya','total')->first();	
if(count($sregional) > 0){
$sumtotalRegional = $rgnl['total'] + $sregional->total;	
$sumbudgetNyaRegional = ($rgnl['budget'] + $sregional->budgetNya) / $sumtotalRegional;	
$sumcapexNyaRegional = ($rgnl['capex'] + $sregional->capexNya) / $sumtotalRegional;
$listregional[]=$rgnl['regional'];
$listregionalbudgetNya[]=$sumbudgetNyaRegional;
$listregionalcapexNya[]=$sumcapexNyaRegional;
$listregionaltotal[]=$sumtotalRegional;	
$sr[]=['regional'=>$rgnl['regional'],'budgetNya'=>$sumbudgetNyaRegional,'capexNya'=>$sumcapexNyaRegional,'total'=>$sumtotalRegional];
}else{
$sumtotalRegional = $rgnl['total'];
$sumbudgetNyaRegional = $rgnl['budget'] / $sumtotalRegional;	
$sumcapexNyaRegional = $rgnl['capex'] / $sumtotalRegional;
$listregional[]=$rgnl['regional'];
$listregionalbudgetNya[]=$sumbudgetNyaRegional;
$listregionalcapexNya[]=$sumcapexNyaRegional;
$listregionaltotal[]=$sumtotalRegional;	
$sr[]=['regional'=>$rgnl['regional'],'budgetNya'=>$sumbudgetNyaRegional,'capexNya'=>$sumcapexNyaRegional,'total'=>$sumtotalRegional];
}
}

//total data area
foreach($groupsarea as $ar)
{
$sarea = DB::table('vplafon_capex_area')->where([['area',$ar['area']],['infratype','B2S']])->select('budgetNya','capexNya','total')->first();
if(count($sarea) > 0){
$sumtotalArea = $ar['total'] + $sarea->total;	
$sumbudgetNyaArea = ($ar['budget'] + $sarea->budgetNya) / $sumtotalArea;	
$sumcapexNyaArea = ($ar['capex'] + $sarea->capexNya) / $sumtotalArea;	
$listarea[]=$ar['area'];
$listareabudgetNya[]=$sumbudgetNyaArea;
$listareacapexNya[]=$sumcapexNyaArea;
$listareatotal[]=$sumtotalArea;
$sa[]=['area'=>$ar['area'],'budgetNya'=>$sumbudgetNyaArea,'capexNya'=>$sumcapexNyaArea,'total'=>$sumtotalArea];
}else{
$sumtotalArea = $ar['total'];
$sumbudgetNyaArea = $ar['budget'] / $sumtotalArea;	
$sumcapexNyaArea = $ar['capex'] / $sumtotalArea;
$listarea[]=$ar['area'];
$listareabudgetNya[]=$sumbudgetNyaArea;
$listareacapexNya[]=$sumcapexNyaArea;
$listareatotal[]=$sumtotalArea;
$sa[]=['area'=>$ar['area'],'budgetNya'=>$sumbudgetNyaArea,'capexNya'=>$sumcapexNyaArea,'total'=>$sumtotalArea];
}
}

$snasional = DB::table('vplafon_capex_nasional')->where('infratype','B2S')->select('budgetNya','capexNya','total')->first();
if(count($snasional) > 0)
{
$sumtotal = count($data)+$snasional->total;
$sumbudget = ($budget+$snasional->capexNya)/$sumtotal;
$sumcapex = ($capex+$snasional->capexNya)/$sumtotal;
$sn =['budgetNya'=>$sumbudget,'capexNya'=>$sumcapex,'total'=>$sumtotal];
}
else
{
$sumtotal = count($data);
$sumbudget = $budget / $sumtotal;
$sumcapex =$capex / $sumtotal;
$sn =['budgetNya'=>$sumbudget,'capexNya'=>$sumcapex,'total'=>$sumtotal];
}	
}
else
{
//total data regional
foreach($groupsregional as $rgnl)
{
$sregional = DB::table('vplafon_capex_regional')->where([['regional',$rgnl['regional']],['infratype','UNTAPPED']])->select('budgetNya','capexNya','total')->first();	
if(count($sregional) > 0){
$sumtotalRegional = $rgnl['total'] + $sregional['total'];	
$sumbudgetNyaRegional = ($rgnl['budget'] + $sregional['budgetNya']) / $sumtotalRegional;	
$sumcapexNyaRegional = ($rgnl['capex'] + $sregional['capexNya']) / $sumtotalRegional;
$listregional[]=$rgnl['regional'];
$listregionalbudgetNya[]=$sumbudgetNyaRegional;
$listregionalcapexNya[]=$sumcapexNyaRegional;
$listregionaltotal[]=$sumtotalRegional;	
$sr[]=['regional'=>$rgnl['regional'],'budgetNya'=>$sumbudgetNyaRegional,'capexNya'=>$sumcapexNyaRegional,'total'=>$sumtotalRegional];
}else{
$sumtotalRegional = $rgnl['total'];
$sumbudgetNyaRegional = $rgnl['budget'] / $sumtotalRegional;	
$sumcapexNyaRegional = $rgnl['capex'] / $sumtotalRegional;
$listregional[]=$rgnl['regional'];
$listregionalbudgetNya[]=$sumbudgetNyaRegional;
$listregionalcapexNya[]=$sumcapexNyaRegional;
$listregionaltotal[]=$sumtotalRegional;	
$sr[]=['regional'=>$rgnl['regional'],'budgetNya'=>$sumbudgetNyaRegional,'capexNya'=>$sumcapexNyaRegional,'total'=>$sumtotalRegional];
}
}

//total data area
foreach($groupsarea as $ar)
{
$sarea = DB::table('vplafon_capex_area')->where([['area',$ar['area']],['infratype','UNTAPPED']])->select('budgetNya','capexNya','total')->first();
if(count($sarea) > 0){
$sumtotalArea = $ar['total'] + $sarea->total;	
$sumbudgetNyaArea = ($ar['budget'] + $sarea->budgetNya) / $sumtotalArea;	
$sumcapexNyaArea = ($ar['capex'] + $sarea->capexNya) / $sumtotalArea;	
$listarea[]=$ar['area'];
$listareabudgetNya[]=$sumbudgetNyaArea;
$listareacapexNya[]=$sumcapexNyaArea;
$listareatotal[]=$sumtotalArea;
$sa[]=['area'=>$ar['area'],'budgetNya'=>$sumbudgetNyaArea,'capexNya'=>$sumcapexNyaArea,'total'=>$sumtotalArea];
}else{
$sumtotalArea = $ar['total'];
$sumbudgetNyaArea = $ar['budget'] / $sumtotalArea;	
$sumcapexNyaArea = $ar['capex'] / $sumtotalArea;
$listarea[]=$ar['area'];
$listareabudgetNya[]=$sumbudgetNyaArea;
$listareacapexNya[]=$sumcapexNyaArea;
$listareatotal[]=$sumtotalArea;
$sa[]=['area'=>$ar['area'],'budgetNya'=>$sumbudgetNyaArea,'capexNya'=>$sumcapexNyaArea,'total'=>$sumtotalArea];
}
}

$snasional = DB::table('vplafon_capex_nasional')->where('infratype','UNTAPPED')->select('budgetNya','capexNya','total')->first();
if(count($snasional) > 0)
{
$sumtotal = count($data)+$snasional->total;
$sumbudget = ($budget+$snasional->capexNya)/$sumtotal;
$sumcapex = ($capex+$snasional->capexNya)/$sumtotal;
$sn =['budgetNya'=>$sumbudget,'capexNya'=>$sumcapex,'total'=>$sumtotal];
}
else
{
$sumtotal = count($data);
$sumbudget = $budget / $sumtotal;
$sumcapex =$capex / $sumtotal;
$sn =['budgetNya'=>$sumbudget,'capexNya'=>$sumcapex,'total'=>$sumtotal];
}	
}


return response()->json(['kode'=>$data,'sr'=>$sr,'regional'=>$listregional,'listregionalbudgetNya'=>$listregionalbudgetNya,'listregionalcapexNya'=>$listregionalcapexNya,'listregionaltotal'=>$listregionaltotal,'sa'=>$sa,'area'=>$listarea,'listareabudgetNya'=>$listareabudgetNya,'listareacapexNya'=>$listareacapexNya,'listareatotal'=>$listareatotal,'nasional'=>$sn]);


	}
	
	
	
	  public function ApprovalProjectOfficeMasal(Request $request)
    {
        $valid = $this->validate($request, [
         'message' => 'required',
         'infratype' => 'required',
        'levelnya' => 'required|max:255',
        'statusnya' => 'required|max:255',
    ]);
if (!$valid)
    {

    $id = $request->id;	    
    $message = 'Pesan APPROVAL dari '.Auth::guard('karyawan')->user()->name.' :'.$request->get('message');
    $statusnya = $request->get('statusnya');
    $status = 'APPROVED';
    $levelnya = $request->get('levelnya');

$ShowData = DB::table('vprojectimplementation')->select('id','projectid','area','capex')->whereIn('id', $id)->get();
$emailNya = array();
foreach($ShowData as $a)
{
$create = ProjectStatus::create(['project_id'=>$a->id,'user_id'=>Auth::guard('karyawan')->user()->id,'status'=>$status,'message'=>$message]);  	
$this->SendingNotif($a->id,$status,$levelnya,$a->area) ;	
$pesan = User::where([['level',$levelnya],['area',$a->area]])->select('id','email','name')->get();
$vprojectimplementation = DB::table('vprojectimplementation')->where('id',$a->id)->first();

$this->SendingNotif($a->id,$status,$levelnya,$a->area) ;	
$pesan = User::where([['level',$levelnya],['area',$a->area]])->select('id','email','name')->get();
$vprojectimplementation = DB::table('vprojectimplementation')->where('id',$a->id)->first();
foreach ($pesan as $p) {
$emailNya[] = $p['email'];
}
Project::where('id',$a->id)->update(['status_id'=>$create->id,'status'=>$statusnya,'updated_at'=>Carbon::now()]);
$masukEmail = array(
        'projectid' => $a->projectid,
        'message' => $message,
    'kata' => 'Project '.$a->projectid.' Menunggu Approval Anda',
        'infratype' => $request->get('infratype'),
        'vprojectimplementation' => $vprojectimplementation,
        'name' => Auth::guard('karyawan')->user()->name); 
$this->KirimEmailDetail($emailNya,$masukEmail) ;

}
$kata = 'Project Menunggu Approval '.$levelnya;
return response()->json(['success'=>$kata]);           
        
    }
else
    {
 return response()->json('error', $valid);
    }
    } 
	
	
	
	
	
	
	/* baru */
	/* baru */

}
