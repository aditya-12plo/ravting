<?php

namespace App\Http\Controllers\WebService;

use Illuminate\Http\Request;
use DB;

class ProcurementController extends Controller
{
    public function ApprovalProcurementReviewer (Request $request){
    	$idProject = $request->id_project;
        $action = $request->action;
        $idUser = $request->id_user;
        $message = $request->message;

        if (isset($idProject) && isset($action) && isset($idUser) && isset($message)){
            $getTenant = DB::select("SELECT tn.id, pr.tower, std.id AS id_tower FROM project pr 
                JOIN tenants tn ON pr.tenantid = tn.tenantid 
                JOIN standartimplementation std ON pr.tower = std.tower WHERE pr.id = '{$idProject}'");
            $tenantId = $getTenant[0]->id;
            $tower = $getTenant[0]->tower;
            $idStd = $getTenant[0]->id_tower;

            $insertstatus = DB::insert("INSERT INTO project_status (project_id, tenant_id, user_id, status, message, created_at) VALUES (?,?,?,?,?,CURRENT_TIMESTAMP)", array($idProject, $tenantId, $idUser, $action, $message));
            $lastId = DB::select("SELECT id FROM project_status st ORDER BY st.created_at DESC LIMIT 1");
            $statid = $lastId[0]->id;

            if (strtoupper($action) == 'APPROVE'){
                DB::update("UPDATE project SET status = 'PROCUREMENT - APPROVAL', status_id = '{$statid}' WHERE id = '{$idProject}'");

            }else if (strtoupper($action) == 'REJECT'){
                $sqlBiayaProject = DB::select("SELECT SUM(pr.volume * pr.unitprice) as total FROM project_implementation pr WHERE pr.project_id = '{$idProject}'");
                $sqlBiayaStandar = DB::select("SELECT SUM(pr.volume * pr.unitprice) as total FROM standartimplementation_detail pr WHERE pr.standartimplementation_id = '{$idStd}'");

                $biayaProject = $sqlBiayaProject[0]->total;
                $biayaStandar = $sqlBiayaStandar[0]->total;

                if ($tower < 42){
                    if ($biayaProject > $biayaStandar){
                        DB::update("UPDATE project SET status = 'BOD - APPROVAL', status_id = '{$statid}' WHERE id = '{$idProject}'");
                    }else{
                        DB::update("UPDATE project SET status = 'AREA - APPROVAL 2', status_id = '{$statid}' WHERE id = '{$idProject}'");
                    }
                }else{
                    DB::update("UPDATE project SET status = 'BOD - APPROVAL', status_id = '{$statid}' WHERE id = '{$idProject}'");
                }
            }
             $response = [
                "status" => true,
                "message" => "Proses ".$action." telah berhasil."
            ];

        }else{
            $response = [
                "status" => false,
                "message" => "Data terkirim tidak lengkap"
            ];
        }
        return response()->json($response);
    }

    public function ApprovalProcurementAppr (Request $request){
        $idProject = $request->id_project;
        $action = $request->action;
        $idUser = $request->id_user;
        $message = $request->message;

        if (isset($idProject) && isset($action) && isset($idUser) && isset($message)){
            $getTenant = DB::select("SELECT tn.id, pr.tower, std.id AS id_tower FROM project pr 
                JOIN tenants tn ON pr.tenantid = tn.tenantid 
                JOIN standartimplementation std ON pr.tower = std.tower WHERE pr.id = '{$idProject}'");
            $tenantId = $getTenant[0]->id;
            $tower = $getTenant[0]->tower;
            $idStd = $getTenant[0]->id_tower;

            $insertstatus = DB::insert("INSERT INTO project_status (project_id, tenant_id, user_id, status, message, created_at) VALUES (?,?,?,?,?,CURRENT_TIMESTAMP)", array($idProject, $tenantId, $idUser, $action, $message));
            $lastId = DB::select("SELECT id FROM project_status st ORDER BY st.created_at DESC LIMIT 1");
            $statid = $lastId[0]->id;

            if (strtoupper($action) == 'APPROVE'){
                DB::update("UPDATE project SET status = 'FINISH', status_id = '{$statid}' WHERE id = '{$idProject}'");
            }else if (strtoupper($action) == 'REJECT'){
                DB::update("UPDATE project SET status = 'PROCUREMENT - REVIEWER', status_id = '{$statid}' WHERE id = '{$idProject}'");
            }
             $response = [
                "status" => true,
                "message" => "Proses ".$action." telah berhasil."
            ];

        }else{
            $response = [
                "status" => false,
                "message" => "Data terkirim tidak lengkap"
            ];
        }
        return response()->json($response);
    }
}
