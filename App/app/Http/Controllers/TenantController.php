<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Notifications\Notifiable;
use Response,View,Input,Auth,Session,Validator,File,Hash,DB,Excel;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Crypt;
use Carbon\Carbon;
use App\Models\Standartimplementation;
use App\Models\ProjectImplementations;
use App\Models\ProjectStatus;
use App\Models\Tenant;
use App\Models\User;
use App\Models\Project;
use App\Models\Pemberitahuan;
use App\Models\Pesan;
use App\Models\Log;

class TenantController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
      //  $this->data['ttlpesan']  = Pesan::where('status','no')->count();
       $this->data['title']  = 'Selamat Datang';
    }

    
    public function index()
    {
        return view('Tenant.templates.home')->with($this->data);
    }


//user view profile
    public function profil()
    {
        $cek = Tenant::findOrFail(Auth::user()->id);
        return response()->json($cek);
    }
	

     // update admin update password
    public function q_UpdatePassword(Request $request)
    {

$valid = $this->validate($request, [
        'password' => 'required|max:255',
        'password_confirmation' => 'required|max:255|same:password'
    ]);
if (!$valid)
    {
$edit = array('password' => Hash::make($request->password),'password_api'=>md5($request->password));
Tenant::where("id",Auth::user()->id)->update($edit);

return response()->json(['success'=>'Update Password Success']);

    }
else
    {
 return response()->json('error', $valid);
    }

    }
	public function GetProjectDetailProses($id)
    {
       $cek = DB::table('vubislogic')
			->where('vubislogic.id',$id)
			->first();
         if(!$cek)
         {
            return response()->json('error',500);
         }
         else
         {
            $standart = DB::table('vprojectimplementation')->where([['project_id',$id],['status','standart']])->orderBy('status','ASC')->get();
            $additional = DB::table('vprojectimplementation')->where([['project_id',$id],['status','additional']])->orderBy('status','ASC')->get();
            $reduction = DB::table('vprojectimplementation')->where([['project_id',$id],['status','reduction']])->orderBy('status','ASC')->get();
            return response()->json(['header'=>$cek,'standart'=>$standart,'additional'=>$additional,'reduction'=>$reduction]);
         }
    }

    public function GetMessage(Request $request)
    {
        $perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = DB::table('notification')
            ->join('users', 'users.id', '=', 'notification.user_id')
            ->join('project', 'project.id', '=', 'notification.project_id')
            ->select('notification.*', 'users.name', 'users.level','project.sitename')
            ->where('tenant_id',Auth::user()->id)->orderBy('notification.status','no');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('users.name', 'LIKE', $like)
            ->orWhere('project.sitename', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('notification.created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('notification.created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('notification.created_at','=',$min)
            ->where('users.name', 'LIKE', $like)
            ->orWhere('project.sitename', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('notification.created_at','=',$max)
            ->where('users.name', 'LIKE', $like)
            ->orWhere('project.sitename', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('notification.created_at','>=',$min)->whereDate('notification.created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('notification.created_at','>=',$min)->whereDate('notification.created_at','<=',$max)
            ->where('users.name', 'LIKE', $like)
            ->orWhere('project.sitename', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }



    public function DetailMessage($id)
    {
         $cek = Project::findOrFail($id);
         if(!$cek)
         {
            return response()->json('error');
         }
         else
         {
            $pesan = DB::table('notification')
            ->join('users', 'users.id', '=', 'notification.user_id')
            ->select('notification.*', 'users.name', 'users.level')
            ->where('project_id',$id)->orderBy('notification.id','DESC')->get();
            return response()->json(['header'=>$cek,'detail'=>$pesan]);
         }
    }

    public function UpdateMessage($id)
    {
         Pesan::where('project_id',$id)->update(array('status'=>'read'));
            return response()->json(['success']);
    }


    public function TGetProject(Request $request)
    {
        $search =$request->get('cari');
        $min = $request->min;
        $max = $request->max;
        $query = Project::where([['tenantid',Auth::user()->tenantid],['status','NEW']])->orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)->orWhere('regional', 'LIKE', $like);
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
            ->orWhere('tower', 'LIKE', $like)->orWhere('regional', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)->orWhere('regional', 'LIKE', $like);
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
            ->orWhere('tower', 'LIKE', $like)->orWhere('regional', 'LIKE', $like);
        }
        $this->data['show'] = $query->paginate(15);
		return view('Tenant/templates/GetProjectNew',compact('show'))->with($this->data);
    }
	
	public function TDetailProject($id)
    {
         $cek = Project::findOrFail(Crypt::decryptString($id));
         if(!$cek)
         {
            return redirect()->back()->with('error', 'Trouble');
         }
         else
         {
			 
            $this->data['header'] = $cek;
            $this->data['detail'] = Standartimplementation::where('tower',$cek->tower)->with(['implementation'])->first();
            return view('Tenant/templates/DetailProjectNew')->with($this->data);
         }
    }

    public function GetProject(Request $request)
    {
        $perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = Project::select('id','projectid','tenantid','regional','sitename','filename','tower','created_at')->where([['tenantid',Auth::user()->tenantid],['status','NEW']])->orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)->orWhere('projectid', 'LIKE', $like);
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
            ->orWhere('tower', 'LIKE', $like)->orWhere('projectid', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)->orWhere('projectid', 'LIKE', $like);
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
            ->orWhere('tower', 'LIKE', $like)->orWhere('projectid', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }

       public function GetProjectDetail($id)
    {
         $cek = Project::findOrFail($id);
         if(!$cek)
         {
            return response()->json('error',500);
         }
         else
         {
            $detail = Standartimplementation::where([['tower',$cek->tower],['regional',$cek->regional]])->with(['implementation'])->first();
            return response()->json(['header'=>$cek,'detail'=>$detail]);
         }
    }
       public function GetRejectProjectDetail($id)
    {
         $cek = Project::findOrFail($id);
         if(!$cek)
         {
            return response()->json('error',500);
         }
         else
         {
            $standart = ProjectImplementations::select('workitem','unit','volume','unitprice','status')->where([['project_id',$id],['status','standart']])->orderBy('id','DESC')->get();
            $additional = ProjectImplementations::select('workitem','unit','volume','unitprice','status')->where([['project_id',$id],['status','additional']])->orderBy('id','DESC')->get();
            $reduction = ProjectImplementations::select('workitem','unit','volume','unitprice','status')->where([['project_id',$id],['status','reduction']])->orderBy('id','DESC')->get();
            $pesan = DB::table('project_status')
			->join('users', 'users.id', '=', 'project_status.user_id')
			->select('project_status.message', 'users.name', 'users.level')
            ->where('project_status.id',$cek->status_id)->first();
            return response()->json(['header'=>$cek,'standart'=>$standart,'additional'=>$additional,'reduction'=>$reduction,'pesan'=>$pesan]);
         }
    }

            public function uploadfile(Request $request)
    {
        $id = Input::get('projectid');
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
return response()->json(['success'=>'Upload File Berhasil']);

}
    }
}
else
{
    return response()->json(['file_name'=>'File upload hanya berektensi .pdf']);
}
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
 return response()->json(['file_name'=>'File Upload Gagal']);
}
else
{
$cek->filename = '';
$cek->save();
return response()->json(['success'=>'File Berhasil Di Hapus']);

}
    


    
}
    }

            public function AddImplementations(Request $request)
    {
$standart =  Input::get('standart');
$addtional =  Input::get('addtional');
$reduction =  Input::get('reduction');
$project_id =  Input::get('projectid');
$dataSet = [];
$dataSet2 = [];
$dataSet3 = [];
$dataSet4 = [];
$no = 0;
ProjectImplementations::where('project_id',$project_id)->delete();
foreach ($standart as $s) {
             $dataSet[] = ['project_id'=>$project_id,'workitem'=>$s['workitem'],'unit'=>$s['unit'],'volume'=>$s['volume'],'unitprice'=>$s['unitprice'],'status'=>'standart'];
}
if(count($addtional) > 0)
{


foreach ($addtional as $s) {
             $dataSet2[] = ['project_id'=>$project_id,'workitem'=>$s['workitem'],'unit'=>$s['unit'],'volume'=>$s['volume'],'unitprice'=>$s['unitprice'],'status'=>'additional'];
			 }
}
if(count($reduction) > 0)
{


foreach ($reduction as $s) {
             $dataSet3[] = ['project_id'=>$project_id,'workitem'=>$s['workitem'],'unit'=>$s['unit'],'volume'=>$s['volume'],'unitprice'=>$s['unitprice'],'status'=>'reduction'];
			 }
}
$cek = DB::table('project')
 ->join('tenants', 'project.tenantid', '=', 'tenants.tenantid')
 ->select('project.projectid', 'project.regional', 'tenants.id AS tenantcode', 'tenants.name')
 ->where('project.id',$project_id)->first();
$pesan = User::where([['level','WASPANG'],['regional',$cek->regional]])->select('id')->get();
foreach ($pesan as $p) {
             $dataSet4[] = ['project_id'=>$project_id,'users_id'=>$p['id'],'message'=>'Project '.$cek->projectid.' Menunggu Approval','status'=>'0', 'created_at'=>Carbon::now(),'updated_at'=>Carbon::now()];
			 }

ProjectImplementations::insert($dataSet); // Eloquent approach
ProjectImplementations::insert($dataSet2); // Eloquent approach
ProjectImplementations::insert($dataSet3); // Eloquent approach
Pemberitahuan::insert($dataSet4); // Eloquent approach
Project::where('id',$project_id)->update(['status'=>'AREA - REVIEWER']);
return response()->json(['success'=>'Data Berhasil Dikirim']);
    }

    
    public function TGetProjectReject(Request $request)
    {
        $perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = Project::where([['tenantid',Auth::user()->tenantid],['status','CANCEL']])->orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)->orWhere('regional', 'LIKE', $like);
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
            ->orWhere('tower', 'LIKE', $like)->orWhere('regional', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)->orWhere('regional', 'LIKE', $like);
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
            ->orWhere('tower', 'LIKE', $like)->orWhere('regional', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
	 public function GetProjectRepair(Request $request)
    {
        $perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = Project::where([['tenantid',Auth::user()->tenantid],['status','REPAIR TENANT']])->orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)->orWhere('regional', 'LIKE', $like);
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
            ->orWhere('tower', 'LIKE', $like)->orWhere('regional', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('sitename', 'LIKE', $like)
            ->orWhere('tower', 'LIKE', $like)->orWhere('regional', 'LIKE', $like);
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
            ->orWhere('tower', 'LIKE', $like)->orWhere('regional', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
       public function GetRepairProjectDetail($id)
    {
         $cek = Project::where([['id',$id],['status','REPAIR TENANT']])->first();
         if(!$cek)
         {
            return response()->json('error',500);
         }
         else
         {
			$pesan = DB::table('project_status')
			->join('users', 'users.id', '=', 'project_status.user_id')
			->select('project_status.message', 'users.name', 'users.level')
            ->where('project_status.id',$cek->status_id)->first();
            $additional = ProjectImplementations::where([['project_id',$id],['status','additional']])->get();
            $standart = ProjectImplementations::where([['project_id',$id],['status','standart']])->get();
            $reduction = ProjectImplementations::where([['project_id',$id],['status','reduction']])->get();
            return response()->json(['header'=>$cek,'pesan'=>$pesan,'standart'=>$standart,'additional'=>$additional,'reduction'=>$reduction]);
         }
    }
	
       public function GetMessageNya($id)
    {
            $pesan = DB::table('project_status')
            ->join('users', 'users.id', '=', 'project_status.user_id')
            ->select('project_status.*', 'users.name', 'users.level')
            ->where('project_status.project_id',$id)->orderBy('project_status.id','ASC')->get();
            return response()->json($pesan);
         
    }
	
	public function downloadExcel($id)
	{
		
		$data = DB::table('project')
            ->join('tenants', 'project.tenantid', '=', 'tenants.tenantid')
            ->select('project.projectid','project.sitename','project.projectdescription','project.regional', 'tenants.name','project.tower','project.projectprice')
			->where('project.id',$id)
            ->first();
$datanya = DB::table('vprojectimplementation')->select('status','workitem','unit','volume','unitprice','total')->where('project_id',$id)->orderBy('status','asc')->get();
		$standart = DB::table('vprojectimplementation')->select('total')->where([['project_id',$id],['status','standart']])->get();
		$additional = DB::table('vprojectimplementation')->select('total')->where([['project_id',$id],['status','additional']])->get();
		$reduction = DB::table('vprojectimplementation')->select('total')->where([['project_id',$id],['status','reduction']])->get();
$datastandart = array();
$dataadditional = array();
$datareduction = array();
$databiaya = array();		
		
foreach ($datanya as $resultnya) {
   $databiaya[] = (array)$resultnya;  
}
foreach ($standart as $result) {
   $datastandart[] = (array)$result;  
}
foreach ($additional as $result2) {
   $dataadditional[] = (array)$result2;  
}
foreach ($reduction as $result3) {
   $datareduction[] = (array)$result3;  
}
$sumdatastandart = 0;
$sumdataadditional = 0;
$sumdatareduction = 0;
foreach($datastandart as $item) {
	$sumdatastandart += $item['total'];
}
foreach($dataadditional as $item2) {
	$sumdataadditional += $item2['total'];
}
foreach($datareduction as $item3) {
	$sumdatareduction += $item3['total'];
}
$total = ($sumdatastandart + $sumdataadditional) - $sumdatareduction;

		return Excel::create($data->projectdescription, function($excel) use ($databiaya,$data,$sumdatastandart,$sumdataadditional,$sumdatareduction,$total ){

    $excel->sheet($data->projectid, function($sheet) use ($databiaya,$data,$sumdatastandart,$sumdataadditional,$sumdatareduction,$total  ){
			$sheet->row(1, array('PROJECT ID', $data->projectid));
			$sheet->row(2, array('DESKRIPSI PROJECT', $data->projectdescription));
			$sheet->row(2, array('TENANT', $data->name));
			$sheet->row(3, array('SITE NAME', $data->sitename));
			$sheet->row(4, array('REGIONAL', $data->regional));
			$sheet->row(5, array('TOWER', $data->tower.' M'));
			$sheet->row(6, array('TOTAL BIAYA IMPLEMENTASI PEKERJAAN', $total));
			$sheet->row(7, array('TOTAL BIAYA IMPLEMENTASI STANDART', $sumdatastandart));
			$sheet->row(8, array('TOTAL BIAYA IMPLEMENTASI ADDITIONAL', $sumdataadditional));
			$sheet->row(9, array('TOTAL REDUCTION BIAYA', $sumdatareduction));
			$sheet->row(15, array('BIAYA IMPLEMENTASI PEKERJAAN'));
			$sheet->row(16, array('STANDAR/ADDITIONAL/REDUCTION','DESKRIPSI PEKERJAAN','SATUAN','VALUME','HARGA SATUAN','TOTAL'));
			
			$sheet->fromArray($databiaya, null, 'A17', false, false);
    });
	
})->export('xlsx');

		//dd($data2,$sum);
	}
	
	
	 public function GetProjectFinal(Request $request)
    {
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = DB::table('vubislogic')
			->where([['status','FINISH'],['tenantid',Auth::user()->tenantid]])
            ->orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('name', 'LIKE', $like);
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
            ->orWhere('name', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('name', 'LIKE', $like);
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
            ->orWhere('name', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	 public function GetProjectProgress(Request $request)
    {
		$perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = DB::table('vubislogic')
			->where('tenantid',Auth::user()->tenantid)
			->whereNotIn('status',['FINISH','CANCEL','NEW'])
            ->orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('projectid', 'LIKE', $like)
            ->orWhere('name', 'LIKE', $like);
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
            ->orWhere('name', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('projectid', 'LIKE', $like)
            ->orWhere('name', 'LIKE', $like);
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
            ->orWhere('name', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
}
