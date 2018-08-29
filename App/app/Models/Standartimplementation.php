<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Standartimplementation extends Model
{

    protected $table = 'standartimplementation';
    protected $primaryKey = 'id';
    protected $fillable = array('regional','cluster','tower','tonase','pondasi','biayatower','erection_tower','transportasi','pondasi_greenfiled','bts_outdoor','me','fy','pln_connect');
    public $timestamps = true;


  
}
