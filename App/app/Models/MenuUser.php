<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MenuUser extends Model
{
    protected $table = 'menu_user';
    protected $primaryKey = 'id';
    protected $fillable = array('user_id', 'rights', 'rights_detail');
    public $timestamps = true;


    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }
}
