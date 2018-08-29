<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Response,View,Input,Auth,Session,Validator,File,Hash,DB,Excel,Mail;
use Carbon\Carbon;

use App\Models\CronJobs;
use App\Models\User;


class SendNotif extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'email:notif';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Email users if project more than 2 days';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
$cek =  DB::table('vscheduller')->where('jmlhari','>','2')->get();  
if(count($cek) > 0)
{
	foreach ($cek as $a) 
	{
		
		if($a->status == 'REPAIR AREA - MANAGER AREA')
		{
			$this->RepairArea($a->id,$a->area,$a->updated_at,$a->jmlhari,$a->projectid) ;
		}
		if($a->status == 'AREA - GENERAL MANAGER AREA')
		{
			$this->GMArea($a->id,$a->area,$a->updated_at,$a->jmlhari,$a->projectid) ;
		}
		if($a->status == 'REPAIR AREA - GENERAL MANAGER AREA')
		{
			$this->GMAreaRepair($a->id,$a->area,$a->updated_at,$a->jmlhari,$a->projectid) ;
		}
		if($a->status == 'UBIS - MANAGER')
		{
			$this->MUbis($a->id,$a->area,$a->updated_at,$a->jmlhari,$a->projectid) ;
		}
		if($a->status == 'REPAIR UBIS - MANAGER')
		{
			$this->MUbisRepair($a->id,$a->area,$a->updated_at,$a->jmlhari,$a->projectid) ;
		}
		if($a->status == 'UBIS - GENERAL MANAGER')
		{
			$this->GMUbis($a->id,$a->area,$a->updated_at,$a->jmlhari,$a->projectid) ;
		}
		if($a->status == 'REPAIR UBIS - GENERAL MANAGER')
		{
			$this->GMUbisRepair($a->id,$a->area,$a->updated_at,$a->jmlhari,$a->projectid) ;
		}
		if($a->status == 'UBIS - EXECUTIVE GENERAL MANAGER')
		{
			$this->EGMUbis($a->id,$a->area,$a->updated_at,$a->jmlhari,$a->projectid) ;
		}
		if($a->status == 'REPAIR UBIS - EXECUTIVE GENERAL MANAGER')
		{
			$this->EGMUbisRepair($a->id,$a->area,$a->updated_at,$a->jmlhari,$a->projectid) ;
		}
		if($a->status == 'PROCUREMENT - STAFF PROCUREMENT')
		{
			$this->SProcurement($a->id,$a->area,$a->updated_at,$a->jmlhari,$a->projectid) ;
		}
		if($a->status == 'REPAIR PROCUREMENT - STAFF PROCUREMENT')
		{
			$this->SProcurementRepair($a->id,$a->area,$a->updated_at,$a->jmlhari,$a->projectid) ;
		}
		if($a->status == 'DIRECTOR')
		{
			$this->Director($a->id,$a->area,$a->updated_at,$a->jmlhari,$a->projectid) ;
		}
		if($a->status == 'PROCUREMENT - MANAGER PROCUREMENT')
		{
			$this->MProcurement($a->id,$a->area,$a->updated_at,$a->jmlhari,$a->projectid) ;
		}
	}
	 $this->info('Cron Jobs successfully!');
}	
else
{
	 CronJobs::create(['emailsend'=>'','status'=>'Cron Jobs successfully!. No Data']);
	 $this->info('Cron Jobs successfully!');
}

		
    }
	
		 public function GetUser($level,$area)
    {
if($level == 'MANAGER UBIS')
{
$pesan = User::where([['level',$level],['area',$area]])->orWhere([['level',$level],['area2',$cek->area]])->select('id','email','name')->get();
}
else
{	
$pesan = User::where([['level',$level],['area',$area]])->select('id','email','name')->get();
}
$emailNya = array('nugrohoaditya10@gmail.com');
foreach ($pesan as $p) {	
		$emailNya12[] = $p['email'];
}
return response()->json($emailNya);
	}
	
	/* send email */
