<?php

namespace App\Http\Controllers\WebService;

use Illuminate\Http\Request;
use App\Models\Project;
use DB;

class ProjectController extends Controller
{

    public function __construct (){
        $this->util = new Utilities();
    }

    public function GettingListProject (Request $request){
       $page    = $request->page;
       $count   = $request->count;
       $idUser  = $request->id_user;
       $view    = $request->is_view;
       $isRepair= $request->is_repair;
       $searchKeyword = $request->search_keyword;
       $searchSdate = $request->search_start_date;
       $searchEdate = $request->search_end_date;

       $infType     = $request->infratype;
       $infYear     = $request->year;

       if ($this->util->paramsValidation(array($page,$count,$idUser,$view))){
            if (strtoupper($view) == "NEW"){
                $query = DB::table('project')
                            ->where('status','=','NEW')
                             ->where(function($search) use ($searchKeyword,$searchSdate,$searchEdate){
                                if (isset($searchKeyword)){
                                    $search->where('projectid','like','%'.$searchKeyword.'%')
                                        ->orWhere('proc','like','%'.$searchKeyword.'%')
                                        ->orWhere('ubis','like','%'.$searchKeyword.'%')
                                        ->orWhere('sitename','like','%'.$searchKeyword.'%')
                                        ->orWhere('siteid','like','%'.$searchKeyword.'%')
                                        ->orWhere('area','like','%'.$searchKeyword.'%')
                                        ->orWhere('regional','like','%'.$searchKeyword.'%')
                                        ->orWhere('cluster','like','%'.$searchKeyword.'%')
                                        ->orWhere('mitra','like','%'.$searchKeyword.'%')
                                        ->orWhere('kode_tower_depan','like','%'.$searchKeyword.'%')
                                        ->orWhere('kode_tower_belakang','like','%'.$searchKeyword.'%')
                                        ->orWhere('infratype','like','%'.$searchKeyword.'%');
                                }

                                if (isset($searchSdate) && isset($searchEdate) && $searchEdate >= $searchSdate){
                                    $search->whereDate('created_at','>=', $searchSdate)
                                            ->whereDate('created_at','<=',$searchEdate);
                                }
                            })
                            ->limit($count)->skip($page)
                            ->orderBy('created_at','desc')->get();
            }else if (strtoupper($view) == "FINAL"){
                $query = DB::table('project')
                            ->where('status','=','FINISH')
                             ->where(function($search) use ($searchKeyword,$searchSdate,$searchEdate){
                                if (isset($searchKeyword)){
                                    $search->where('projectid','like','%'.$searchKeyword.'%')
                                        ->orWhere('proc','like','%'.$searchKeyword.'%')
                                        ->orWhere('ubis','like','%'.$searchKeyword.'%')
                                        ->orWhere('sitename','like','%'.$searchKeyword.'%')
                                        ->orWhere('siteid','like','%'.$searchKeyword.'%')
                                        ->orWhere('area','like','%'.$searchKeyword.'%')
                                        ->orWhere('regional','like','%'.$searchKeyword.'%')
                                        ->orWhere('cluster','like','%'.$searchKeyword.'%')
                                        ->orWhere('mitra','like','%'.$searchKeyword.'%')
                                        ->orWhere('kode_tower_depan','like','%'.$searchKeyword.'%')
                                        ->orWhere('kode_tower_belakang','like','%'.$searchKeyword.'%')
                                        ->orWhere('infratype','like','%'.$searchKeyword.'%');
                                }

                                if (isset($searchSdate) && isset($searchEdate) && $searchEdate >= $searchSdate){
                                    $search->whereDate('created_at','>=', $searchSdate)
                                            ->whereDate('created_at','<=',$searchEdate);
                                }
                            })
                            ->limit($count)->skip($page)
                            ->orderBy('created_at','desc')->get();
            }else if (strtoupper($view) == "AVG"){
                $query = DB::table('project')
                            ->where('status','=','FINISH')
                            ->where('infratype','=',$infType)
                            ->whereYear('created_at',$infYear)
                             ->where(function($search) use ($searchKeyword,$searchSdate,$searchEdate){
                                if (isset($searchKeyword)){
                                    $search->where('projectid','like','%'.$searchKeyword.'%')
                                        ->orWhere('proc','like','%'.$searchKeyword.'%')
                                        ->orWhere('ubis','like','%'.$searchKeyword.'%')
                                        ->orWhere('sitename','like','%'.$searchKeyword.'%')
                                        ->orWhere('siteid','like','%'.$searchKeyword.'%')
                                        ->orWhere('area','like','%'.$searchKeyword.'%')
                                        ->orWhere('regional','like','%'.$searchKeyword.'%')
                                        ->orWhere('cluster','like','%'.$searchKeyword.'%')
                                        ->orWhere('mitra','like','%'.$searchKeyword.'%')
                                        ->orWhere('kode_tower_depan','like','%'.$searchKeyword.'%')
                                        ->orWhere('kode_tower_belakang','like','%'.$searchKeyword.'%')
                                        ->orWhere('infratype','like','%'.$searchKeyword.'%');
                                }

                                if (isset($searchSdate) && isset($searchEdate) && $searchEdate >= $searchSdate){
                                    $search->whereDate('created_at','>=', $searchSdate)
                                            ->whereDate('created_at','<=',$searchEdate);
                                }
                            })
                            ->limit($count)->skip($page)
                            ->orderBy('created_at','desc')->get();
            }else if (strtoupper($view) == "REJECT"){
                $query = DB::table('project')
                            ->where('status','=','CANCEL')
                             ->where(function($search) use ($searchKeyword,$searchSdate,$searchEdate){
                                if (isset($searchKeyword)){
                                    $search->where('projectid','like','%'.$searchKeyword.'%')
                                        ->orWhere('proc','like','%'.$searchKeyword.'%')
                                        ->orWhere('ubis','like','%'.$searchKeyword.'%')
                                        ->orWhere('sitename','like','%'.$searchKeyword.'%')
                                        ->orWhere('siteid','like','%'.$searchKeyword.'%')
                                        ->orWhere('area','like','%'.$searchKeyword.'%')
                                        ->orWhere('regional','like','%'.$searchKeyword.'%')
                                        ->orWhere('cluster','like','%'.$searchKeyword.'%')
                                        ->orWhere('mitra','like','%'.$searchKeyword.'%')
                                        ->orWhere('kode_tower_depan','like','%'.$searchKeyword.'%')
                                        ->orWhere('kode_tower_belakang','like','%'.$searchKeyword.'%')
                                        ->orWhere('infratype','like','%'.$searchKeyword.'%');
                                }

                                if (isset($searchSdate) && isset($searchEdate) && $searchEdate >= $searchSdate){
                                    $search->whereDate('created_at','>=', $searchSdate)
                                            ->whereDate('created_at','<=',$searchEdate);
                                }
                            })
                            ->limit($count)->skip($page)
                            ->orderBy('created_at','desc')->get();
            }else if (strtoupper($view) == "ALL"){
                $query = DB::table('project')
                             ->where(function($search) use ($searchKeyword,$searchSdate,$searchEdate){
                                if (isset($searchKeyword)){
                                    $search->where('projectid','like','%'.$searchKeyword.'%')
                                        ->orWhere('proc','like','%'.$searchKeyword.'%')
                                        ->orWhere('ubis','like','%'.$searchKeyword.'%')
                                        ->orWhere('sitename','like','%'.$searchKeyword.'%')
                                        ->orWhere('siteid','like','%'.$searchKeyword.'%')
                                        ->orWhere('area','like','%'.$searchKeyword.'%')
                                        ->orWhere('regional','like','%'.$searchKeyword.'%')
                                        ->orWhere('cluster','like','%'.$searchKeyword.'%')
                                        ->orWhere('mitra','like','%'.$searchKeyword.'%')
                                        ->orWhere('kode_tower_depan','like','%'.$searchKeyword.'%')
                                        ->orWhere('kode_tower_belakang','like','%'.$searchKeyword.'%')
                                        ->orWhere('status','like','%'.$searchKeyword.'%')
                                        ->orWhere('infratype','like','%'.$searchKeyword.'%');
                                }

                                if (isset($searchSdate) && isset($searchEdate) && $searchEdate >= $searchSdate){
                                    $search->whereDate('created_at','>=', $searchSdate)
                                            ->whereDate('created_at','<=',$searchEdate);
                                }
                            })
                            ->limit($count)->skip($page)
                            ->orderBy('created_at','desc')->get();
            }else if (strtoupper($view) == "VIEW"){
                $getLevel = DB::table('users')->select('level','area','area2')->where('id','=',$idUser)->get();
                if (count($getLevel) > 0){
                    $level = strtoupper($getLevel[0]->level);
                    $area  = strtoupper($getLevel[0]->area);
                    $area2 = strtoupper($getLevel[0]->area2);
                    // 'WASPANG','GENERAL MANAGER AREA','PROJECT MANAGER AREA','MANAGER AREA','MANAGER UBIS','GENERAL MANAGER UBIS','EXECUTIVE GENERAL MANAGER UBIS','STAFF PROCUREMENT','MANAGER PROCUREMENT','DIRECTOR','ADMINISTRATOR'

                    // 'NEW','AREA - GENERAL MANAGER AREA','UBIS - MANAGER','UBIS - GENERAL MANAGER','UBIS - EXECUTIVE GENERAL MANAGER','PROCUREMENT - STAFF PROCUREMENT','PROCUREMENT - MANAGER PROCUREMENT','DIRECTOR','CANCEL','REPAIR AREA - REVIEWER','REPAIR AREA - MANAGER AREA','REPAIR AREA - GENERAL MANAGER AREA','REPAIR UBIS - MANAGER','REPAIR UBIS - GENERAL MANAGER','REPAIR UBIS - EXECUTIVE GENERAL MANAGER','REPAIR PROCUREMENT - STAFF PROCUREMENT','REPAIR PROCUREMENT - MANAGER PROCUREMENT','FINISH'
                    switch ($level) {
                        case 'MANAGER AREA' :
                            $query = DB::table('project')
                                        ->where('area','=',$area)
                                        ->where(function($status) use ($isRepair){
                                            if ($isRepair==0){
                                                $status->where('status','=','NEW');
                                            }else{
                                                $status->where('status','=','REPAIR AREA - MANAGER AREA');
                                            }
                                        })
                                        ->where(function($search) use ($searchKeyword,$searchSdate,$searchEdate){
                                            if (isset($searchKeyword)){
                                                $search->where('projectid','like','%'.$searchKeyword.'%')
                                                    ->orWhere('proc','like','%'.$searchKeyword.'%')
                                                    ->orWhere('ubis','like','%'.$searchKeyword.'%')
                                                    ->orWhere('sitename','like','%'.$searchKeyword.'%')
                                                    ->orWhere('siteid','like','%'.$searchKeyword.'%')
                                                    ->orWhere('area','like','%'.$searchKeyword.'%')
                                                    ->orWhere('regional','like','%'.$searchKeyword.'%')
                                                    ->orWhere('cluster','like','%'.$searchKeyword.'%')
                                                    ->orWhere('mitra','like','%'.$searchKeyword.'%')
                                                    ->orWhere('kode_tower_depan','like','%'.$searchKeyword.'%')
                                                    ->orWhere('kode_tower_belakang','like','%'.$searchKeyword.'%')
                                                    ->orWhere('infratype','like','%'.$searchKeyword.'%');
                                            }

                                            if (isset($searchSdate) && isset($searchEdate) && $searchEdate >= $searchSdate){
                                                $search->whereDate('created_at','>=', $searchSdate)
                                                        ->whereDate('created_at','<=',$searchEdate);
                                            }
                                        })
                                        ->limit($count)->skip($page)
                                        ->orderBy('id','desc')->get();   
                            break;
                        case 'GENERAL MANAGER AREA' :
                            $query = DB::table('project')
                                        ->where('area','=',$area)
                                        ->where(function($status) use ($isRepair){
                                            if ($isRepair==0){
                                                $status->where('status','=','AREA - GENERAL MANAGER AREA');
                                            }else{
                                                $status->where('status','=','REPAIR AREA - GENERAL MANAGER AREA');
                                            }
                                        })
                                        ->limit($count)->skip($page)
                                        ->orderBy('id','desc')->get();   
                            break;
                        case 'MANAGER UBIS' :
                            $query = DB::table('project')
                                        ->where(function($vArea) use ($area,$area2){
                                            $vArea->where('area','=',$area)
                                                    ->orWhere('area','=',$area2);
                                        })
                                        ->where(function($status) use ($isRepair){
                                             if ($isRepair==0){
                                                $status->where('status','=','UBIS - MANAGER');
                                            }else{
                                                $status->where('status','=','REPAIR UBIS - MANAGER');
                                            }
                                        })
                                        ->where(function($search) use ($searchKeyword,$searchSdate,$searchEdate){
                                            if (isset($searchKeyword)){
                                                $search->where('projectid','like','%'.$searchKeyword.'%')
                                                    ->orWhere('proc','like','%'.$searchKeyword.'%')
                                                    ->orWhere('ubis','like','%'.$searchKeyword.'%')
                                                    ->orWhere('sitename','like','%'.$searchKeyword.'%')
                                                    ->orWhere('siteid','like','%'.$searchKeyword.'%')
                                                    ->orWhere('area','like','%'.$searchKeyword.'%')
                                                    ->orWhere('regional','like','%'.$searchKeyword.'%')
                                                    ->orWhere('cluster','like','%'.$searchKeyword.'%')
                                                    ->orWhere('mitra','like','%'.$searchKeyword.'%')
                                                    ->orWhere('kode_tower_depan','like','%'.$searchKeyword.'%')
                                                    ->orWhere('kode_tower_belakang','like','%'.$searchKeyword.'%')
                                                    ->orWhere('infratype','like','%'.$searchKeyword.'%');
                                            }

                                            if (isset($searchSdate) && isset($searchEdate) && $searchEdate >= $searchSdate){
                                                $search->whereDate('created_at','>=', $searchSdate)
                                                        ->whereDate('created_at','<=',$searchEdate);
                                            }
                                        })
                                        ->limit($count)->skip($page)
                                        ->orderBy('id','desc')->get();   
                            break;
                        case 'GENERAL MANAGER UBIS' :
                            $query = DB::table('project')
                                        ->where(function($vArea) use ($area,$area2){
                                            $vArea->where('area','=',$area)
                                                    ->orWhere('area','=',$area2);
                                        })
                                        ->where(function($status) use ($isRepair){
                                            if ($isRepair==0){
                                                $status->where('status','=','UBIS - GENERAL MANAGER');
                                            }else{
                                                $status->where('status','=','REPAIR UBIS - GENERAL MANAGER');
                                            }
                                        })
                                        ->where(function($search) use ($searchKeyword,$searchSdate,$searchEdate){
                                            if (isset($searchKeyword)){
                                                $search->where('projectid','like','%'.$searchKeyword.'%')
                                                    ->orWhere('proc','like','%'.$searchKeyword.'%')
                                                    ->orWhere('ubis','like','%'.$searchKeyword.'%')
                                                    ->orWhere('sitename','like','%'.$searchKeyword.'%')
                                                    ->orWhere('siteid','like','%'.$searchKeyword.'%')
                                                    ->orWhere('area','like','%'.$searchKeyword.'%')
                                                    ->orWhere('regional','like','%'.$searchKeyword.'%')
                                                    ->orWhere('cluster','like','%'.$searchKeyword.'%')
                                                    ->orWhere('mitra','like','%'.$searchKeyword.'%')
                                                    ->orWhere('kode_tower_depan','like','%'.$searchKeyword.'%')
                                                    ->orWhere('kode_tower_belakang','like','%'.$searchKeyword.'%')
                                                    ->orWhere('infratype','like','%'.$searchKeyword.'%');
                                            }

                                            if (isset($searchSdate) && isset($searchEdate) && $searchEdate >= $searchSdate){
                                                $search->whereDate('created_at','>=', $searchSdate)
                                                        ->whereDate('created_at','<=',$searchEdate);
                                            }
                                        })
                                        ->limit($count)->skip($page)
                                        ->orderBy('id','desc')->get();   
                            break;
                         case 'EXECUTIVE GENERAL MANAGER UBIS' :
                            $query = DB::table('project')
                                        ->where(function($vArea) use ($area,$area2){
                                            $vArea->where('area','=',$area)
                                                    ->orWhere('area','=',$area2);
                                        })
                                        ->where(function($status) use ($isRepair){
                                            if ($isRepair==0){
                                                $status->where('status','=','UBIS - EXECUTIVE GENERAL MANAGER');
                                            }else{
                                                $status->where('status','=','REPAIR UBIS - EXECUTIVE GENERAL MANAGER');
                                            }
                                        })
                                        ->where(function($search) use ($searchKeyword,$searchSdate,$searchEdate){
                                            if (isset($searchKeyword)){
                                                $search->where('projectid','like','%'.$searchKeyword.'%')
                                                    ->orWhere('proc','like','%'.$searchKeyword.'%')
                                                    ->orWhere('ubis','like','%'.$searchKeyword.'%')
                                                    ->orWhere('sitename','like','%'.$searchKeyword.'%')
                                                    ->orWhere('siteid','like','%'.$searchKeyword.'%')
                                                    ->orWhere('area','like','%'.$searchKeyword.'%')
                                                    ->orWhere('regional','like','%'.$searchKeyword.'%')
                                                    ->orWhere('cluster','like','%'.$searchKeyword.'%')
                                                    ->orWhere('mitra','like','%'.$searchKeyword.'%')
                                                    ->orWhere('kode_tower_depan','like','%'.$searchKeyword.'%')
                                                    ->orWhere('kode_tower_belakang','like','%'.$searchKeyword.'%')
                                                    ->orWhere('infratype','like','%'.$searchKeyword.'%');
                                            }

                                            if (isset($searchSdate) && isset($searchEdate) && $searchEdate >= $searchSdate){
                                                $search->whereDate('created_at','>=', $searchSdate)
                                                        ->whereDate('created_at','<=',$searchEdate);
                                            }
                                        })
                                        ->limit($count)->skip($page)
                                        ->orderBy('id','desc')->get();   
                            break;
                        case 'STAFF PROCUREMENT' :
                            $query = DB::table('project')
                                        ->where('area','=',$area)
                                        ->where(function($status) use ($isRepair){
                                            if ($isRepair==0){
                                                $status->where('status','=','PROCUREMENT - STAFF PROCUREMENT');
                                            }else{
                                                $status->where('status','=','REPAIR PROCUREMENT - STAFF PROCUREMENT');
                                            }
                                        })
                                        ->where(function($search) use ($searchKeyword,$searchSdate,$searchEdate){
                                            if (isset($searchKeyword)){
                                                $search->where('projectid','like','%'.$searchKeyword.'%')
                                                    ->orWhere('proc','like','%'.$searchKeyword.'%')
                                                    ->orWhere('ubis','like','%'.$searchKeyword.'%')
                                                    ->orWhere('sitename','like','%'.$searchKeyword.'%')
                                                    ->orWhere('siteid','like','%'.$searchKeyword.'%')
                                                    ->orWhere('area','like','%'.$searchKeyword.'%')
                                                    ->orWhere('regional','like','%'.$searchKeyword.'%')
                                                    ->orWhere('cluster','like','%'.$searchKeyword.'%')
                                                    ->orWhere('mitra','like','%'.$searchKeyword.'%')
                                                    ->orWhere('kode_tower_depan','like','%'.$searchKeyword.'%')
                                                    ->orWhere('kode_tower_belakang','like','%'.$searchKeyword.'%')
                                                    ->orWhere('infratype','like','%'.$searchKeyword.'%');
                                            }

                                            if (isset($searchSdate) && isset($searchEdate) && $searchEdate >= $searchSdate){
                                                $search->whereDate('created_at','>=', $searchSdate)
                                                        ->whereDate('created_at','<=',$searchEdate);
                                            }
                                        })
                                        ->limit($count)->skip($page)
                                        ->orderBy('id','desc')->get();   
                            break;
                        case 'MANAGER PROCUREMENT' :
                            $query = DB::table('project')
                                        // ->where('area','=',$area)
                                        ->where(function($status) use ($isRepair){
                                            if ($isRepair==0){
                                                $status->where('status','=','PROCUREMENT - MANAGER PROCUREMENT');
                                            }else{
                                                $status->where('status','=','REPAIR PROCUREMENT - MANAGER PROCUREMENT');
                                            }
                                        })
                                        ->where(function($search) use ($searchKeyword,$searchSdate,$searchEdate){
                                            if (isset($searchKeyword)){
                                                $search->where('projectid','like','%'.$searchKeyword.'%')
                                                    ->orWhere('proc','like','%'.$searchKeyword.'%')
                                                    ->orWhere('ubis','like','%'.$searchKeyword.'%')
                                                    ->orWhere('sitename','like','%'.$searchKeyword.'%')
                                                    ->orWhere('siteid','like','%'.$searchKeyword.'%')
                                                    ->orWhere('area','like','%'.$searchKeyword.'%')
                                                    ->orWhere('regional','like','%'.$searchKeyword.'%')
                                                    ->orWhere('cluster','like','%'.$searchKeyword.'%')
                                                    ->orWhere('mitra','like','%'.$searchKeyword.'%')
                                                    ->orWhere('kode_tower_depan','like','%'.$searchKeyword.'%')
                                                    ->orWhere('kode_tower_belakang','like','%'.$searchKeyword.'%')
                                                    ->orWhere('infratype','like','%'.$searchKeyword.'%');
                                            }

                                            if (isset($searchSdate) && isset($searchEdate) && $searchEdate >= $searchSdate){
                                                $search->whereDate('created_at','>=', $searchSdate)
                                                        ->whereDate('created_at','<=',$searchEdate);
                                            }
                                        })
                                        ->limit($count)->skip($page)
                                        ->orderBy('id','desc')->get();   
                            break;
                        case 'DIRECTOR' :
                            $query = DB::table('project')
                                        // ->where('area','=',$area)
                                        ->where(function($status) use ($isRepair){
                                            if ($isRepair==0){
                                                $status->where('status','=','DIRECTOR');
                                            }else{
                                                $status->where('status','=','REPAIR DIRECTOR');
                                            }
                                        })
                                        ->where(function($search) use ($searchKeyword,$searchSdate,$searchEdate){
                                            if (isset($searchKeyword)){
                                                $search->where('projectid','like','%'.$searchKeyword.'%')
                                                    ->orWhere('proc','like','%'.$searchKeyword.'%')
                                                    ->orWhere('ubis','like','%'.$searchKeyword.'%')
                                                    ->orWhere('sitename','like','%'.$searchKeyword.'%')
                                                    ->orWhere('siteid','like','%'.$searchKeyword.'%')
                                                    ->orWhere('area','like','%'.$searchKeyword.'%')
                                                    ->orWhere('regional','like','%'.$searchKeyword.'%')
                                                    ->orWhere('cluster','like','%'.$searchKeyword.'%')
                                                    ->orWhere('mitra','like','%'.$searchKeyword.'%')
                                                    ->orWhere('kode_tower_depan','like','%'.$searchKeyword.'%')
                                                    ->orWhere('kode_tower_belakang','like','%'.$searchKeyword.'%')
                                                    ->orWhere('infratype','like','%'.$searchKeyword.'%');
                                            }

                                            if (isset($searchSdate) && isset($searchEdate) && $searchEdate >= $searchSdate){
                                                $search->whereDate('created_at','>=', $searchSdate)
                                                        ->whereDate('created_at','<=',$searchEdate);
                                            }
                                        })
                                        ->limit($count)->skip($page)
                                        ->orderBy('id','desc')->get();   
                            break;
                        default:
                            $query = array();
                            break;
                    }
                }else{
                    $query = array();
                }
            }

            $arrProject = array();
            foreach ($query as $item) {
                $getProject = DB::table('project_implementation')->where('project_id','=',$item->id)->get();

                //mendapatkan detail biaya project
                if (count($getProject) > 0){
                    $projImplementation = $getProject[0];
                    $clusterImplement = $projImplementation->clusterimplementation;
                    $mitraImplement = $projImplementation->mitra;

                    $additional = DB::table('project_implementation_addtional')->select('pekerjaan as work', 'satuan', 'qty as volume', 'harga', DB::raw('qty*harga as total'))
                                    ->where('project_implementation_id','=',$projImplementation->id)->get();
                    $getStandard = DB::table('project_implementation_standard')->where('project_implementation_id','=',$projImplementation->id)->get(); 
                    $standard = (count($getStandard)>0)?$getStandard[0]:null;
                    $canSubmit = true;
                }else{
                    $clusterImplement = "";
                    $mitraImplement = "";
                    $additional = array();
                    $standardImpl = DB::table('standartimplementation')->where('regional','=',$item->regional)->where('cluster','=',$item->cluster)->where('tower','=',$item->tower)->get();
                    $standard = (count($standardImpl)>0)?$standardImpl[0]:null;
                    $canSubmit = false;
                }

                //mendapatkan status terakhir
                $getStatus = DB::table('project_status')->select('project_status.*','users.name', 'users.level')
                                ->join('users', 'project_status.user_id','=','users.id')
                                ->where('project_status.id','=',$item->status_id)->get();

                $getCapex = DB::table('vprojectimplementation')->where('id','=',$item->id)->get();

                $itemProject = [
                    "id"                => $item->id,
                    "project_id"        => $item->projectid,
                    "no_doc"            => $item->no_doc,
                    "proc"              => $item->proc,
                    "ubis"              => $item->ubis,
                    "sitename"          => $item->sitename,
                    "siteid"            => $item->siteid,
                    "area"              => $item->area,
                    "regional"          => $item->regional,
                    "cluster"           => $item->cluster,
                    "mitra"             => $item->mitra,
                    "kode_tower_depan"  => $item->kode_tower_depan,
                    "tower"             => $item->tower,
                    "kode_tower_belakang"=> $item->kode_tower_belakang,
                    "longitude"         => $item->longitude,
                    "latituted"         => $item->latituted,
                    "infratype"         => $item->infratype,
                    "towerprovider"     => $item->towerprovider,
                    "provinsi"          => $item->provinsi,
                    "kabupaten"         => $item->kabupaten,
                    "budget"            => $item->budget,
                    "sis"               => $item->sis,
                    "sitac"             => $item->sitac,
                    "imb"               => $item->imb,
                    "lahan"             => $item->lahan,
                    "biayatower"        => $item->biayatower,
                    "addtransport"      => $item->addtransport,
                    "addcme"            => $item->addcme,
                    "addpln"            => $item->addpln,
                    "status"            => $item->status,
                    "filename"          => (isset($item->filename))?str_replace("api/getting-project", "files/".$item->filename, $request->fullUrl()):null,
                    "cluster_implementation" => $clusterImplement,
                    "mitra_implementation" => $mitraImplement,
                    "detail_status"     => (count($getStatus)>0)?$getStatus[0]:null,
                    "standard"          => $standard,
                    "additional"        => $additional,
                    "created_at"        => $item->created_at,
                    "capex"             => (count($getCapex)>0)?$getCapex[0]->capex:0,
                    "can_submit"        => $canSubmit,
                    "imb_jasa"          => $item->imb_jasa,
                    "qty_lahan"         => $item->qty_lahan,
                    "me"                => $item->cme,
                    "pln_connect"       => $item->pln,
                    "tonase"            => (isset($standard))?$standard->tonase:0,
                    "biayatower_b2s"    => (isset($standard))?$standard->biayatower:0,
                    "erection_tower"    => (isset($standard))?$standard->erection_tower:0,
                    "transportasi"      => (isset($standard))?$standard->transportasi:0,
                    "pondasi_greenfiled"=> (isset($standard))?$standard->pondasi_greenfiled:0,
                    "pondasi"           => (isset($standard))?$standard->pondasi:0,
                    "bts_outdoor"       => (isset($standard))?$standard->bts_outdoor:0,
                    "me_b2s"            => (isset($standard))?$standard->me:0,
                    "fy"                => (isset($standard))?$standard->fy:0,
                    "pln_b2s"           => (isset($standard))?$standard->pln_connect:0,

                ];
                array_push($arrProject, $itemProject);
            }
            $response = ["status" => true,"data" => $arrProject];

       }else{
            $response = ["status" => false,"message" => "Data Terkirim tidak lengkap."];
       }
       return response()->json($response);
    }

