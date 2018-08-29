<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;


class SubMenu extends Model
{

    protected $table = 'menu_sub';
    protected $primaryKey = 'id';
    protected $fillable = array('menu_id','menu_sub_code','sub_menu_name','sub_menu_url');
    public $timestamps = true;

        public function menu()
    {
return $this->belongsTo('App\Models\Menu');
    }
}
