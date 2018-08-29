<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Standartimplementationcategory extends Model
{

    protected $table = 'standartimplementationcategory';
    protected $primaryKey = 'id';
    protected $fillable = array('tower','cluster','standartimplementationcategory_id','workimplementation','unit','unitprice','qty');
    public $timestamps = true;


 public function category()
    {
        return $this->belongsTo('App\Models\Standartimplementation');
    }


  
}
