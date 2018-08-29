<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pesan extends Model
{

    protected $table = 'notification';
    protected $primaryKey = 'id';
    protected $fillable = array('project_id','user_id','message','status','message');
    public $timestamps = true;

  
}
