<?php

namespace App\Http\Controllers\WebService;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;

class Utilities extends Controller
{
    public function paramsValidation ($arrParams){
    	$valid = 0;
    	$length = count($arrParams);
    	foreach ($arrParams as $item) {
    		if (isset($item)){
    			$valid += 1;
    		}
    	}
    	return ($valid==$length)?true:false;
    }

    public function SendingNotif ($projectID, $isApprove, $idUser, $sendTo, $area){
        $getProject = DB::table('project')->where('id','=',$projectID)->get()[0];
        $getSender    = DB::table('users')->where('id','=',$idUser)->get()[0];

        $getReceiver = DB::table('users')->select('id')
                        ->where('level','=',$sendTo)
                        // ->where('area','=',$area)
                        // ->orWhere('area2','=',$area)
                        ->where(function($query) use ($area){
                            if (isset($area)){
                                $query->where('area','=',$area)
                                    ->orWhere('area2','=',$area);
                            }
                        })
                        ->get();

        $msg = "Project ID ".$getProject->projectid." Menunggu Approval.";
        $detail = "Telah Ada Proses ".(($isApprove)?"APPROVE":"REPAIR")." dari ".$getSender->name." (".$getSender->level.").";

        $arrIDS = array();
        foreach ($getReceiver as $item) {
            DB::table('notification')
                ->insert([
                    "project_id"    => $projectID,
                    "sender_id"     => $getSender->id,
                    "users_id"      => $item->id,
                    "message"       => $msg,
                    "detail"        => $detail,
                    "status"        => 0,
                    "created_at"    => date('Y-m-d H:i:s'),
                    "updated_at"    => date('Y-m-d H:i:s')
                ]);
            $getIDS = DB::table('user_session')->select('player_ids')
                        ->where('id_user','=',$item->id)
                        ->whereNotNull('player_ids')->get();

            $arrIDS = array();
            foreach ($getIDS as $item) {
                $ids = $item->player_ids;
                if (strlen($ids) > 10){
                    array_push($arrIDS, $ids);
                }
            }

            if (count($arrIDS) > 0){
                $content = array("en" => $message);
                $fields = array(
                    'app_id' => env('APP_ID'),
                    // 'included_segments' => $arrIDS,
                    'include_player_ids' => $arrIDS,
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

                curl_exec($ch);
                curl_close($ch);
            }
        }

    }
}