public function KirimEmail($emailNya,$isipesan,$projectid)
    {

      $content = view('email_notif')->with($isipesan);
Mail::send('email', ['contentMessage' => $content], function($messageNya) use ($emailNya,$projectid) {
         $messageNya->to($emailNya)->subject('PROJECTID '.$projectid.' Melebihi Batas Waktu Approval');
         $messageNya->from('MITRATel-RAVTING@mitratel.com','MITRATel-RAVTING (MITRATEL ELECTRONIC REVIEW AND APPROVAL BUDGETING)');
      });

    }
	
public function KirimEmailRepair($emailNya,$isipesan,$projectid)
    {

      $content = view('email_notif')->with($isipesan);
Mail::send('email', ['contentMessage' => $content], function($messageNya) use ($emailNya,$projectid) {
         $messageNya->to($emailNya)->subject('PROJECTID '.$projectid.' Melebihi Batas Waktu Approval');
         $messageNya->from('MITRATel-RAVTING@mitratel.com','MITRATel-RAVTING (MITRATEL ELECTRONIC REVIEW AND APPROVAL BUDGETING)');
      });

    }
/* send email */
	
	
	 public function RepairArea($id,$area,$time,$jmlhari,$projectid)
    {
		
$pesan = User::where([['level','MANAGER AREA'],['area',$area]])->select('id','email','name')->get();		
foreach ($pesan as $p) {	
		$emailNya[] = $p['email'];
}
$isipesan = array(
        'projectid' => $projectid,
        'header' => 'Project Melebihi batas waktu Perbaikan',
		'kata' => 'Project ini menunggu Perbaikan dari anda mulai '.$time.' sampai '.Carbon::now().' total '.$jmlhari.' Hari'); 
$this->KirimEmailRepair($emailNya,$isipesan,$projectid) ;
CronJobs::create(['emailsend'=>json_encode($emailNya),'status'=>json_encode($isipesan)]); 
	}
	
	
	
	/** GM AREA  **/
	 public function GMArea($id,$area,$time,$jmlhari,$projectid)
    {
$pesan = User::where([['level','GENERAL MANAGER AREA'],['area',$area]])->select('id','email','name')->get();		
foreach ($pesan as $p) {	
		$emailNya[] = $p['email'];
}
$isipesan = array(
        'projectid' => $projectid,
        'header' => 'Project Melebihi batas waktu APPROVAL',
		'kata' => 'Project ini menunggu APPROVAL dari anda mulai '.$time.' sampai '.Carbon::now().' total '.$jmlhari.' Hari'); 
$this->KirimEmail($emailNya,$isipesan,$projectid) ;
 CronJobs::create(['emailsend'=>json_encode($emailNya),'status'=>json_encode($isipesan)]); 
	}
	
	
	 public function GMAreaRepair($id,$area,$time,$projectid)
    {
$pesan = User::where([['level','GENERAL MANAGER AREA'],['area',$area]])->select('id','email','name')->get();		
foreach ($pesan as $p) {	
		$emailNya[] = $p['email'];
}
$isipesan = array(
        'projectid' => $projectid,
        'header' => 'Project Melebihi batas waktu Perbaikan',
		'kata' => 'Project ini menunggu Perbaikan dari anda mulai '.$time.' sampai '.Carbon::now().' total '.$jmlhari.' Hari'); 

$this->KirimEmailRepair($emailNya,$isipesan,$projectid) ;	
 CronJobs::create(['emailsend'=>json_encode($emailNya),'status'=>json_encode($isipesan)]); 
	}
	
	/** GM AREA  **/
	
	
	
	/** MANAGER UBIS  **/
	 public function MUbis($id,$area,$time,$jmlhari,$projectid)
    {
$pesan = User::where([['level','MANAGER UBIS'],['area',$area]])->orWhere([['level','MANAGER UBIS'],['area2',$area]])->select('id','email','name')->get();		
foreach ($pesan as $p) {	
		$emailNya[] = $p['email'];
}
$isipesan = array(
        'projectid' => $projectid,
        'header' => 'Project Melebihi batas waktu APPROVAL',
		'kata' => 'Project ini menunggu APPROVAL dari anda mulai '.$time.' sampai '.Carbon::now().' total '.$jmlhari.' Hari'); 
$this->KirimEmail($emailNya,$isipesan,$projectid) ;
 CronJobs::create(['emailsend'=>json_encode($emailNya),'status'=>json_encode($isipesan)]); 
	}
	
	
	 public function MUbisRepair($id,$area,$time,$projectid)
    {
$pesan = User::where([['level','MANAGER UBIS'],['area',$area]])->orWhere([['level','MANAGER UBIS'],['area2',$area]])->select('id','email','name')->get();		
foreach ($pesan as $p) {	
		$emailNya[] = $p['email'];
}
$isipesan = array(
        'projectid' => $projectid,
        'header' => 'Project Melebihi batas waktu Perbaikan',
		'kata' => 'Project ini menunggu Perbaikan dari anda mulai '.$time.' sampai '.Carbon::now().' total '.$jmlhari.' Hari'); 
$this->KirimEmailRepair($emailNya,$isipesan,$projectid) ;
CronJobs::create(['emailsend'=>json_encode($emailNya),'status'=>json_encode($isipesan)]);  
	}
	
	/** MANAGER UBIS  **/
	
	
	/** GM UBIS  **/
	 public function GMUbis($id,$area,$time,$jmlhari,$projectid)
    {
$pesan = User::where('level','GENERAL MANAGER UBIS')->select('id','email','name')->get();		
foreach ($pesan as $p) {	
		$emailNya[] = $p['email'];
}
$isipesan = array(
        'projectid' => $projectid,
        'header' => 'Project Melebihi batas waktu APPROVAL',
		'kata' => 'Project ini menunggu APPROVAL dari anda mulai '.$time.' sampai '.Carbon::now().' total '.$jmlhari.' Hari'); 
$this->KirimEmail($emailNya,$isipesan,$projectid) ;
 CronJobs::create(['emailsend'=>json_encode($emailNya),'status'=>json_encode($isipesan)]); 
	}
	
	
	 public function GMUbisRepair($id,$area,$time,$projectid)
    {
$pesan = User::where('level','GENERAL MANAGER UBIS')->select('id','email','name')->get();		
foreach ($pesan as $p) {	
		$emailNya[] = $p['email'];
}
$isipesan = array(
        'projectid' => $projectid,
        'header' => 'Project Melebihi batas waktu Perbaikan',
		'kata' => 'Project ini menunggu Perbaikan dari anda mulai '.$time.' sampai '.Carbon::now().' total '.$jmlhari.' Hari'); 
$this->KirimEmailRepair($emailNya,$isipesan,$projectid) ;
CronJobs::create(['emailsend'=>json_encode($emailNya),'status'=>json_encode($isipesan)]);  
	}
	
	/** GM UBIS  **/
	
	
	/** EXECUTIVE GM UBIS  **/
	 public function EGMUbis($id,$area,$time,$jmlhari,$projectid)
    {
$pesan = User::where('level','EXECUTIVE GENERAL MANAGER UBIS')->select('id','email','name')->get();		
foreach ($pesan as $p) {	
		$emailNya[] = $p['email'];
}
$isipesan = array(
        'projectid' => $projectid,
        'header' => 'Project Melebihi batas waktu APPROVAL',
		'kata' => 'Project ini menunggu APPROVAL dari anda mulai '.$time.' sampai '.Carbon::now().' total '.$jmlhari.' Hari'); 
$this->KirimEmail($emailNya,$isipesan,$projectid) ;
 CronJobs::create(['emailsend'=>json_encode($emailNya),'status'=>json_encode($isipesan)]); 
	}
	
	
	 public function EGMUbisRepair($id,$area,$time,$projectid)
    {
$pesan = User::where('level','EXECUTIVE GENERAL MANAGER UBIS')->select('id','email','name')->get();		
foreach ($pesan as $p) {	
		$emailNya[] = $p['email'];
}
$isipesan = array(
        'projectid' => $projectid,
        'header' => 'Project Melebihi batas waktu Perbaikan',
		'kata' => 'Project ini menunggu Perbaikan dari anda mulai '.$time.' sampai '.Carbon::now().' total '.$jmlhari.' Hari'); 
$this->KirimEmailRepair($emailNya,$isipesan,$projectid) ;
 CronJobs::create(['emailsend'=>json_encode($emailNya),'status'=>json_encode($isipesan)]); 
	}
	
	/** EXECUTIVE GM UBIS  **/
	
	/** STAFF PROCUREMENT  **/
	 public function SProcurement($id,$area,$time,$jmlhari,$projectid)
    {
$pesan = User::where([['level','STAFF PROCUREMENT'],['area',$area]])->select('id','email','name')->get();		
foreach ($pesan as $p) {	
		$emailNya[] = $p['email'];
}
$isipesan = array(
        'projectid' => $projectid,
        'header' => 'Project Melebihi batas waktu APPROVAL',
		'kata' => 'Project ini menunggu APPROVAL dari anda mulai '.$time.' sampai '.Carbon::now().' total '.$jmlhari.' Hari'); 
$this->KirimEmail($emailNya,$isipesan,$projectid) ;
 CronJobs::create(['emailsend'=>json_encode($emailNya),'status'=>json_encode($isipesan)]); 
	}
	
	
	 public function SProcurementRepair($id,$area,$time,$jmlhari,$projectid)
    {
$pesan = User::where([['level','STAFF PROCUREMENT'],['area',$area]])->select('id','email','name')->get();		
foreach ($pesan as $p) {	
		$emailNya[] = $p['email'];
}
$isipesan = array(
        'projectid' => $projectid,
        'header' => 'Project Melebihi batas waktu Perbaikan',
		'kata' => 'Project ini menunggu Perbaikan dari anda mulai '.$time.' sampai '.Carbon::now().' total '.$jmlhari.' Hari'); 
$this->KirimEmailRepair($emailNya,$isipesan,$projectid) ;
CronJobs::create(['emailsend'=>json_encode($emailNya),'status'=>json_encode($isipesan)]);  
	}
	
	/** STAFF PROCUREMENT  **/
	
	
	
	/** MANAGER PROCUREMENT  **/
	 public function MProcurement($id,$area,$time,$jmlhari,$projectid)
    {
$pesan = User::where('level','MANAGER PROCUREMENT')->select('id','email','name')->get();		
foreach ($pesan as $p) {	
		$emailNya[] = $p['email'];
}
$isipesan = array(
        'projectid' => $projectid,
        'header' => 'Project Melebihi batas waktu APPROVAL',
		'kata' => 'Project ini menunggu APPROVAL dari anda mulai '.$time.' sampai '.Carbon::now().' total '.$jmlhari.' Hari'); 
$this->KirimEmail($emailNya,$isipesan,$projectid) ;
 CronJobs::create(['emailsend'=>json_encode($emailNya),'status'=>json_encode($isipesan)]); 
  
	}
	
	/** MANAGER PROCUREMENT  **/
	
	
	/** DIRECTOR  **/
	 public function Director($id,$area,$time,$jmlhari,$projectid)
    {
		$pesan = User::where('level','DIRECTOR')->select('id','email','name')->get();		
foreach ($pesan as $p) {	
		$emailNya[] = $p['email'];
}
$isipesan = array(
        'projectid' => $projectid,
        'header' => 'Project Melebihi batas waktu APPROVAL',
		'kata' => 'Project ini menunggu APPROVAL dari anda mulai '.$time.' sampai '.Carbon::now().' total '.$jmlhari.' Hari'); 
$this->KirimEmail($emailNya,$isipesan,$projectid) ;
 CronJobs::create(['emailsend'=>json_encode($emailNya),'status'=>json_encode($isipesan)]); 
	}
	
	/** DIRECTOR  **/
	
	
}
