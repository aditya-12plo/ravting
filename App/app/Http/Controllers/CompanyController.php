<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Notifications\Notifiable;
use Response,View,Input,Auth,Session,Validator,File,Hash;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Crypt;

use App\Models\User;
use App\Models\Company;
use App\Models\MenuUser;
use App\Models\Menu;
use App\Models\Log;

class CompanyController extends Controller
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
        $query = Company::orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('company_name', 'LIKE', $like)
			->orWhere('company_initial', 'LIKE', $like);
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
            ->where('company_name', 'LIKE', $like)->orWhere('company_initial', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('company_name', 'LIKE', $like)->orWhere('company_initial', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('company_name', 'LIKE', $like)->orWhere('company_initial', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }
	
	
	        public function store(Request $request)
    {
$valid = $this->validate($request, [
        'company_name' => 'required|max:191|unique:company,company_name',
        'company_initial' => 'required|max:25|unique:company,company_initial',
        'company_address' => 'required',
    ]);
if (!$valid)
    {
        $masuk = array('company_name' => Input::get('company_name'),'company_initial' => Input::get('company_initial'),'company_address' => Input::get('company_address'));
Log::create(['email' => Auth::user()->email, 'table_action'=>'company' ,'action' => 'insert', 'data' => json_encode($masuk)]);
Company::create($masuk);
return response()->json(['success'=>'Add Company Success']);
    }
else
    {
 return response()->json('error', $valid);
    }
    }
	
	
	 public function update(Request $request, $id)
    {
        $cek = Company::findOrFail($id);
if(!$cek)
{
 return response()->json(['error'=>'Code Not Found']);
}
else
{
$valid = $this->validate($request, [
        'company_name' => 'required|max:1991|unique:company,company_name,'.$id,
        'company_initial' => 'required|max:25|unique:company,company_initial,'.$id,
        'company_address' => 'required',
    ]);
    
if (!$valid)
    {

$edit = array('company_name' => Input::get('company_name'),'company_initial' => Input::get('company_initial'),'company_address' => Input::get('company_address'));   
Log::create(['email' => Auth::user()->email, 'table_action'=>'company' ,'action' => 'update', 'data' => json_encode($cek)]);
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
$cek = Company::findOrFail($id);
if(!$cek)
{
 return response()->json(['error'=>'Code Not Found']);
}
else
{
$delete = Company::where('id',$id)->delete();
if(!$delete)
{
return response()->json(['error'=>'Company Delete Error']);
}
else
{
return response()->json(['success'=>'Company Delete Success']);
}
}
    }

         public function deleteAll($id)
    {
        $get =  Company::whereIn('id',explode(",",$id))->get();
          $cek = Company::whereIn('id',explode(",",$id))->delete();
        if(!$cek)
{
return response()->json(['error'=>'Delete Error']);
}
else
{return response()->json(['success'=>"Company Deleted successfully."]);}
    }

    
}
