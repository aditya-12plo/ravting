<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectStatus extends Model
{

    protected $table = 'project_status';
    protected $primaryKey = 'id';
    protected $fillable = array('project_id','user_id','status','message');
    public $timestamps = true;

	        public function user()
    {
return $this->belongsTo('App\Models\User');
    }
  
}
