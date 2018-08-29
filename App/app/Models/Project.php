<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{

    protected $table = 'project';
    protected $primaryKey = 'id';
    protected $fillable = array('projectid','no_doc','proc','ubis','sitename','siteid','area','regional','cluster','mitra','kode_tower_depan','tower','kode_tower_belakang','longitude','latituted','infratype','towerprovider','provinsi','kabupaten','budget','sis','sitac','imb','imb_jasa','cme','pln','addtransport','addpln','addcme','qty_lahan','lahan','biayatower','status_id','filename','status');
    public $timestamps = true;

                public function projectimplementation()
    {
return $this->hasMany('App\Models\ProjectImplementations');
    }

  
}
