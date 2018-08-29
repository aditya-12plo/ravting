<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CronJobs extends Model
{
    protected $table = 'cronjob';
    protected $primaryKey = 'id';
    protected $fillable = array('emailsend','status');
    public $timestamps = true;
}