    public function AddProject (Request $request){
        $projectid  = $request->project_id;
        $proc       = $request->proc;
        $ubis       = $request->ubis;
        $siteid     = $request->site_id;
        $sitename   = $request->site_name;
        $area       = $request->area;
        $regional   = $request->regional;
        $cluster    = $request->cluster;
        $prov       = $request->prov;
        $kab        = $request->kab;
        $infra      = $request->infra;
        $provider   = $request->provider;
        $mitra      = $request->mitra;
        $long       = $request->long;
        $lat        = $request->lat;
        $dpn        = $request->depan;
        $tinggi     = $request->tinggi;
        $blkg       = $request->belakang;
        $budget     = $request->budget;
        $sis        = $request->sis;
        $sitac      = $request->sitac;
        $imb        = $request->imb;
        $sewa       = $request->sewa;
        $biaya      = $request->biaya;    

        if ($this->util->paramsValidation(array($projectid,$proc,$ubis,$siteid,$sitename,$area,$regional,$cluster,$prov,$kab,$infra,$provider,$mitra,$long,$lat,$dpn,$tinggi,$blkg,$budget,$sis,$sitac,$imb,$sewa,$biaya))){
            $sql = DB::table('project')
                    ->insert([
                        "projectid"             => $projectid,
                        "proc"                  => $proc,
                        "ubis"                  => $ubis,
                        "sitename"              => $sitename,
                        "siteid"                => $siteid,
                        "area"                  => $area,
                        "regional"              => $regional,
                        "cluster"               => $cluster,
                        "mitra"                 => $mitra,
                        "kode_tower_depan"      => $dpn,
                        "tower"                 => $tinggi,
                        "kode_tower_belakang"   => $blkg,
                        "longitude"             => $long,
                        "latituted"             => $lat,
                        "infratype"             => $infra,
                        "towerprovider"         => $provider,
                        "provinsi"              => $prov,
                        "kabupaten"             => $kab,
                        "budget"                => $budget,
                        "sis"                   => $sis,
                        "sitac"                 => $sitac,
                        "imb"                   => $imb,
                        "lahan"                 => $sewa,
                        "biayatower"            => $biaya,
                        "status"                => 'NEW',
                        "created_at"            => date('Y-m-d H:i:s')
                    ]);
            if ($sql){
                $response = ["status" => true,"message" => "Project berhasil ditambahkan."];
            }else{
                $response = ["status" => false,"message" => "Project gagal ditambahkan."];
            }
       }else{
            $response = ["status" => false,"message" => "Data Terkirim tidak lengkap."];
       }
       return response()->json($response);

    }

