<?php

namespace App\Http\Controllers\WebService;

use Illuminate\Http\Request;
use Hash,DB;

class LoginController extends Controller
{
    public function LoginUser (Request $request){
    	$email = $request->email;
    	$pass = $request->pass;
    	$type = $request->type;
        $deviceId = $request->device_id;
        $deviceName = $request->device_name;
        $playerIds = $request->player_ids;
        $tokenIds = $request->token_ids;
        $tokenSession = str_random(20);

    	if (isset($email) && isset($pass) && isset($deviceId) && isset($deviceName) && isset($playerIds) && isset($tokenIds)){    		
    		$pass = md5($pass);
            $query = DB::table('users')->where('email','=',$email)->where('password_api','=',$pass)->get();

	    	if (count($query) > 0){
                $dtUser = $query[0];
                $idUser = $dtUser->id;
                $sqlSession = DB::table('user_session')->where('id_user','=',$idUser)->where('device_id','=',$deviceId)->get();
                if (count($sqlSession) == 0){
                    DB::table('user_session')
                        ->insert([
                            "id_user"       => $idUser,
                            "player_ids"    => $playerIds,
                            "token_ids"     => $tokenIds,
                            "device_id"     => $deviceId,
                            "device_name"   => $deviceName,
                            "token_session" => $tokenSession
                        ]);
                }else{
                    $dtSession = $sqlSession[0];
                    $idSession = $dtSession->id;
                    DB::table('user_session')->where('id','=',$idSession)
                        ->update([
                            "player_ids"    => $playerIds,
                            "token_ids"     => $tokenIds,
                            "device_id"     => $deviceId,
                            "device_name"   => $deviceName,
                            "logout"        => 0,
                            "token_session" => $tokenSession
                        ]);
                }

	    		$response = [
	    			"status" => true,
	    			"data" => $dtUser,
                    "token" => $tokenSession
	    		];
	    	}else{
	    		$response = [
	    			"status" => false,
	    			"message" => "User Not Found"
	    		];
	    	}
    	}else{
    		$response = [
    			"status" => false,
    			"message" => "Data terkirim tidak lengkap"
    		];
    	}

    	return response()->json($response);
    }

     public function AutoLoginUser (Request $request){
        $email = $request->email;
        $pass = $request->pass;
        $type = $request->type;
        $deviceId = $request->device_id;
        $deviceName = $request->device_name;
        $playerIds = $request->player_ids;
        $tokenIds = $request->token_ids;
        $tokenSession = str_random(20);

        if (isset($email) && isset($pass) && isset($type) && isset($deviceId) && isset($deviceName) && isset($playerIds) && isset($tokenIds)){     
            $query = DB::table('users')->where('email','=',$email)->where('password_api','=',$pass)->get();
            if (count($query) > 0){
                $dtUser = $query[0];
                $idUser = $dtUser->id;
                $sqlSession = DB::table('user_session')->where('id_user','=',$idUser)->where('device_id','=',$deviceId)->get();
                if (count($sqlSession) == 0){
                    DB::table('user_session')
                        ->insert([
                            "id_user"       => $idUser,
                            "player_ids"    => $playerIds,
                            "token_ids"     => $tokenIds,
                            "device_id"     => $deviceId,
                            "device_name"   => $deviceName,
                            "token_session" => $tokenSession
                        ]);
                }else{
                    $dtSession = $sqlSession[0];
                    $idSession = $dtSession->id;
                    DB::table('user_session')->where('id','=',$idSession)
                        ->update([
                            "player_ids"    => $playerIds,
                            "token_ids"     => $tokenIds,
                            "device_id"     => $deviceId,
                            "device_name"   => $deviceName,
                            "logout"        => 0,
                            "token_session" => $tokenSession
                        ]);
                }

                $response = [
                    "status" => true,
                    "data" => $dtUser,
                    "token" => $tokenSession
                ];
            }else{
                $response = [
                    "status" => false,
                    "message" => "User Not Found"
                ];
            }
        }else{
            $response = [
                "status" => false,
                "message" => "Data terkirim tidak lengkap"
            ];
        }

        return response()->json($response);
    }

    public function ListTenant (Request $request){
        $query = DB::select("SELECT * FROM tenants");
        $response = [
            "status" => true,
            "data" => $query
        ];
        return response()->json($response);
    }

