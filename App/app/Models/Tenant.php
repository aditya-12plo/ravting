<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Notifications\Notification;
use App\Notifications\ResetPassword as ResetPasswordNotification;

class Tenant extends Authenticatable
{
    use Notifiable;

    protected $fillable = [
        'tenantid','name'
    ];

    /**
	'tenantid','name', 'email', 'password', 'password_api'
     * The attributes that should be hidden for arrays.
     *
     * @var array
     
    protected $hidden = [
        'password', 'password_api', 'remember_token',
    ];
*/

    public function sendPasswordResetNotification($token)
{
    $this->notify(new ResetPasswordNotification($token));
}

  public function detailTenant()
    {
        return $this->hasOne('App\Models\Project', 'tenantid','tenantid');
    }

    
}
