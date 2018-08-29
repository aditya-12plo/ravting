<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Notifications\Notifiable;
use Response,View,Input,Auth,Session,Validator,File,Hash,DB;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Crypt;

use App\Models\User;
use App\Models\Department;
use App\Models\MenuUser;
use App\Models\Menu;
use App\Models\Log;

class DepartmentController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
        $this->data['menumaster']  = Menu::with('submenu')->get();
    }

    
    public function index(Request $request)
    {
        $perPage = $request->per_page;
        $search = $request->filter;
        $min = $request->min;
        $max = $request->max;
        $query = DB::table('department')->select('department.id','department.company_id','department.department_initial','department.department_name','company.company_name','department.created_at')->join('company', function ($join) {
            $join->on('company.id', '=', 'department.company_id')->orderBy('department.id','DESC');
			 });
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('department.department_initial', 'LIKE', $like)
					->orWhere('department.department_name', 'LIKE', $like)
					->orWhere('company.company_name', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('department.created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('department.created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('department.created_at','=',$min)
            ->where('department.department_initial', 'LIKE', $like)
					->orWhere('department.department_name', 'LIKE', $like)
					->orWhere('company.company_name', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('department.created_at','=',$max)
            ->where('department.department_initial', 'LIKE', $like)
					->orWhere('department.department_name', 'LIKE', $like)
					->orWhere('company.company_name', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('department.created_at','>=',$min)->whereDate('department.created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('department.created_at','>=',$min)->whereDate('department.created_at','<=',$max)
					->where('department.department_initial', 'LIKE', $like)
					->orWhere('department.department_name', 'LIKE', $like)
					->orWhere('company.company_name', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
	        public function store(Request $request)
    {
$valid = $this->validate($request, [
        'department_initial' => 'required|max:25',
        'department_name' => 'required|max:191',
        'company_id' => 'required',
    ]);
if (!$valid)
    {
		$cek = Department::where('company_id',Input::get('company_id'))->get();
		$wordCount = $cek->count();
		if($wordCount <= 0)
		{
$masuk = array('company_id' => Input::get('company_id'),'department_initial' => Input::get('department_initial'),'department_name' => Input::get('department_name'));
Log::create(['email' => Auth::user()->email, 'table_action'=>'department' ,'action' => 'insert', 'data' => json_encode($masuk)]);
Department::create($masuk);
return response()->json(['success'=>'Add Company Success']);
		}
		else
		{
			$all_data_department_name = array();
			$all_data_department_initial = array();
			foreach($cek as $m){
					$all_data_department_name[] =  $m->department_name;
					$all_data_department_initial[] =  $m->department_initial;
				}
			if(in_array(Input::get('department_name'),$all_data_department_name)){
				return response()->json(['department_name'=>'department name has already been taken.']);
			}
			elseif(in_array(Input::get('department_initial'),$all_data_department_initial))
			{
				return response()->json(['department_initial'=>'department initial has already been taken.']);
			}
			else
			{
				$masuk = array('company_id' => Input::get('company_id'),'department_initial' => Input::get('department_initial'),'department_name' => Input::get('department_name'));
Log::create(['email' => Auth::user()->email, 'table_action'=>'department' ,'action' => 'insert', 'data' => json_encode($masuk)]);
Department::create($masuk);
return response()->json(['success'=>'Add Department Success']);
			}
			
		}

    }
else
    {
 return response()->json('error', $valid);
    }
    }
	
	
	 public function update(Request $request, $id)
    {
        $cek = Department::findOrFail($id);
if(!$cek)
{
 return response()->json(['error'=>'Code Not Found']);
}
else
{
$valid = $this->validate($request, [
        'department_initial' => 'required|max:25',
        'department_name' => 'required|max:191',
        'company_id' => 'required',
    ]);
    
if (!$valid)
    {

$cek = Department::where('company_id',Input::get('company_id'))->get();
		$wordCount = $cek->count();
		if($wordCount <= 0)
		{
$edit = array('company_id' => Input::get('company_id'),'department_initial' => Input::get('department_initial'),'department_name' => Input::get('department_name'));
Log::create(['email' => Auth::user()->email, 'table_action'=>'department' ,'action' => 'update', 'data' => json_encode($cek)]);
$cek->update($edit);
return response()->json(['success'=>'Edit Company Success']);
		}
		else
		{
			$all_data_department_name = array();
			$all_data_department_initial = array();
			foreach($cek as $m){
					$all_data_department_name[] =  $m->department_name;
					$all_data_department_initial[] =  $m->department_initial;
				}
			if(in_array(Input::get('department_name'),$all_data_department_name)){
				return response()->json(['department_name'=>'department name has already been taken.']);
			}
			elseif(in_array(Input::get('department_initial'),$all_data_department_initial))
			{
				return response()->json(['department_initial'=>'department initial has already been taken.']);
			}
			else
			{
				$masuk = array('company_id' => Input::get('company_id'),'department_initial' => Input::get('department_initial'),'department_name' => Input::get('department_name'));
Log::create(['email' => Auth::user()->email, 'table_action'=>'department' ,'action' => 'insert', 'data' => json_encode($masuk)]);
Department::create($masuk);
return response()->json(['success'=>'Add Department Success']);
			}
			
		}


$edit = array('company_name' => Input::get('company_name'),'company_address' => Input::get('company_address'));   
Log::create(['email' => Auth::user()->email, 'table_action'=>'department' ,'action' => 'update', 'data' => json_encode($cek)]);
$cek->update($edit);
return response()->json(['success'=>'Edit Company Success']);
    }
else
    {
 return response()->json('error', $valid);
    }
} 
    }
	
	

     public function destroy($id)
    {
$cek = Department::findOrFail($id);
if(!$cek)
{
 return response()->json(['error'=>'Department Not Found']);
}
else
{
$delete = Department::where('id',$id)->delete();
if(!$delete)
{
return response()->json(['error'=>'Department Delete Error']);
}
else
{
return response()->json(['success'=>'Department Delete Success']);
}
}
    }

         public function deleteAll($id)
    {
        $get =  Department::whereIn('id',explode(",",$id))->get();
          $cek = Department::whereIn('id',explode(",",$id))->delete();
        if(!$cek)
{
return response()->json(['error'=>'Delete Error']);
}
else
{return response()->json(['success'=>"Department Deleted successfully."]);}
    }

    
}
