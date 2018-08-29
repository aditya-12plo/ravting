<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Notifications\Notifiable;
use Response,View,Input,Auth,Session,Validator,File,Hash,DB;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Crypt;

use App\Models\User;
use App\Models\MenuUser;
use App\Models\Menu;
use App\Models\SubMenu;
use App\Models\Log;

class MenuRoleController extends Controller
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
        $query =  DB::table('menu_user')->select('menu_user.id','users.name','users.email','menu_user.rights','menu_user.rights_detail','menu_user.created_at')->join('users', function ($join) {
            $join->on('menu_user.user_id', '=', 'users.id')->orderBy('menu_user.id','DESC');
        });
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('users.name', 'LIKE', $like)
                        ->orWhere('users.email', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('menu_user.created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('menu_user.created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('menu_user.created_at','=',$min)
            ->where('users.name', 'LIKE', $like)
            ->orWhere('users.email', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('menu_user.created_at','=',$max)
             ->where('users.name', 'LIKE', $like)
            ->orWhere('users.email', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('menu_user.created_at','>=',$min)->whereDate('menu_user.created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('menu_user.created_at','>=',$min)->whereDate('menu_user.created_at','<=',$max)
             ->where('users.name', 'LIKE', $like)
            ->orWhere('users.email', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }


        public function store(Request $request)
    {
$valid = $this->validate($request, [
        'user_id' => 'required|unique:menu_user,user_id',
    ]);
if (!$valid)
    {
    $rights = implode(',',(array)Input::get('rights'));
	$rights_detail = implode(',',(array)Input::get('rights_detail'));

$masuk = array(
        'user_id' => Input::get('user_id'),
        'rights' => $rights,
        'rights_detail' =>$rights_detail 
        );
Log::create(['email' => Auth::user()->email, 'table_action'=>'menu_user' ,'action' => 'insert', 'data' => json_encode($masuk)]);
MenuUser::create($masuk);
return response()->json(['success'=>'Add Sub Menu Success']);
    }
else
    {
 return response()->json('error', $valid);
    }

    }



    public function update(Request $request, $id)
    {
        $cek = MenuUser::findOrFail($id);
if(!$cek)
{
 return response()->json(['error'=>'Code Not Found']);
}
else
{
    $rights = implode(',',(array)Input::get('rights'));
	$rights_detail = implode(',',(array)Input::get('rights_detail'));
	$edit = array(
        'rights' => $rights,
        'rights_detail' =>$rights_detail 
        );
Log::create(['email' => Auth::user()->email, 'table_action'=>'menu_user' ,'action' => 'update', 'data' => json_encode($cek)]);
$cek->update($edit);
return response()->json(['success'=>'Edit Menu Success']);

} 
    }

     public function destroy($id)
    {
$cek = MenuUser::findOrFail($id);
if(!$cek)
{
 return response()->json(['error'=>'Code Not Found']);
}
else
{
Log::create(['email' => Auth::user()->email, 'table_action'=>'menu_user' ,'action' => 'delete', 'data' => json_encode($cek)]);
$delete = MenuUser::where('id',$id)->delete();
if(!$delete)
{
return response()->json(['error'=>'Delete Error']);
}
else
{
return response()->json(['success'=>'Delete Menu Success']);
}
}
    }

     public function GetMenu()
    {
        $cek = Menu::select('id','menu_name')->get();
        return response()->json($cek);
    }


     public function deleteAll($id)
    {
        
      
        $get =  MenuUser::whereIn('id',explode(",",$id))->get();
        Log::create(['email' => Auth::user()->email, 'table_action'=>'menu_user' ,'action' => 'delete', 'data' => json_encode($get)]);
          $cek = MenuUser::whereIn('id',explode(",",$id))->delete();
        if(!$cek)
{
return response()->json(['error'=>'Delete Error']);
}
else
{return response()->json(['success'=>"Sub Menu Deleted successfully."]);}
    }

    

     public function GetUser()
    {
$datauser = MenuUser::select('user_id')->get();
$cek = User::select('id','name','email')
 ->whereNotIn('id',$datauser)
 ->get();
      return response()->json($cek);
    }

    
}
