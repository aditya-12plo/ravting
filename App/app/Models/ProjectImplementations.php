<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectImplementations extends Model
{

    protected $table = 'project_implementation';
    protected $primaryKey = 'id';
    protected $fillable = array('project_id','towerimplementation','clusterimplementation','mitra');
    public $timestamps = true;

            public function detailimplementation()
    {
        return $this->belongsTo('App\Models\Project');
    }

  
}
