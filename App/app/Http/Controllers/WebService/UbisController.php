<?php

namespace App\Http\Controllers\WebService;

use Illuminate\Http\Request;
use DB;

class UbisController extends Controller
{
	public function UbisListReview (Request $request){
		$page = $request->page;
        $count = $request->count;

        if (isset($page) && isset($count)){
            $query = DB::select("SELECT pr.* FROM project pr WHERE  status IN ('UBIS - REVIEWER') ORDER BY created_at DESC LIMIT {$page},{$count}");
            $listProject = array();
            for ($i = 0; $i < count($query); $i++){
                $item = $query[$i];
                $tower = $item->tower;
                $sqlStd = DB::select("SELECT * FROM standartimplementation WHERE tower = '{$tower}'");
                if (count($sqlStd) > 0){
                    $enabled = true;
                }else{
                    $enabled = false;
                }

                $file = $item->filename;
                if (isset($file)){
                    $pathFile = str_replace("api/tenant-list-project", "files/".$item->filename, $request->fullUrl());
                }else{
                    $pathFile = "";
                }
                $id_project = $item->id;
                $sql = DB::select("SELECT * FROM project_implementation WHERE project_id = '{$id_project}'");

                $arItem = [
                    "id" => $id_project,
                    "projectid" => $item->projectid,
                    "sitename" => $item->sitename,
                    "projectdescription" => $item->projectdescription,
                    "regional" => $item->regional,
                    "tenantid" => $item->tenantid,
                    "tower" => $tower,
                    "projectprice" => $item->projectprice,
                    "status_id" => $item->status_id,
                    "filename" => $pathFile,
                    "status" => $item->status,
                    "created_at" => $item->created_at,
                    "updated_at" => $item->updated_at,
                    "enabled" => $enabled,
                    "biaya" => $sql
                ];
                array_push($listProject, $arItem);
            }
            $response = [
                "status" => true,
                "data" => $listProject
            ];
        }else{
            $response = [
                "status" => false,
                "message" => "Data terkirim tidak lengkap"
            ];
        }
        return response()->json($response);
	} 

	 public function ApprovalUbisWaspang (Request $request){
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
                DB::update("UPDATE project SET status = 'UBIS - APPROVAL 1', status_id = '{$statid}' WHERE id = '{$idProject}'");
            }else if (strtoupper($action) == 'REJECT'){
                DB::update("UPDATE project SET status = 'AREA - APPROVAL 2', status_id = '{$statid}' WHERE id = '{$idProject}'");
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

    public function UbisListGM (Request $request){
		$page = $request->page;
        $count = $request->count;

        if (isset($page) && isset($count)){
            $query = DB::select("SELECT pr.* FROM project pr WHERE  status IN ('UBIS - APPROVAL 1') ORDER BY created_at DESC LIMIT {$page},{$count}");
            $listProject = array();
            for ($i = 0; $i < count($query); $i++){
                $item = $query[$i];
                $tower = $item->tower;
                $sqlStd = DB::select("SELECT * FROM standartimplementation WHERE tower = '{$tower}'");
                if (count($sqlStd) > 0){
                    $enabled = true;
                }else{
                    $enabled = false;
                }

                $file = $item->filename;
                if (isset($file)){
                    $pathFile = str_replace("api/tenant-list-project", "files/".$item->filename, $request->fullUrl());
                }else{
                    $pathFile = "";
                }
                $id_project = $item->id;
                $sql = DB::select("SELECT * FROM project_implementation WHERE project_id = '{$id_project}'");

                $arItem = [
                    "id" => $id_project,
                    "projectid" => $item->projectid,
                    "sitename" => $item->sitename,
                    "projectdescription" => $item->projectdescription,
                    "regional" => $item->regional,
                    "tenantid" => $item->tenantid,
                    "tower" => $tower,
                    "projectprice" => $item->projectprice,
                    "status_id" => $item->status_id,
                    "filename" => $pathFile,
                    "status" => $item->status,
                    "created_at" => $item->created_at,
                    "updated_at" => $item->updated_at,
                    "enabled" => $enabled,
                    "biaya" => $sql
                ];
                array_push($listProject, $arItem);
            }
            $response = [
                "status" => true,
                "data" => $listProject
            ];
        }else{
            $response = [
                "status" => false,
                "message" => "Data terkirim tidak lengkap"
            ];
        }
        return response()->json($response);
	} 

	public function ApprovalUbisGM (Request $request){
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
                DB::update("UPDATE project SET status = 'UBIS - APPROVAL 2', status_id = '{$statid}' WHERE id = '{$idProject}'");
            }else if (strtoupper($action) == 'REJECT'){
                DB::update("UPDATE project SET status = 'UBIS - REVIEWER', status_id = '{$statid}' WHERE id = '{$idProject}'");
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

    public function ApprovalUbisEGM (Request $request){
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
                DB::update("UPDATE project SET status = 'BOD - APPROVAL', status_id = '{$statid}' WHERE id = '{$idProject}'");
            }else if (strtoupper($action) == 'REJECT'){
                DB::update("UPDATE project SET status = 'UBIS - APPROVAL 1', status_id = '{$statid}' WHERE id = '{$idProject}'");
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

    public function ApprovalBOD (Request $request){
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
                DB::update("UPDATE project SET status = 'PROCUREMENT - REVIEWER', status_id = '{$statid}' WHERE id = '{$idProject}'");
            }else if (strtoupper($action) == 'REJECT'){
                DB::update("UPDATE project SET status = 'UBIS - APPROVAL 2', status_id = '{$statid}' WHERE id = '{$idProject}'");
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
