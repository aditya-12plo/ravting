<?php

namespace App\Http\Controllers\WebService;

use Illuminate\Http\Request;
use DB;

class ApprovalController extends Controller
{
	public function __construct (){
        $this->util = new Utilities();
    }

    public function ApprovalProses (Request $request){
       	$idProject 	= $request->id_project;
       	$idUser 	= $request->id_user;
       	$isApprove	= $request->is_approve;
       	$tower 		= $request->tower;
       	$cluster 	= $request->cluster;
       	$mitra 		= $request->mitra;
       	$tonase 	= $request->tonase;
       	$pondasi	= $request->pondasi;
       	$biayatower	= $request->biaya_tower;
       	$erection 	= $request->erection;
       	$transport	= $request->transport;
       	$greenfiled	= $request->greenfiled;
       	$bts 		= $request->bts;
       	$me 		= $request->me;
       	$fy 		= $request->fy;
       	$pln 		= $request->pln;
       	$long		= $request->longitude;
       	$lat 		= $request->latitude;
       	$message 	= $request->message;
       	$additional	= $request->additional;
       	$romawi 	= array('I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII');

       	if ($this->util->paramsValidation(array($idProject,$tower,$cluster,$mitra,$tonase,$pondasi,$biayatower,$erection,$transport,$greenfiled,$bts,$long,$lat,$message,$me,$fy,$pln))){

       		//generate nomor document
       		$countProject = DB::select('SELECT COUNT(*) AS total FROM project WHERE no_doc IS NOT NULL');
       		$forDoc = DB::select('SELECT YEAR(created_at) AS tahun, MONTH(created_at) AS bulan, projectid, status, area, infratype FROM project WHERE id = :id AND projectid IS NOT NULL', array("id"=>$idProject));
       		$noDoc = ($countProject[0]->total+1)."/".$forDoc[0]->projectid."/".$romawi[($forDoc[0]->bulan-1)]."/".$forDoc[0]->tahun;
       		$infratype = strtoupper($forDoc[0]->infratype);

   			$now = date('Y-m-d H:i:s');
   			// 'NEW','AREA - GENERAL MANAGER AREA','UBIS - MANAGER','UBIS - GENERAL MANAGER','UBIS - EXECUTIVE GENERAL MANAGER','PROCUREMENT - STAFF PROCUREMENT','PROCUREMENT - MANAGER PROCUREMENT','DIRECTOR','CANCEL','REPAIR AREA - REVIEWER','REPAIR AREA - MANAGER AREA','REPAIR AREA - GENERAL MANAGER AREA','REPAIR UBIS - MANAGER','REPAIR UBIS - GENERAL MANAGER','REPAIR UBIS - EXECUTIVE GENERAL MANAGER','REPAIR PROCUREMENT - STAFF PROCUREMENT','REPAIR PROCUREMENT - MANAGER PROCUREMENT','FINISH'

   			//insert je project status
   			$statID = DB::table('project_status')
	       				->insertGetId([
	       					"project_id"	=> $idProject,
	       					"user_id"		=> $idUser,
	       					"status"		=> ($isApprove==1)?"APPROVED":"REPAIR",
	       					"message"		=> $message,
	       					"created_at" 	=> $now,
	       					"updated_at"	=> $now
	       				]);

	       	//update status project terkait
	       	$statusProject = $forDoc[0]->status;
	       	if (strtoupper($statusProject)=="NEW" || strtoupper($statusProject)=="REPAIR AREA - MANAGER AREA"){
	       		DB::table('project')->where('id','=',$idProject)
       				->update([
       					"no_doc" 	=> $noDoc,
       					"status_id"	=> $statID,
       					"status"	=> ($isApprove==1)?"AREA - GENERAL MANAGER AREA":"CANCEL",
       					"longitude"	=> $long,
       					"latituted"	=> $lat,
       					"updated_at"=> $now
       				]);
       			$notifTo = ($isApprove==1)?"GENERAL MANAGER AREA":"STAFF PROCUREMENT";
       			$this->util->SendingNotif($idProject,$isApprove,$idUser,$notifTo,$forDoc[0]->area);
	       	}else if (strtoupper($statusProject)=="AREA - GENERAL MANAGER AREA" || strtoupper($statusProject)=="REPAIR AREA - GENERAL MANAGER AREA"){
	       		$getCapex = DB::table('vprojectimplementation')->select('budget','capex','tower','towerimplementation')->where('id','=',$idProject)->get();
       			$dtCapex = $getCapex[0];
       			$budget = $dtCapex->budget;
       			$capex = $dtCapex->capex;
       			$tower = $dtCapex->towerimplementation;
       			if ($tower >= 42){
       				$next = "UBIS - MANAGER";
       				$notifTo = "MANAGER UBIS";
       			}else {
       				if ($budget >= $capex){
       					$next = "UBIS - MANAGER";
       					$notifTo = "MANAGER UBIS";
       				}else{
       					if ($budget <= $capex){
       						$next = "STAFF - PROCUREMENT";
       						$notifTo = "STAFF PROCUREMENT";
       					}else{
       						$next = "UBIS - MANAGER";
       						$notifTo = "MANAGER UBIS";
       					}
       				}
       			}
       			
       			DB::table('project')->where('id','=',$idProject)
       				->update([
       					"no_doc" 	=> $noDoc,
       					"status_id"	=> $statID,
       					"status"	=> ($isApprove)?$next:"REPAIR AREA - MANAGER AREA",
       					"longitude"	=> $long,
       					"latituted"	=> $lat,
       					"updated_at"=> $now
       				]);
       			$notifTo = ($isApprove==1)?$notifTo:"MANAGER AREA";
       			$this->util->SendingNotif($idProject,$isApprove,$idUser,$notifTo,$forDoc[0]->area);
	       	}else if (strtoupper($statusProject)=="UBIS - MANAGER" || strtoupper($statusProject)=="REPAIR UBIS - MANAGER"){
	       		DB::table('project')->where('id','=',$idProject)
       				->update([
       					"no_doc" 	=> $noDoc,
       					"status_id"	=> $statID,
       					"status"	=> ($isApprove==1)?"UBIS - GENERAL MANAGER":"REPAIR AREA - GENERAL MANAGER AREA",
       					"longitude"	=> $long,
       					"latituted"	=> $lat,
       					"updated_at"=> $now
       				]);
				$notifTo = ($isApprove==1)?"GENERAL MANAGER UBIS":"GENERAL MANAGER AREA";
       			$this->util->SendingNotif($idProject,$isApprove,$idUser,$notifTo,$forDoc[0]->area);
	       	}else if (strtoupper($statusProject)=="UBIS - GENERAL MANAGER" || strtoupper($statusProject)=="REPAIR UBIS - GENERAL MANAGER"){
	       		DB::table('project')->where('id','=',$idProject)
       				->update([
       					"no_doc" 	=> $noDoc,
       					"status_id"	=> $statID,
       					"status"	=> ($isApprove==1)?"UBIS - EXECUTIVE GENERAL MANAGER":"REPAIR UBIS - MANAGER",
       					"longitude"	=> $long,
       					"latituted"	=> $lat,
       					"updated_at"=> $now
       				]);
				$notifTo = ($isApprove==1)?"EXECUTIVE GENERAL MANAGER UBIS":"MANAGER UBIS";
       			$this->util->SendingNotif($idProject,$isApprove,$idUser,$notifTo,$forDoc[0]->area);
	       	}else if (strtoupper($statusProject)=="UBIS - EXECUTIVE GENERAL MANAGER" || strtoupper($statusProject)=="REPAIR UBIS - EXECUTIVE GENERAL MANAGER"){
	       		DB::table('project')->where('id','=',$idProject)
       				->update([
       					"no_doc" 	=> $noDoc,
       					"status_id"	=> $statID,
       					"status"	=> ($isApprove==1)?"PROCUREMENT - STAFF PROCUREMENT":"REPAIR UBIS - GENERAL MANAGER",
       					"longitude"	=> $long,
       					"latituted"	=> $lat,
       					"updated_at"=> $now
       				]);
				$notifTo = ($isApprove==1)?"STAFF PROCUREMENT":"GENERAL MANAGER UBIS";
       			$this->util->SendingNotif($idProject,$isApprove,$idUser,$notifTo,$forDoc[0]->area);
	       	}else if (strtoupper($statusProject)=="PROCUREMENT - STAFF PROCUREMENT" || strtoupper($statusProject)=="REPAIR PROCUREMENT - STAFF PROCUREMENT"){
	       		$getCapex = DB::table('vprojectimplementation')->select('budget','capex','tower','towerimplementation')->where('id','=',$idProject)->get();
       			$dtCapex = $getCapex[0];
       			$budget = $dtCapex->budget;
       			$capex = $dtCapex->capex;
       			$tower = $dtCapex->towerimplementation;
       			if ($tower >= 42){
       				$next = "UBIS - EXECUTIVE GENERAL MANAGER";
       				$notifTo = "EXECUTIVE GENERAL MANAGER UBIS";
       			}else {
       				if ($budget >= $capex){
       					$next = "UBIS - MANAGER";
       					$notifTo = "MANAGER UBIS";
       				}else{
       					if ($budget <= $capex){
       						$next = "AREA - GENERAL MANAGER";
       						$notifTo = "GENERAL MANAGER AREA";
       					}else{
       						$next = "UBIS - MANAGER";
       						$notifTo = "MANAGER UBIS";
       					}
       				}
       			}
       			
       			DB::table('project')->where('id','=',$idProject)
       				->update([
       					"no_doc" 	=> $noDoc,
       					"status_id"	=> $statID,
       					"status"	=> ($isApprove)?"PROCUREMENT - MANAGER PROCUREMENT":$next,
       					"longitude"	=> $long,
       					"latituted"	=> $lat,
       					"updated_at"=> $now
       				]);
       			$notifTo = ($isApprove==1)?"PROCUREMENT - MANAGER PROCUREMENT":$notifTo;
       			$this->util->SendingNotif($idProject,$isApprove,$idUser,$notifTo,$forDoc[0]->area);
	       	}else if (strtoupper($statusProject)=="PROCUREMENT - MANAGER PROCUREMENT" || strtoupper($statusProject)=="REPAIR PROCUREMENT - MANAGER PROCUREMENT"){
	       		DB::table('project')->where('id','=',$idProject)
       				->update([
       					"no_doc" 	=> $noDoc,
       					"status_id"	=> $statID,
       					"status"	=> ($isApprove==1)?"DIRECTOR":"REPAIR PROCUREMENT - STAFF PROCUREMENT",
       					"longitude"	=> $long,
       					"latituted"	=> $lat,
       					"updated_at"=> $now
       				]);
				$notifTo = ($isApprove==1)?"DIRECTOR":"MANAGER PROCUREMENT";
       			$this->util->SendingNotif($idProject,$isApprove,$idUser,$notifTo,$forDoc[0]->area);
	       	}else if (strtoupper($statusProject)=="DIRECTOR" || strtoupper($statusProject)=="REPAIR DIRECTOR"){
	       		DB::table('project')->where('id','=',$idProject)
       				->update([
       					"no_doc" 	=> $noDoc,
       					"status_id"	=> $statID,
       					"status"	=> ($isApprove==1)?"FINISH":"REPAIR PROCUREMENT - MANAGER PROCUREMENT",
       					"longitude"	=> $long,
       					"latituted"	=> $lat,
       					"updated_at"=> $now
       				]);
				$notifTo = ($isApprove==1)?"DIRECTOR":"MANAGER PROCUREMENT";
       			$this->util->SendingNotif($idProject,$isApprove,$idUser,$notifTo,$forDoc[0]->area);
	       	}

	       	//insert / update ke project implementation
	       	$projImplement = DB::table('project_implementation')->where('project_id','=',$idProject)->get();
	       	if (count($projImplement) > 0){
	       		$implementID = $projImplement[0]->id;
	       		//update ke project implementation
	       		DB::table('project_implementation')->where('id','=',$implementID)
	       			->update([
	       				"towerimplementation"	=> $tower,
	       				"clusterimplementation"	=> $cluster,
	       				"mitra"					=> strtoupper($mitra),
	       				"updated_at"			=> $now
	       			]);

	       		//update ke project implementation standard
	       		if ($infratype == "B2S"){
		       		DB::table('project_implementation_standard')->where('project_implementation_id','=',$implementID)
		       			->update([
		       				"tonase"		=> $tonase,
		       				"pondasi"		=> $pondasi,
		       				"biayatower"	=> $biayatower,
		       				"erection_tower"=> $erection,
		       				"transportasi"	=> $transport,
		       				"pondasi_greenfiled" => $greenfiled,
		       				"bts_outdoor"	=> $bts,
		       				"me"			=> $me,
		       				"fy"			=> $fy,
		       				"pln_connect"	=> $pln,
		       				"updated_at"	=> $now
		       			]);
	       		}
	       	}else{
	       		$implementID = DB::table('project_implementation')
	       						->insertGetId([
	       							"project_id"			=> $idProject,
	       							"towerimplementation"	=> $tower,
				       				"clusterimplementation"	=> $cluster,
				       				"mitra"					=> strtoupper($mitra),
				       				"created_at"			=> $now,
				       				"updated_at"			=> $now
	       						]);

	       		//insert ke project implementation standard
	       		if ($infratype == "B2S"){
		       		DB::table('project_implementation_standard')
		       			->insert([
		       				"project_implementation_id"=>$implementID,
		       				"tonase"		=> $tonase,
		       				"pondasi"		=> $pondasi,
		       				"biayatower"	=> $biayatower,
		       				"erection_tower"=> $erection,
		       				"transportasi"	=> $transport,
		       				"pondasi_greenfiled" => $greenfiled,
		       				"bts_outdoor"	=> $bts,
		       				"me"			=> $me,
		       				"fy"			=> $fy,
		       				"pln_connect"	=> $pln,
		       				"created_at"	=> $now,
		       				"updated_at"	=> $now
		       			]);
	       		}
	       	}

	       	//insert / update ke project implementation additional
	       	if ($infratype == "B2S"){
		       	DB::table('project_implementation_addtional')->where('project_implementation_id','=',$implementID)->delete();
		       	$arrAdditional = json_decode($additional);
		       	if (count($arrAdditional)>0){
		       		$arrInsert = array();
		       		foreach ($arrAdditional as $item) {
		       			array_push($arrInsert, [
		       					"project_implementation_id"	  => $implementID,
		       					"pekerjaan"					          => strtoupper($item->work),
		       					"satuan"					            => strtoupper($item->satuan),
		       					"qty"						              => $item->volume,
		       					"harga"						            => $item->harga,
		       					"created_at"				          => $now,
		       					"updated_at"				          => $now
		       				]);
		       		}
		       		DB::table('project_implementation_addtional')->insert($arrInsert);
		       	}
	       	}
		    $response = ["status" => true,"message" => "Proses submit berhasil."];
       	}else{
    		$response = ["status" => false,"message" => "Data terkirim tidak lengkap"];
    	}
    	return response()->json($response);
    }

