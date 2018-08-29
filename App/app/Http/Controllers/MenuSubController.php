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

class MenuSubController extends Controller
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
        $query =  DB::table('menu_sub')->select('menu_sub.id','menu_sub_code','menu.menu_name','menu_sub.sub_menu_name','menu_sub.sub_menu_url','menu_sub.created_at')->join('menu', function ($join) {
            $join->on('menu_sub.menu_id', '=', 'menu.id')->orderBy('menu_sub.id','DESC');
        });
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('menu.menu_name', 'LIKE', $like)
                        ->orWhere('menu_sub.sub_menu_name', 'LIKE', $like);
        }
        if(!$search && $min && !$max)
        {
            $query = $query->whereDate('menu.created_at','=',$min);
        }
        if(!$search && !$min && $max)
        {
            $query = $query->whereDate('menu.created_at','=',$max);
        }
        if($search && $min && !$max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('menu.created_at','=',$min)
            ->where('menu.menu_name', 'LIKE', $like)
            ->orWhere('menu_sub.sub_menu_name', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('menu.created_at','=',$max)
            ->where('menu.menu_name', 'LIKE', $like)
            ->orWhere('menu_sub.sub_menu_name', 'LIKE', $like);
        }
        if(!$search && $min && $max)
        {
            $query = $query->whereDate('menu.created_at','>=',$min)->whereDate('menu.created_at','<=',$max);
        }
        if($search && $min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('menu.created_at','>=',$min)->whereDate('menu.created_at','<=',$max)
            ->where('menu.menu_name', 'LIKE', $like)
            ->orWhere('menu_sub.sub_menu_name', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }


        public function store(Request $request)
    {
$valid = $this->validate($request, [
        'menu_id' => 'required',
        'menu_sub_code' => 'required|max:10|unique:menu_sub,menu_sub_code',
        'sub_menu_name' => 'required|max:191',
        'sub_menu_url' => 'required|max:191|unique:menu_sub,sub_menu_url',
    ]);
if (!$valid)
    {
        $masuk = array('menu_id' => Input::get('menu_id'), 'menu_sub_code' => Input::get('menu_sub_code'), 'sub_menu_name' => Input::get('sub_menu_name'), 'sub_menu_url' => Input::get('sub_menu_url'));
Log::create(['email' => Auth::user()->email, 'table_action'=>'menu_sub' ,'action' => 'insert', 'data' => json_encode($masuk)]);
SubMenu::create($masuk);
return response()->json(['success'=>'Add Sub Menu Success']);
    }
else
    {
 return response()->json('error', $valid);
    }
    }



    public function update(Request $request, $id)
    {
        $cek = SubMenu::findOrFail($id);
if(!$cek)
{
 return response()->json(['error'=>'Code Not Found']);
}
else
{
    if(!Input::get('menu_id'))
{
$valid = $this->validate($request, [
        'sub_menu_name' => 'required|max:191',
        'menu_sub_code' => 'required|max:10|unique:menu_sub,menu_sub_code,'.$id,
        'sub_menu_url' => 'required|max:191|unique:menu_sub,sub_menu_url,'.$id,
    ]);
}
else
{
    $valid = $this->validate($request, [
        'menu_id' => 'required',
        'sub_menu_name' => 'required|max:191',
        'menu_sub_code' => 'required|max:10|unique:menu_sub,menu_sub_code,'.$id,
        'sub_menu_url' => 'required|max:191|unique:menu_sub,sub_menu_url,'.$id,
    ]);
}  
if (!$valid)
    {
    if(!Input::get('menu_id'))
{
$edit = array('sub_menu_name' => Input::get('sub_menu_name'),'menu_sub_code' => Input::get('menu_sub_code'), 'sub_menu_url' => Input::get('sub_menu_url'));  
}
else
{
 $edit = array('menu_id' => Input::get('menu_id'),'menu_sub_code' => Input::get('menu_sub_code'), 'sub_menu_name' => Input::get('sub_menu_name'), 'sub_menu_url' => Input::get('sub_menu_url'));   
}
Log::create(['email' => Auth::user()->email, 'table_action'=>'menu_sub' ,'action' => 'update', 'data' => json_encode($cek)]);
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
$cek = SubMenu::findOrFail($id);
if(!$cek)
{
 return response()->json(['error'=>'Code Not Found']);
}
else
{
Log::create(['email' => Auth::user()->email, 'table_action'=>'menu_sub' ,'action' => 'delete', 'data' => json_encode($cek)]);
$delete = SubMenu::where('id',$id)->delete();
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

     public function GetMenuDetail()
    {
        $cek = SubMenu::select('id','menu_id','sub_menu_name')->get();
        return response()->json($cek);
    }


     public function deleteAll($id)
    {
        
      
        $get =  SubMenu::whereIn('id',explode(",",$id))->get();
        Log::create(['email' => Auth::user()->email, 'table_action'=>'menu_sub' ,'action' => 'delete', 'data' => json_encode($get)]);
          $cek = SubMenu::whereIn('id',explode(",",$id))->delete();
        if(!$cek)
{
return response()->json(['error'=>'Delete Error']);
}
else
{return response()->json(['success'=>"Sub Menu Deleted successfully."]);}
    }

    
}
