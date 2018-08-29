<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Notifications\Notifiable;
use Response,View,Input,Auth,Session,Validator,File,Hash;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Crypt;

use App\Models\User;
use App\Models\MenuUser;
use App\Models\Menu;
use App\Models\Log;

class MenuController extends Controller
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
        $query = Menu::orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('menu_name', 'LIKE', $like);
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
            ->where('menu_name', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('menu_name', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','>=',$min)->whereDate('created_at','<=',$max)
            ->where('menu_name', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }


        public function store(Request $request)
    {
$valid = $this->validate($request, [
        'menu_code' => 'required|max:10|unique:menu,menu_code',
        'menu_name' => 'required|max:191',
    ]);
if (!$valid)
    {
        $masuk = array('menu_name' => Input::get('menu_name'),'menu_code' => Input::get('menu_code'), 'menu_url' => Input::get('menu_url'));
Log::create(['email' => Auth::user()->email, 'table_action'=>'menu' ,'action' => 'insert', 'data' => json_encode($masuk)]);
Menu::create($masuk);
return response()->json(['success'=>'Add Menu Success']);
    }
else
    {
 return response()->json('error', $valid);
    }
    }



    public function update(Request $request, $id)
    {
        $cek = Menu::findOrFail($id);
if(!$cek)
{
 return response()->json(['error'=>'Code Not Found']);
}
else
{
$valid = $this->validate($request, [
        'menu_name' => 'required|max:10|unique:menu,menu_code,'.$id,
        'menu_name' => 'required|max:191',
    ]);
    
if (!$valid)
    {

$edit = array('menu_name' => Input::get('menu_name'),'menu_code' => Input::get('menu_code'), 'menu_url' => Input::get('menu_url'));   
Log::create(['email' => Auth::user()->email, 'table_action'=>'menu' ,'action' => 'update', 'data' => json_encode($cek)]);
$cek->update($edit);
return response()->json(['success'=>'Edit Menu Success']);
    }
else
    {
 return response()->json('error', $valid);
    }
} 
    }

     public function destroy($id)
    {
$cek = Menu::findOrFail($id);
if(!$cek)
{
 return response()->json(['error'=>'Code Not Found']);
}
else
{
Log::create(['email' => Auth::user()->email, 'table_action'=>'menu' ,'action' => 'delete', 'data' => json_encode($cek)]);
$delete = Menu::where('id',$id)->delete();
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

     public function deleteAll($id)
    {
        
      
        $get =  Menu::whereIn('id',explode(",",$id))->get();
        Log::create(['email' => Auth::user()->email, 'table_action'=>'menu' ,'action' => 'delete', 'data' => json_encode($get)]);
          $cek = Menu::whereIn('id',explode(",",$id))->delete();
        if(!$cek)
{
return response()->json(['error'=>'Delete Error']);
}
else
{return response()->json(['success'=>"Menu Deleted successfully."]);}
    }

    
}
