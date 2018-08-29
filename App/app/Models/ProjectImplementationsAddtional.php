<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectImplementationsAddtional extends Model
{

    protected $table = 'project_implementation_addtional';
    protected $primaryKey = 'id';
    protected $fillable = array('project_implementation_id','pekerjaan','satuan','qty','harga');
    public $timestamps = true;

            public function addtional()
    {
        return $this->belongsTo('App\Models\ProjectImplementations');
    }

  
}
