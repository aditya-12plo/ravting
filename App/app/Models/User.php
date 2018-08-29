<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Notifications\Notification;
use App\Notifications\KaryawanResetPassword as ResetPasswordNotification;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'password_api','level','area','area2'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',  'password_api', 'remember_token',
    ];


    public function sendPasswordResetNotification($token)
{
    $this->notify(new ResetPasswordNotification($token));
}

            public function userdata()
    {
return $this->hasMany('App\Models\ProjectStatus');
    }
    
}
