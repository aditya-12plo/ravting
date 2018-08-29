<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;


class Menu extends Model
{

    protected $table = 'menu';
    protected $primaryKey = 'id';
    protected $fillable = array('menu_code','menu_name','menu_url');
    public $timestamps = true;

    public function submenu() {
        return $this->hasMany('App\Models\SubMenu');
    }



}
