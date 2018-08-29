<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Notifications\Notifiable;
use Response,View,Input,Auth,Session,Validator,File,Hash,DB,Excel;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Validation\Rule;
use PDF;
use Tymon\JWTAuth\Facades\JWTAuth;
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
use App\Models\Pesan;
use App\Models\Log;



class IndexController extends Controller
{
	
	private $user;
    public function __construct(User $user){
		
        $this->user = $user;
    }
  
  

    public function login(Request $request){
		
        $credentials = $request->only('email', 'password');
        $token = null;
        try {
           if (!$token = JWTAuth::attempt($credentials)) {
            return response()->json(['success' => false, 'error' => 'These credentials do not match our records.'], 401);
           }
        } catch (JWTAuthException $e) {
            return response()->json(['success' => false, 'error' => 'could_not_create_token'], 500);
        }
        return response()->json(['success' => true, 'data'=> [ 'token' => $token ]]);
    }
	
	    public function logout(Request $request) {
        $this->validate($request, ['token' => 'required']);
        try {
            JWTAuth::invalidate($request->input('token'));
            return response()->json(['success' => true]);
        } catch (JWTException $e) {
            // something went wrong whilst attempting to encode the token
            return response()->json(['success' => false, 'error' => 'Failed to logout, please try again.'], 500);
        }
    }

    public function getAuthUser(Request $request){
        $user = JWTAuth::toUser($request->token);
        return response()->json(['result' => $user]);
    }
	
	

    public function test(Request $request){
        return response()->json(['email' => $request->email]);
    }

    
}
