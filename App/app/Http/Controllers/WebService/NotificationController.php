<?php

namespace App\Http\Controllers\WebService;

use Illuminate\Http\Request;
use DB;

class NotificationController extends Controller
{
    public function GettingListNotification (Request $request) {
    	$idUser = $request->id_user;
    	$page = $request->page;
    	$count = $request->count;

    	if (isset($idUser) && isset($page) && isset($count)){
           $getNotif = DB::table('notification')->select('notification.*','users.name as sender_name', 'users.level', 'project.projectid', 'project.sitename', 'project.area', 'project.regional', 'project.cluster', 'project.mitra')
                        ->join('users','users.id','=','notification.sender_id')
                        ->join('project','project.id','=','notification.project_id')
                        ->where('notification.users_id','=',$idUser)
                        ->limit($count)->skip($page)
                        ->orderBy('notification.created_at','desc')->get();
            $response = ["status"=>true,"data"=>$getNotif];
    	}else{
            $response = ["status" => false,"message" => "Data terkirim tidak lengkap"];
        }
        return response()->json($response);
    }

    public function SendingNotification ($arrReceiver, $senderID, $senderType, $message, $idProject) {
        $sqlInsert = DB::insert("INSERT INTO notification (project_id, sender_id, sender_type, message) VALUES ('{$idProject}', '{$senderID}', '{$senderType}', '{$message}')");
        if ($sqlInsert){
            $arrIDS = array();
            $lastID = DB::select("SELECT id FROM notification ORDER BY created_at DESC LIMIT 1");
            $idNotif = $lastID[0]->id;
            foreach ($arrReceiver as $index => $value) {
                $id = $value->id;
                $type = $value->user_type;
                $sqlIDS = DB::select("call getting_player_ids(?,?)", array($id, $type));
                foreach ($sqlIDS as $key => $ids) {
                    array_push($arrIDS, $ids->player_ids);
                }
                DB::insert("INSERT INTO notification_detail (id_notification, id_user, type_user, created_at) VALUES ('{$idNotif}', '{$id}', '{$type}', CURRENT_TIMESTAMP)");
            }
            $feedBack = $this->PushNotif($arrIDS, $message);
            DB::update("UPDATE notification SET api_feedback = '{$feedBack}' WHERE id = '{$idNotif}'");
            $response = [
                "status" => true,
                "message" => $feedBack
            ];
        }else{
            $response = [
                "status" => false,
                "message" => "gagal"
            ];
        }
        return response()->json($response);
    }