    public function UserLogout (Request $request){
        $token = $request->token;

        if (isset($token)){
            $sqlLogout = DB::update("UPDATE user_session SET logout = '1', player_ids = '', token_ids = '', token_session = '' WHERE token_session = '{$token}'");
            if ($sqlLogout){
                $response = [
                    "status" => true,
                    "message" => "Berhasil logout"
                ];
            }else{
                $response = [
                    "status" => false,
                    "message" => "Gagal logout"
                ];
            }
        }else{
            $response = [
                "status" => false,
                "message" => "Data terkirim tidak lengkap"
            ];
        }
        return response()->json($response);
    }

    public function updatePlayerIDS (Request $request){
        $token = $request->token;
        $playerIds = $request->player_ids;
        $tokenIds = $request->token_ids;

        if (isset($token) && isset($playerIds) && isset($tokenIds)){
            $sql = DB::update("UPDATE user_session SET token_ids = '{$tokenIds}', player_ids = '{$playerIds}' WHERE token_session = '{$token}'");
            if ($sql){
                $response = [
                    "status" => true,
                    "message" => "Update Data Berhasil"
                ];
            }else{
                $response = [
                    "status" => false,
                    "message" => "Update Data Gagal"
                ];
            }
        }else{
            $response = [
                "status" => false,
                "message" => "data terkirim tidak lengkap"
            ];
        }
        return response()->json($response);
    }

    public function ProfileChangeName (Request $request){
        $id = $request->id_user;
        $name = $request->name;
        $type = $request->type_user;

        if (isset($id) && isset($name) && isset($type)){
            if ($type == "KARYAWAN"){
                DB::update("UPDATE users SET name = '{$name}' WHERE id = '{$id}'");
                $response = [
                    "status" => true,
                    "message" => "Data KARYAWAN berhasil diubah"
                ];
            }else if ($type == "TENANT"){
                DB::update("UPDATE tenants SET name = '{$name}' WHERE id = '{$id}'");
                $response = [
                    "status" => true,
                    "message" => "Data TENANT berhasil diubah"
                ];
            }else{
                $response = [
                    "status" => false,
                    "message" => "Tipe user tidak dikenal."
                ];
            }
        }else{
            $response = [
                "status" => false,
                "message" => "data terkirim tidak lengkap"
            ];
        }
        return response()->json($response);
    }

    public function ChangePassword (Request $request){
        $id = $request->id_user;
        $pass = $request->password;
        $type = $request->type_user;

        if (isset($id) && isset($pass) && isset($type)){
            $hashPass = Hash::make($pass);
            $md5Pass = md5($pass);

            if ($type == "KARYAWAN"){
                DB::update("UPDATE users SET password = '{$hashPass}', password_api = '{$md5Pass}' WHERE id = '{$id}'");
                $response = [
                    "status" => true,
                    "message" => "Password KARYAWAN berhasil diubah",
                    "password" => $hashPass,
                    "password_api" => $md5Pass
                ];
            }else if ($type == "TENANT"){
                DB::update("UPDATE tenants SET password = '{$hashPass}', password_api = '{$md5Pass}' WHERE id = '{$id}'");
                $response = [
                    "status" => true,
                    "message" => "Password TENANT berhasil diubah",
                    "password" => $hashPass,
                    "password_api" => $md5Pass
                ];
            }else{
                $response = [
                    "status" => false,
                    "message" => "Tipe user tidak dikenal."
                ];
            }
        }else{
            $response = [
                "status" => false,
                "message" => "data terkirim tidak lengkap"
            ];
        }
        return response()->json($response);
    }

    public function SendingNotifikasi ($level, $message){
        $sql = DB::select("SELECT us.* FROM users us WHERE us.`level` = '{$level}'");
        $arrIDS = array();
        foreach ($sql as $i => $val) {
            $id = $val->id;
            $query = DB::select("SELECT a.player_ids FROM user_session a 
                                    WHERE a.id_user = '{$id}' AND a.type_user = 'KARYAWAN' AND a.logout = '0' AND a.player_ids <> '-' 
                                        AND a.player_ids IS NOT NULL AND a.player_ids <> ''");
            foreach ($query as $j => $data) {
                $playerIDS = $data->player_ids;
                array_push($arrIDS, $playerIDS);
            }
        }

        $content = array("en" => $message);
        $fields = array(
            'app_id' => env('APP_ID'),
            'included_segments' => $arrIDS,
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

        $response = curl_exec($ch);
        curl_close($ch);
        
        return $response;
    }

    public function sendToAll (){
        $content = array("en" => 'Test Notifikasi Berhasil');
        
        $fields = array(
            'app_id' => env('APP_ID'),
            'included_segments' => array('All'),
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

        $response = curl_exec($ch);
        curl_close($ch);
        
        return $response;
    }

}