    public function DeleteProject (Request $request){
        $id    = $request->id;

        if ($this->util->paramsValidation(array($id))){
            $sql = DB::table('project')->where('id','=',$id)->delete();
            if ($sql){
                $response = ["status" => true,"message" => "Project berhasil dihapus."];
            }else{
                $response = ["status" => false,"message" => "Project gagal dihapus."];
            }
        }else{
            $response = ["status" => false,"message" => "Data Terkirim tidak lengkap."];
       }
       return response()->json($response);
    }

    public function UpdateProject (Request $request){
        $id         = $request->id;
        $projectid  = $request->project_id;
        $proc       = $request->proc;
        $ubis       = $request->ubis;
        $siteid     = $request->site_id;
        $sitename   = $request->site_name;
        $area       = $request->area;
        $regional   = $request->regional;
        $cluster    = $request->cluster;
        $prov       = $request->prov;
        $kab        = $request->kab;
        $infra      = $request->infra;
        $provider   = $request->provider;
        $mitra      = $request->mitra;
        $long       = $request->long;
        $lat        = $request->lat;
        $dpn        = $request->depan;
        $tinggi     = $request->tinggi;
        $blkg       = $request->belakang;
        $budget     = $request->budget;
        $sis        = $request->sis;
        $sitac      = $request->sitac;
        $imb        = $request->imb;
        $sewa       = $request->sewa;
        $biaya      = $request->biaya;    

        if ($this->util->paramsValidation(array($projectid,$proc,$ubis,$siteid,$sitename,$area,$regional,$cluster,$prov,$kab,$infra,$provider,$mitra,$long,$lat,$dpn,$tinggi,$blkg,$budget,$sis,$sitac,$imb,$sewa,$biaya))){
            $sql = DB::table('project')->where('id','=',$id)
                    ->update([
                        "projectid"             => $projectid,
                        "proc"                  => $proc,
                        "ubis"                  => $ubis,
                        "sitename"              => $sitename,
                        "siteid"                => $siteid,
                        "area"                  => $area,
                        "regional"              => $regional,
                        "cluster"               => $cluster,
                        "mitra"                 => $mitra,
                        "kode_tower_depan"      => $dpn,
                        "tower"                 => $tinggi,
                        "kode_tower_belakang"   => $blkg,
                        "longitude"             => $long,
                        "latituted"             => $lat,
                        "infratype"             => $infra,
                        "towerprovider"         => $provider,
                        "provinsi"              => $prov,
                        "kabupaten"             => $kab,
                        "budget"                => $budget,
                        "sis"                   => $sis,
                        "sitac"                 => $sitac,
                        "imb"                   => $imb,
                        "lahan"                 => $sewa,
                        "biayatower"            => $biaya,
                        "status"                => 'NEW',
                        "created_at"            => date('Y-m-d H:i:s')
                    ]);
            if ($sql){
                $response = ["status" => true,"message" => "Project berhasil diperbarui."];
            }else{
                $response = ["status" => false,"message" => "Project gagal diperbarui."];
            }
       }else{
            $response = ["status" => false,"message" => "Data Terkirim tidak lengkap."];
       }
       return response()->json($response);
    }

