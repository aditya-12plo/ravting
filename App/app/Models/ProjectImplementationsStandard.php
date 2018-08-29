<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectImplementationsStandard extends Model
{

    protected $table = 'project_implementation_standard';
    protected $primaryKey = 'id';
    protected $fillable = array('project_implementation_id','tonase','pondasi','biayatower','erection_tower','transportasi','pondasi_greenfiled','bts_outdoor','me','fy','pln_connect');
    public $timestamps = true;

            public function standard()
    {
        return $this->belongsTo('App\Models\ProjectImplementations');
    }

  
}
