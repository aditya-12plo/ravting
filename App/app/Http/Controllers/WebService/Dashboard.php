<?php

namespace App\Http\Controllers\WebService;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;

class Dashboard extends Controller
{

    public function __construct(){
        $this->util = new Utilities();
    }

    public function index (Request $request){
        $area   = $request->area;
        $idUser = $request->id_user;

        if ($this->util->paramsValidation(array($area,$idUser))){
            $year = date('Y');

            $dataUser = DB::table('users')->where('id','=',$idUser)->first();

            if (isset($dataUser)){
                $level = $dataUser->level;

                if ($level == "MANAGER AREA" || $level == "GENERAL MANAGER AREA"){
                    $capexB2S = DB::table('vavgprojectareab2s')->where('tahun','=',$year)->where('area','=',$area)->first();
                    $capexUntapped = DB::table('vavgprojecareatutp')->where('tahun','=',$year)->where('area','=',$area)->first();
                }else {
                    $capexB2S = DB::table('vavgprojectnsb2s')->where('tahun','=',$year)->first();
                    $capexUntapped = DB::table('vavgprojecnstutp')->where('tahun','=',$year)->first();
                }

                $tableB2S = DB::table('vtotalprojectnyatahunan')->where('tahun','=',$year)->where('infratype','=','B2S')->first();
                $tableUntapped = DB::table('vtotalprojectnyatahunan')->where('tahun','=',$year)->where('infratype','=','UNTAPPED')->first();
                $data = [
                            "tahun"         => $year,
                            "table_b2s"     => $tableB2S,
                            "table_untapped"=> $tableUntapped,
                            "capex_b2s"     => $capexB2S,
                            "capex_untapped"=> $capexUntapped
                        ];
                $response = ["status"=>true,"data"=>$data];
            }else{
                $response = ["status"=>false,"mesage"=>"Data user tidak ditemukan."];
            }
        }else{
            $response = ["status"=>false,"mesage"=>"Data terkirim tidak lengkap."];
        }
        return response()->json($response);
    }

    public function SimulasiCapex (Request $request){
        $infraType = $request->infratype;
        $regional = $request->regional;
        $area = $request->area;

        if ($this->util->paramsValidation(array($infraType,$regional,$area))){
            $getRegional = DB::table('vplafon_capex_regional')->where('infratype','=',$infraType)->where('regional','=',$regional)->get();
            $getArea = DB::table('vplafon_capex_area')->where('area','=',$area)->where('infratype','=',$infraType)->get();
            $getNasional = DB::table('vplafon_capex_nasional')->where('infratype','=',$infraType)->get();
            $regional = (count($getRegional)>0)?$getRegional[0]:null;
            $area = (count($getArea)>0)?$getArea[0]:null;
            $nasional = (count($getNasional)>0)?$getNasional[0]:null;
            $data = ["area"=>$area,"regional"=>$regional,"nasional"=>$nasional];
            $response = ["status"=>true,"data"=>$data];
        }else{
            $response = ["status"=>false,"mesage"=>"Data terkirim tidak lengkap."];
        }
        return response()->json($response);
    }

    public function SelectTahunInfra (Request $request){
        $getTahun = DB::table('vtahun')->select('tahun')->distinct()->orderBy('tahun','desc')->get();
        $arrYear = array();
        foreach ($getTahun as $thn) {
            array_push($arrYear, $thn->tahun);
        }
        return response()->json(["status"=>true,"data"=>$arrYear]);
    }

    public function GettingAverage (Request $request){
        $year       = $request->year;
        $infratype  = $request->infratype;

        if ($this->util->paramsValidation(array($year,$infratype))){
            $getData = DB::table('vtotalprojectnyatahunan')->where('tahun','=',$year)->where('infratype','=',$infratype)->get();
            $getNasional = null;
            $getArea = array();
            $getRegional = array();
            if ($infratype=="UNTAPPED"){
                $getNasional = DB::table('vavgprojecnstutp')->where('tahun','=',$year)->where('infratype','=',$infratype)->get();
                $getArea = DB::table('vavgprojecareatutp')->where('tahun','=',$year)->where('infratype','=',$infratype)->get();
                $getRegional = DB::table('vavgprojecregionaltutp')->where('tahun','=',$year)->where('infratype','=',$infratype)->get();
            } 

            if ($infratype=="B2S"){
                $getNasional = DB::table('vavgprojectnsB2s')->where('tahun','=',$year)->where('infratype','=',$infratype)->get();
                $getArea = DB::table('vavgprojectareab2s')->where('tahun','=',$year)->where('infratype','=',$infratype)->get();
                $getRegional = DB::table('vavgprojectregionalb2s')->where('tahun','=',$year)->where('infratype','=',$infratype)->get();
            }
            $data = [
                "average"   => (count($getData)>0)?$getData[0]:null,
                "nasional"  => (count($getNasional)>0&&$getNasional!=null)?$getNasional[0]:null,
                "area"      => $getArea,
                "regional"  => $getRegional
            ];
            $response = ["status"=>true,"data"=>$data];
        }else{
            $response = ["status"=>false,"mesage"=>"Data terkirim tidak lengkap."];
        }
        return response()->json($response);
    }
}