    public function SendToKaryawan ($senderId, $message, $level, $idProject){
        $sql = DB::select("SELECT * FROM users WHERE level = '{$level}'");
        $sqlInsert = DB::insert("INSERT INTO notification (project_id, sender_id, sender_type, message) VALUES ('{$idProject}', '{$senderId}', 'KARYAWAN', '{$message}')");
        if ($sqlInsert){
            $lastID = DB::select("SELECT id FROM notification ORDER BY created_at DESC LIMIT 1");
            $idNotif = $lastID[0]->id;
            foreach ($sql as $ind => $val) {
                $id = $val->id;
                $query = DB::select("SELECT a.* FROM user_session a 
                                        WHERE a.id_user = '{$id}' AND a.type_user = 'KARYAWAN' 
                                            #AND a.logout = '0' AND a.player_ids <> '-' 
                                            #AND a.player_ids IS NOT NULL AND a.player_ids <> ''");
                $arrIDS = array();
                foreach ($query as $j => $data) {
                    $playerIDS = $data->player_ids;
                    $idUser = $data->id_user;
                    $feedBack = "";
                    if (isset($playerIDS) && $playerIDS != "-" && $playerIDS != ""){
                        array_push($arrIDS, $playerIDS);
                    }
                }
                DB::insert("INSERT INTO notification_detail (id_notification, id_user, type_user, created_at) VALUES ('{$idNotif}', '{$id}', 'KARYAWAN', CURRENT_TIMESTAMP)");
                $feedBack = $this->PushNotif($arrIDS, $message);
                DB::update("UPDATE notification SET api_feedback = '{$feedBack}' WHERE id = '{$idNotif}'");
                $response = [
                    "status" => true,
                    "message" => $feedBack
                ];
            }
        }else{
            $response = [
                "status" => false,
                "message" => "gagal"
            ];
        }
        return response()->json($response);
    }

    public function SendToTenant ($senderId, $message, $idTenant, $idProject){
        $sql = DB::select("SELECT * FROM tenants WHERE tenantid = '{$idTenant}'");
        $sqlInsert = DB::insert("INSERT INTO notification (project_id, sender_id, sender_type, message) VALUES ('{$idProject}', '{$senderId}', 'KARYAWAN', '{$message}')");
        if ($sqlInsert){
            $lastID = DB::select("SELECT id FROM notification ORDER BY created_at DESC LIMIT 1");
            $idNotif = $lastID[0]->id;
            $id = $sql[0]->id;
            $query = DB::select("SELECT a.* FROM user_session a 
                                    WHERE a.id_user = '{$id}' AND a.type_user = 'TENANT' 
                                        #AND a.logout = '0' AND a.player_ids <> '-' 
                                        #AND a.player_ids IS NOT NULL AND a.player_ids <> ''");
            $arrIDS = array();
            foreach ($query as $j => $data) {
                $playerIDS = $data->player_ids;
                $feedBack = "";
                if (isset($playerIDS) && $playerIDS != "-" && $playerIDS != ""){
                    array_push($arrIDS, $playerIDS);
                }
            }
            DB::insert("INSERT INTO notification_detail (id_notification, id_user, type_user, created_at) VALUES ('{$idNotif}', '{$id}', 'TENANT', CURRENT_TIMESTAMP)");
            $feedBack = $this->PushNotif($arrIDS, $message);
            DB::update("UPDATE notification SET api_feedback = '{$feedBack}' WHERE id = '{$idNotif}'");
            $response = [
                "status" => true,
                "message" => $feedBack
            ];
        }else{
            $response = [
                "status" => false,
                "message" => "gagal"
            ];
        }
        return response()->json($response);
    }

    public function SendFinishOrReject ($senderId, $senderType, $message, $idProject){
        $arrIDS = array();
        $sqlInsert = DB::insert("INSERT INTO notification (project_id, sender_id, sender_type, message) VALUES ('{$idProject}', '{$senderId}', '{$senderType}', '{$message}')");

        if ($sqlInsert){
            $lastID = DB::select("SELECT id FROM notification ORDER BY created_at DESC LIMIT 1");
            $idNotif = $lastID[0]->id;

            //getting player IDS karyawan
            $sqlKaryawan = DB::select("SELECT id FROM users WHERE id IN (SELECT user_id FROM project_status WHERE project_id = '{$idProject}')");
            foreach ($sqlKaryawan as $ind => $val) {
                $idUser = $val->id;
                $query = DB::select("SELECT a.* FROM user_session a WHERE a.id_user = '{$idUser}' AND a.type_user = 'KARYAWAN'");
                foreach ($query as $idx => $data) {
                    $playerIDS = $data->player_ids;
                    if (isset($playerIDS) && $playerIDS != "-" && $playerIDS != ""){
                        array_push($arrIDS, $playerIDS);
                    }
                }
                DB::insert("INSERT INTO notification_detail (id_notification, id_user, type_user, created_at) VALUES ('{$idNotif}', '{$idUser}', 'KARYAWAN', CURRENT_TIMESTAMP)");
            }

            //getting player IDS tenant
            $sqlTenant  = DB::select("SELECT id FROM tenants WHERE id IN (SELECT tenant_id FROM project_status WHERE project_id = '{$idProject}')");
            $tenantID = $sqlTenant[0]->id;
            $query = DB::select("SELECT a.* FROM user_session a WHERE a.id_user = '{$tenantID}' AND a.type_user = 'TENANT'");
            foreach ($query as $index => $value) {
                $playerIDS = $value->player_ids;
                if (isset($playerIDS) && $playerIDS != "-" && $playerIDS != ""){
                    array_push($arrIDS, $playerIDS);
                }
            }
            DB::insert("INSERT INTO notification_detail (id_notification, id_user, type_user, created_at) VALUES ('{$idNotif}', '{$tenantID}', 'TENANT', CURRENT_TIMESTAMP)");

            $feedBack = $this->PushNotif($arrIDS, $message);
            DB::update("UPDATE notification SET api_feedback = '{$feedBack}' WHERE id = '{$idNotif}'");
            $response = [
                "status" => true,
                "message" => $feedBack,
                "receiver" => json_encode($arrIDS)
            ];
        }else{
            $response = [
                "status" => false,
                "message" => "gagal"
            ];
        }
        return response()->json($response);
    }

    private function PushNotif ($playerIDS, $message){
        $content = array("en" => $message);
        
        $fields = array(
            'app_id' => env('APP_ID'),
            // 'included_segments' => $arrIDS,
            'include_player_ids' => $playerIDS,
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

    public function callName ($name){
        $call = ['name'=>$name];
        return response()->json($call);
    }
}