    public function GettingTowerClusterByRegional (Request $request){
        $regional   = $request->regional;
        $tcluster    = $request->cluster;
        $ttower      = $request->tower;

        if (isset($regional) && isset($tcluster) && isset($ttower)){
            $cluster = DB::table('standartimplementation')->select('cluster')->where('regional','=',$regional)->groupBy('cluster')->get();
            $arrCluster = array();
            foreach ($cluster as $item) {
                $dt = $item->cluster;
                array_push($arrCluster, $dt);
            }

            $tower = DB::table('standartimplementation')->select('tower')->where('regional','=',$regional)->groupBy('tower')->get();
            $arrTower = array();
            foreach ($tower as $item) {
                $dt = $item->tower;
                array_push($arrTower, $dt);
            }

            $standard = DB::table('standartimplementation')->where('regional','=',$regional)->where('cluster','=',$tcluster)->where('tower','=',$ttower)->get();
            $arrStandard = (count($standard) > 0)?$standard[0]:array();
            $canSubmit = (count($standard) > 0)?true:false;

            $data = ["cluster"=>$arrCluster,"tower"=>$arrTower,"standard"=>$arrStandard,"can_submit"=>$canSubmit];
            $response = ["status" => true,"data" => $data];
        }else{
            $response = ["status" => false,"message" => "Data Terkirim tidak lengkap."];
        }
        return response()->json($response);
    }