    public function generateMessage($idUser, $projectID, $proses){
    	$sql = DB::select("SELECT * FROM users WHERE id = '{$idUser}'");
    	$level = $sql[0]->level;
    	return "Telah ada proses ".$proses." oleh ".$level." pada Project ID = ".$projectID.". Dan Menunggu APPROVAL dari anda.";
    }

    public function generateMessageFromTenant($idUser, $projectID, $proses){
    	$sql = DB::select("SELECT * FROM tenants WHERE id = '{$idUser}'");
    	$name = $sql[0]->name;
    	return "Telah ada proses ".$proses." oleh ".$name." (TENANT) pada Project ID = ".$projectID.". Dan Menunggu APPROVAL dari anda.";
    }

    public function generateMessageFinish($idUser, $projectID, $proses){
    	$sql = DB::select("SELECT * FROM users WHERE id = '{$idUser}'");
    	$level = $sql[0]->level;
    	return "Telah ada proses ".$proses." oleh ".$level.". Dan Project ID = ".$projectID." telah dinyatakan FINISH.";
    }

    public function generateMessageReject($idUser, $projectID, $proses){
    	$sql = DB::select("SELECT * FROM users WHERE id = '{$idUser}'");
    	$level = $sql[0]->level;
    	return "Telah ada proses ".$proses." oleh ".$level.". Dan Project ID = ".$projectID." telah dinyatakan CANCEL.";
    }

    public function TestCtrl (Request $request){
    	$name = $request->name;
    	$ctrl = new NotificationController;
    	return $ctrl->SendToKaryawan('3', 'KARYAWAN', $name, 'WASPANG', '16');
    }
}
