<?php

namespace App\Http\Controllers\WebService;

use Illuminate\Http\Request;
use DB;

class BiayaController extends Controller
{
    public function ListBiayaStandard (Request $request){
    	$page = $request->page;
    	$count = $request->count;

    	if (isset($page) && isset($count)){
    		$sql = DB::select("SELECT * FROM standartimplementation ORDER BY tower ASC LIMIT {$page},{$count}");
    		$arrBiaya = array();
    		foreach ($sql as $ind => $data) {
    			$id = $data->id;
    			$query = DB::select("SELECT dt.* FROM standartimplementation_detail dt WHERE dt.standartimplementation_id = '{$id}' ");
    			$std = [
    				"id" => $data->id,
    				"tower" => $data->tower,
    				"desc" => $data->description,
                    "regional" => $data->regional,
    				"detail" => $query
    			];
    			array_push($arrBiaya, $std);
    		}
    		$response = [
    			"status" => true,
    			"data" => $arrBiaya  
			];
    	}else{
    		$response = [
    			"status" => false,
    			"message" => "Data terkirim tidak lengkap"
    		];
    	}
    	return response()->json($response);
    }

    public function InsertBiayaStandard (Request $request){
    	$tower = $request->tower;
    	$desc = $request->desc;
        $regional = $request->regional;
    	$detail = $request->detail;
    	if (isset($tower) && isset($desc) && isset($detail) && isset($regional)){
    		$sqlCheck = DB::select("SELECT * FROM standartimplementation WHERE tower = '{$tower}' AND regional = '{$regional}'");
    		if (count($sqlCheck) == 0){
	    		$insert = DB::insert("INSERT INTO standartimplementation (tower, regional, description, created_at) VALUES (?,?,?,CURRENT_TIMESTAMP)", array($tower, $regional, $desc));
	    		if ($insert){
	    			$sqlID = DB::select("SELECT id FROM standartimplementation ORDER BY id DESC LIMIT 1");
	    			$id = $sqlID[0]->id;
	    			$arrDetail = json_decode($detail);
	    			if (count($arrDetail) > 0){
	    				foreach ($arrDetail as $ind => $val) {
	    					$item 		= $val->workitem;
	    					$unit 		= $val->unit;
	    					$volume 	= $val->volume;
	    					$price 		= $val->unitprice;
	    					$description = $val->description2;
	    					DB::insert("INSERT INTO standartimplementation_detail (standartimplementation_id, workitem, unit, volume, unitprice) VALUES (?,?,?,?,?)", array($id, $item, $unit, $volume, $price));
	    				}
	    				$response = [
			    			"status" => true,
			    			"message" => "Berhasil Disimpan"  
						];
	    			}else{
	    				$response = [
			    			"status" => false,
			    			"message" => "Detail tidak boleh kosong"  
						];
	    			}
	    		}else{
	    			$response = [
		    			"status" => false,
		    			"message" => "Gagal Disimpan"  
					];
	    		}
    		}else{
				$response = [
	    			"status" => false,
	    			"message" => "tinggi tower ".$tower." meter sudah tersedia pada regional ".$regional
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

    public function UpdateBiayaStandard (Request $request){
    	$id = $request->id;
    	$tower = $request->tower;
        $regional = $request->regional;
    	$desc = $request->desc;
    	$detail = $request->detail;
    	if (isset($tower) && isset($desc) && isset($detail) && isset($id) && isset($regional)){
    		$sqlCheck = DB::select("SELECT * FROM standartimplementation WHERE tower = '{$tower}' AND regional = '{$regional}' AND id <> '{$id}'");
    		if (count($sqlCheck) == 0){
	    		$update = DB::update("UPDATE standartimplementation SET tower = '{$tower}', regional = '{$regional}', description = '{$desc}', updated_at = CURRENT_TIMESTAMP WHERE id = '{$id}'");
	    		if ($update){
	    			$arrDetail = json_decode($detail);
	    			if (count($arrDetail) > 0){
	    				DB::delete("DELETE FROM standartimplementation_detail WHERE standartimplementation_id = '{$id}'");
	    				foreach ($arrDetail as $ind => $val) {
	    					$item 		= $val->workitem;
	    					$unit 		= $val->unit;
	    					$volume 	= $val->volume;
	    					$price 		= $val->unitprice;
	    					// $description = $val->description2;
	    					DB::insert("INSERT INTO standartimplementation_detail (standartimplementation_id, workitem, unit, volume, unitprice) VALUES (?,?,?,?,?)", array($id, $item, $unit, $volume, $price));
	    				}
	    				$response = [
			    			"status" => true,
			    			"message" => "Berhasil diupdate"  
						];
	    			}else{
	    				$response = [
			    			"status" => false,
			    			"message" => "Detail tidak boleh kosong"  
						];
	    			}
	    		}else{
	    			$response = [
		    			"status" => false,
		    			"message" => "Gagal Disimpan"  
					];
	    		}
    		}else{
				$response = [
	    			"status" => false,
	    			"message" => "tinggi tower ".$tower." meter sudah tersedia pada regional ".$regional
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

    public function DeleteBiayaStandard (Request $request){
    	$id = $request->id;
    	if (isset($id)){
    		$delBiaya = DB::delete("DELETE FROM standartimplementation WHERE id = '{$id}'");
    		$delDetail = DB::delete("DELETE FROM standartimplementation_detail WHERE standartimplementation_id = '{$id}'");
    		if ($delBiaya || $delDetail){
    			$response = [
	    			"status" => true,
	    			"message" => "Berhasil hapus data"  
				];
    		}else{
    			$response = [
	    			"status" => false,
	    			"message" => "Gagal hapus data"  
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
}
