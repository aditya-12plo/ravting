<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectStandart extends Model
{

    protected $table = 'project_standart';
    protected $primaryKey = 'id';
    protected $fillable = array('id','regional','cluster','workitem','unitprice');
    public $timestamps = true;



  
}