    public function UploadFilePDF (Request $request){
        $image = $request->file('pdf');
        $id = $request->id;

        $target_path = str_replace("/app/Http/Controllers/WebService", "/public/files/", dirname(__FILE__));

        $url = $request->fullUrl();

        if (isset($image) && isset($id)) {
            $fileName = time().".pdf"; 
            $target_path = $target_path ."". $fileName;

            try {
                $original = $image->getClientOriginalName();
                $dot = strrpos($original, ".", -4);
                $length = strlen($original);
                $ext = substr($original, $dot+1);

                if ((strtoupper($ext) == "PDF")){
                    if (!move_uploaded_file($image, $target_path)) {
                        $response = [
                            'status'=>false, 
                            'message'=>'Tidak dapat memindahkan file'
                        ];
                    }else{
                        DB::update("UPDATE project SET filename = '{$fileName}', updated_at = CURRENT_TIMESTAMP WHERE id = '{$id}' ");
                        $pathFile = str_replace("api/tenant-upload-file", "files/".$fileName, $request->fullUrl());
                        $response = [
                            'status'=>true, 
                            'message'=>'File berhasil diupload',
                            'filePath'=>$pathFile ];
                    }
                }else{
                    $response = [
                        'status'=>false, 
                        'message'=>'Hanya diperbolehkan file PDF'];
                }
            } catch (Exception $e) {
                $response=[
                    'status'=>false, 
                    'message'=>$e->getMessage()
                ];
            }
        } else {
            $response=[
                'status'=>false, 
                'message'=>'File tidak diterima '.$url];
        }
        return response()->json($response);
    }
        

}
