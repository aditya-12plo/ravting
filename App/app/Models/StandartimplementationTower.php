<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StandartimplementationTower extends Model
{

    protected $table = 'standartimplementation_tower';
    protected $primaryKey = 'id';
    protected $fillable = array('regional','cluster','tower','satuan','harga','qty');
    public $timestamps = true;

/*
            public function detailcategory()
    {
return $this->hasMany('App\Models\Standartimplementationcategory');
    }
*/
  
}
