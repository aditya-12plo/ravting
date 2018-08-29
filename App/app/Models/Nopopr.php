<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Nopopr extends Model
{

    protected $table = 'nomor_pr_po';
    protected $primaryKey = 'id';
    protected $fillable = array('project_id','workjobs','nopr','po');
    public $timestamps = true;

  
}
