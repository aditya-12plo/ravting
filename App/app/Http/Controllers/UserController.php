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

class UserController extends Controller
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
        $query = User::orderBy('id','DESC');
        if ($search && !$min && !$max) {
            $like = "%{$search}%";
            $query = $query->where('name', 'LIKE', $like)
            ->orWhere('email', 'LIKE', $like)
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
            ->where('name', 'LIKE', $like)
            ->orWhere('email', 'LIKE', $like)
            ->orWhere('level', 'LIKE', $like);
        }
        if($search && !$min && $max)
        {
            $like = "%{$search}%";
            $query = $query->whereDate('created_at','=',$max)
            ->where('name', 'LIKE', $like)
            ->orWhere('email', 'LIKE', $like)
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
            ->where('name', 'LIKE', $like)
            ->orWhere('email', 'LIKE', $like)
            ->orWhere('level', 'LIKE', $like);
        }
        return $query->paginate($perPage);
    }


        public function store(Request $request)
    {
$valid = $this->validate($request, [
        'name' => 'required|max:191',
        'email' => 'required|max:191|email|unique:users,email',
        'password' => 'required|max:191',
        'level' => 'required|in:USER,ADMINISTRATOR',
    ]);
if (!$valid)
    {
        $masuk = array('name' => Input::get('name'), 'email' => Input::get('email'), 'password' =>  Hash::make(Input::get('password')), 'level' => Input::get('level'));
Log::create(['email' => Auth::user()->email, 'table_action'=>'users' ,'action' => 'insert', 'data' => json_encode($masuk)]);
User::create($masuk);
return response()->json(['success'=>'Add Adminstrator Success']);
    }
else
    {
 return response()->json('error', $valid);
    }
    }



    public function update(Request $request, $id)
    {
        $cek = User::findOrFail($id);
if(!$cek)
{
 return response()->json(['error'=>'Code Not Found']);
}
else
{
    if(Input::get('password') == '')
    {
$valid = $this->validate($request, [
        'name' => 'required|max:191',
        'email' => 'required|max:191|email|unique:users,email,'.$id,
        'level' => 'required|in:USER,ADMINISTRATOR',
    ]);
    }
    else
    {
$valid = $this->validate($request, [
        'name' => 'required|max:191',
        'email' => 'required|max:191|email|unique:users,email,'.$id,
        'password' => 'required|max:191',
        'level' => 'required|in:USER,ADMINISTRATOR',
    ]);
    }
if (!$valid)
    {
            if(Input::get('password') == '')
    {
        $edit = array('name' => Input::get('name'), 'email' => Input::get('email'), 'level' => Input::get('level'));
    }
    else
    {
         $edit = array('name' => Input::get('name'), 'email' => Input::get('email'), 'password' =>  Hash::make(Input::get('password')), 'level' => Input::get('level'));
    }
Log::create(['email' => Auth::user()->email, 'table_action'=>'users' ,'action' => 'update', 'data' => json_encode($cek)]);
$cek->update($edit);
return response()->json(['success'=>'Edit Adminstrator Success']);
    }
else
    {
 return response()->json('error', $valid);
    }
} 
    }

     public function destroy($id)
    {
$cek = User::findOrFail($id);
if(!$cek)
{
 return response()->json(['error'=>'Code Not Found']);
}
else
{
Log::create(['email' => Auth::user()->email, 'table_action'=>'users' ,'action' => 'delete', 'data' => json_encode($cek)]);
$delete = User::where('id',$id)->delete();
if(!$delete)
{
return response()->json(['error'=>'Delete Error']);
}
else
{
return response()->json(['success'=>'Delete Success']);
}
}
    }

    
}
