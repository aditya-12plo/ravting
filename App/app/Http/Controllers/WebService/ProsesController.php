<?php

namespace App\Http\Controllers\WebService;

use Illuminate\Http\Request;
use DB;

class ProsesController extends Controller
{
    public function ListProsesTenant (Request $request) {
    	$tenantId = $request->tenant_id;
    	$page = $request->page;
    	$count = $request->count;

    	if (isset($tenantId) && isset($page) && isset($count)){
    		$query = DB::select("SELECT pr.* FROM project pr WHERE tenantid = '{$tenantId}' AND status IN ('AREA - REVIEWER', 'AREA - APPROVAL 1', 'AREA - APPROVAL 2', 'UBIS - REVIEWER', 'UBIS - APPROVAL 1', 'UBIS - APPROVAL 2', 'PROCUREMENT - REVIEWER', 'PROCUREMENT - APPROVAL', 'BOD - APPROVAL') ORDER BY created_at DESC LIMIT {$page},{$count}");
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

    public function ListAreaReviewer (Request $request){
    	$page = $request->page;
    	$count = $request->count;

    	if (isset($page) && isset($count)){
    		$query = DB::select("SELECT pr.* FROM project pr WHERE  status IN ('AREA - REVIEWER') ORDER BY created_at DESC LIMIT {$page},{$count}");
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

    public function ApprovalAreaWaspang (Request $request){
        $idProject = $request->id_project;
        $action = $request->action;
        $idUser = $request->id_user;
        $message = $request->message;

        if (isset($idProject) && isset($action) && isset($idUser) && isset($message)){
            $getTenant = DB::select("SELECT tn.id FROM project pr JOIN tenants tn ON pr.tenantid = tn.tenantid WHERE pr.id = '{$idProject}'");
            $tenantId = $getTenant[0]->id;

            $insertstatus = DB::insert("INSERT INTO project_status (project_id, tenant_id, user_id, status, message, created_at) VALUES (?,?,?,?,?,CURRENT_TIMESTAMP)", array($idProject, $tenantId, $idUser, $action, $message));
            $lastId = DB::select("SELECT id FROM project_status st ORDER BY st.created_at DESC LIMIT 1");
            $statid = $lastId[0]->id;

            if (strtoupper($action) == 'APPROVE'){
                DB::update("UPDATE project SET status = 'AREA - APPROVAL 1', status_id = '{$statid}' WHERE id = '{$idProject}'");
            }else if (strtoupper($action) == 'REJECT'){
                DB::update("UPDATE project SET status = 'CANCEL', status_id = '{$statid}' WHERE id = '{$idProject}'");
            }else if (strtoupper($action) == 'REPAIR'){
                DB::update("UPDATE project SET status = 'REPAIR AREA - REVIEWER', status_id = '{$statid}' WHERE id = '{$idProject}'");
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

    public function ListProjectManagerArea (Request $request){
        $page = $request->page;
        $count = $request->count;

        if (isset($page) && isset($count)){
            $query = DB::select("SELECT pr.* FROM project pr WHERE  status IN ('AREA - APPROVAL 1') ORDER BY created_at DESC LIMIT {$page},{$count}");
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

    public function ApprovalAreaPM (Request $request){
        $idProject = $request->id_project;
        $action = $request->action;
        $idUser = $request->id_user;
        $message = $request->message;

        if (isset($idProject) && isset($action) && isset($idUser) && isset($message)){
            $getTenant = DB::select("SELECT tn.id FROM project pr JOIN tenants tn ON pr.tenantid = tn.tenantid WHERE pr.id = '{$idProject}'");
            $tenantId = $getTenant[0]->id;

            $insertstatus = DB::insert("INSERT INTO project_status (project_id, tenant_id, user_id, status, message, created_at) VALUES (?,?,?,?,?,CURRENT_TIMESTAMP)", array($idProject, $tenantId, $idUser, $action, $message));
            $lastId = DB::select("SELECT id FROM project_status st ORDER BY st.created_at DESC LIMIT 1");
            $statid = $lastId[0]->id;

            if (strtoupper($action) == 'APPROVE'){
                DB::update("UPDATE project SET status = 'AREA - APPROVAL 2', status_id = '{$statid}' WHERE id = '{$idProject}'");
            }else if (strtoupper($action) == 'REJECT'){
                DB::update("UPDATE project SET status = 'AREA - REVIEWER', status_id = '{$statid}' WHERE id = '{$idProject}'");
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

    public function ListManagerArea (Request $request){
        $page = $request->page;
        $count = $request->count;

        if (isset($page) && isset($count)){
            $query = DB::select("SELECT pr.* FROM project pr WHERE  status IN ('AREA - APPROVAL 2') ORDER BY created_at DESC LIMIT {$page},{$count}");
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
    

    public function ApprovalAreaManager (Request $request){
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
                $sqlBiayaProject = DB::select("SELECT SUM(pr.volume * pr.unitprice) as total FROM project_implementation pr WHERE pr.project_id = '{$idProject}'");
                $sqlBiayaStandar = DB::select("SELECT SUM(pr.volume * pr.unitprice) as total FROM standartimplementation_detail pr WHERE pr.standartimplementation_id = '{$idStd}'");

                $biayaProject = $sqlBiayaProject[0]->total;
                $biayaStandar = $sqlBiayaStandar[0]->total;

                if ($tower < 42){
                    if ($biayaProject > $biayaStandar){
                        DB::update("UPDATE project SET status = 'UBIS - REVIEWER', status_id = '{$statid}' WHERE id = '{$idProject}'");
                    }else{
                        DB::update("UPDATE project SET status = 'PROCUREMENT - REVIEWER', status_id = '{$statid}' WHERE id = '{$idProject}'");
                    }
                }else{
                    DB::update("UPDATE project SET status = 'UBIS - REVIEWER', status_id = '{$statid}' WHERE id = '{$idProject}'");
                }

            }else if (strtoupper($action) == 'REJECT'){
                DB::update("UPDATE project SET status = 'AREA - APPROVAL 1', status_id = '{$statid}' WHERE id = '{$idProject}'");
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
