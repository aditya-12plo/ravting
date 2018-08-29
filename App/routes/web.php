<?php


Route::get('/', function () {
    return view('welcome');
});

Route::get('page-not-found',['as' => 'pagenotfound','uses' => 'IndexController@pagenotfound']);
Route::get('testurl', 'IndexController@testurl');

// for change languge
Route::get('langauage/{locale}', function ($locale) {
  if (in_array($locale, \Config::get('app.locales'))) {
    Session::put('locale', $locale);
  }
  return redirect()->back();
});





//for employee
Route::group(['prefix' => 'karyawan'], function () {
Route::get('/login', 'Karyawan\Auth\LoginController@showLoginForm')->name('karyawan.login');
Route::post('login', 'Karyawan\Auth\LoginController@login')->name('karyawan.login');
Route::post('logout', 'Karyawan\Auth\LoginController@logout')->name('karyawan.logout');
Route::get('password/reset', 'Karyawan\Auth\ForgotPasswordController@showLinkRequestForm')->name('karyawan.password.request');
Route::post('password/email', 'Karyawan\Auth\ForgotPasswordController@sendResetLinkEmail')->name('karyawan.password.email');
Route::get('password/reset/{token}', 'Karyawan\Auth\ResetPasswordController@showResetForm')->name('karyawan.reset');
Route::post('password/reset', 'Karyawan\Auth\ResetPasswordController@reset')->name('karyawan.password.request');

 Route::get('/', 'KaryawanController@index');
 
 
 Route::get('AreaProfile', 'KaryawanController@AreaProfile');
 Route::get('GetHome', 'KaryawanController@GetHome');

 /* procurement */
 Route::get('GetProfileProcurementReviewer', 'KaryawanController@GetProfileProcurementReviewer');
 Route::get('GetProfileProcurementReviewerOfficer', 'KaryawanController@GetProfileProcurementReviewerOfficer');
 Route::get('GetBiayaStandartTower', 'KaryawanController@GetBiayaStandartTower');
 Route::get('GetBiayaStandart', 'KaryawanController@GetBiayaStandart');
 Route::post('uploadbiaya', 'KaryawanController@uploadbiaya');
 Route::post('uploadfile', 'KaryawanController@uploadProject');
 Route::post('uploadbiayatower', 'KaryawanController@uploadbiayatower');
 Route::post('BiayaStandartTowerManual', 'KaryawanController@BiayaStandartTowerManual');
 //Route::get('GetDetailStandartImplementation/{regional}/{cluster}/{tower}', 'KaryawanController@GetDetailStandartImplementation');
 Route::match(['put', 'patch'],'UpdateBiayaStandard/{id}','KaryawanController@UpdateBiayaStandard');
 Route::match(['put', 'patch'], '/UpdateBiayaStandardTower/{id}','KaryawanController@UpdateBiayaStandardTower');
 Route::delete('DeleteBiayaStandart/{regional}/{cluster}/{tower}', 'KaryawanController@DeleteBiayaStandart');
 Route::delete('DeleteBiayaStandartTower/{id}', 'KaryawanController@DeleteBiayaStandartTower');
 Route::get('GetNewProject', 'KaryawanController@GetNewProject');
 Route::get('GetAllProject', 'KaryawanController@GetAllProject');
 Route::post('AddNewProject', 'KaryawanController@AddNewProject');
  Route::match(['put', 'patch'], '/UpdateNewProject/{id}','KaryawanController@UpdateNewProject');
 Route::delete('KDeleteNewProject/{id}', 'KaryawanController@DeleteProject');
 Route::get('GetProfileProcurementReviewerM', 'KaryawanController@GetProfileProcurementReviewerM');
	 
 /* procurement */
 
 
  Route::get('simulasi/{area}/{regional}/{cluster}/{infratype}', 'KaryawanController@simulasi');
	
 
 
	/*user*/
	Route::get('listuser', 'KaryawanController@listuser');
	Route::post('Addkaryawan', 'KaryawanController@Addkaryawan');
	Route::match(['put', 'patch'], '/Updatekaryawan/{id}','KaryawanController@Updatekaryawan');
	Route::delete('Deletekaryawan/{id}', 'KaryawanController@Deletekaryawan');
	/*user*/
	
	
	
	/*log*/
	Route::resource('kevlerLog', 'LogController');
	 Route::delete('kevlerLogDeleteAll/{id}', 'LogController@deleteAll');
	/*log*/
	
	
	/* check profile user office */
 Route::get('GetProfileOffice', 'KaryawanController@GetProfileOffice');
 /* check profile user office */
 
 
 
 
	/*manager area*/
	 Route::get('GetNewProjectMA', 'KaryawanController@GetNewProjectMA');
	 Route::get('GetProfileAreaM', 'KaryawanController@GetProfileAreaM');
	 Route::get('GetProjectRejectMA', 'KaryawanController@GetProjectRejectMA');
	 Route::get('GetRepairProjectAreaM', 'KaryawanController@GetRepairProjectAreaM');
	  Route::get('GetProjectProgressMA', 'KaryawanController@GetProjectProgressMA');
	  Route::get('GetProjectFinalMA', 'KaryawanController@GetProjectFinalMA');
	  
	
	 Route::get('GetDetailStandartImplementationMA/{regional}/{cluster}/{tower}', 'KaryawanController@GetDetailStandartImplementationMA');
	 Route::get('GetDetailStandartImplementationArea/{regional}/{cluster}/{tower}/{area}/{infratype}', 'KaryawanController@GetDetailStandartImplementationArea');
	 
	/*manager area*/
	
	
	
	/*general manager area*/
	Route::get('GetProfileAreaPM', 'KaryawanController@GetProfileAreaPM');
	Route::get('GetProfileAreaMAG', 'KaryawanController@GetProfileAreaMAG');
	Route::get('GetProjectAreaPM', 'KaryawanController@GetProjectAreaPM');
	Route::get('GetProjectRepairAreaPM', 'KaryawanController@GetProjectRepairAreaPM');
	/*general manager area*/
	
	
	/* ubis */
	Route::get('GetProfileUbisReviewerM', 'KaryawanController@GetProfileUbisReviewerM');
	 Route::get('GetProfileUbisReviewerGMU', 'KaryawanController@GetProfileUbisReviewerGMU');
	  Route::get('GetProfileUbisReviewerEGMU', 'KaryawanController@GetProfileUbisReviewerEGMU');
	/* ubis */
	
	
	/*upload dokumen*/
	Route::post('uploaddokumen','KaryawanController@uploaddokumen');
	Route::post('deletefile','KaryawanController@deletefile');
	/*upload dokumen*/
	
	
	/*pesan*/
	Route::get('GetMessageNya/{id}', 'KaryawanController@GetMessageNya');
	/*pesan*/
	
	
	/*submit data*/
	Route::post('ApprovalProjectMU', 'KaryawanController@ApprovalProjectMU');
	Route::post('SubmitProjectRepair', 'KaryawanController@SubmitProjectRepair');
	Route::post('ApprovalProjectPM', 'KaryawanController@ApprovalProjectPM');
	/*submit data*/
	
 
 
	
	/*detail project*/
	Route::get('GetProjectDetailNya/{id}/{kode}/{regional}/{area}', 'KaryawanController@GetProjectDetailNya');
	Route::get('GetProjectDetailProses/{id}/{kode}/{regional}/{area}', 'KaryawanController@GetProjectDetailProses');
	Route::get('GetProjectDetailProsesGrafikB2s/{id}/{kode}/{regional}/{area}', 'KaryawanController@GetProjectDetailProsesGrafikB2s');
	Route::get('GetProjectDetailProsesGrafikuNtp/{id}/{kode}/{regional}/{area}', 'KaryawanController@GetProjectDetailProsesGrafikuNtp');
	Route::get('GetProjectDetailRegionalB2sGrafik/{regional}', 'KaryawanController@GetProjectDetailRegionalB2sGrafik');
	Route::get('GetProjectDetailRegionaluNtpGrafik/{regional}', 'KaryawanController@GetProjectDetailRegionaluNtpGrafik');
	Route::get('GetProjectDetailAreaB2sGrafik/{area}', 'KaryawanController@GetProjectDetailAreaB2sGrafik');
	Route::get('GetProjectDetailAreaUntpGrafik/{area}', 'KaryawanController@GetProjectDetailAreaUntpGrafik');
	Route::get('GetProjectDetailProsesOffice/{id}/{kode}/{regional}', 'KaryawanController@GetProjectDetailProsesOffice');
	/*detail project*/
	
	
	Route::get('GetProfileAdminstrator', 'KaryawanController@GetProfileAdminstrator');
	
	/*download excel*/
	 Route::post('downloadExcel', 'KaryawanController@downloadExcel');
	 Route::post('print', 'KaryawanController@printPDF');
	/*download excel*/
	
	
	/* profile */
	Route::get('GetProfile', 'KaryawanController@profil');
	Route::post('changePassword', 'KaryawanController@q_UpdatePassword');
	/* profile */
	 
	
	
	/* project */
	Route::post('RepairItemProject', 'KaryawanController@RepairItemProject');
	/* project */
	
	
 
 /* grafik */
 Route::get('years', 'KaryawanController@years');
 Route::get('DataGrafik', 'KaryawanController@DataGrafik');
 Route::get('DataGrafikAVGB2s', 'KaryawanController@DataGrafikAVGB2s');
 Route::get('DataGrafikAVGuNtp', 'KaryawanController@DataGrafikAVGuNtp');
 /* grafik */
 
 
 
 
	
	/* get project by level */
	Route::get('GetProjectApproval', 'KaryawanController@GetProjectApproval');
	Route::get('GetProjectRepair', 'KaryawanController@GetProjectRepair');
	Route::get('GetProjectProgressAll', 'KaryawanController@GetProjectProgressAll');
	Route::get('GetProjectRejectAll', 'KaryawanController@GetProjectRejectAll');
	Route::get('GetProjectFinalAll', 'KaryawanController@GetProjectFinalAll');
	Route::get('GetProjectFinalAllB2S', 'KaryawanController@GetProjectFinalAllB2S');
	Route::get('GetProjectFinalAllUNTAPPED', 'KaryawanController@GetProjectFinalAllUNTAPPED');
	/* get project by level */
	
	
	/* approved project by level */
	Route::post('ApprovalProjectOffice', 'KaryawanController@ApprovalProjectOffice');
	Route::post('ApprovalProjectRevisi', 'KaryawanController@ApprovalProjectRevisi');
	/* approved project by level */
	
	
	
	/* bod */
	 Route::get('GetProfileBOD', 'KaryawanController@GetProfileBOD');
	/* bod */
	
	
	
 
 
 
 
 
 
 
 
 
 
 /*project*/
	 
	 
	  
	  
	  Route::post('DropProject', 'KaryawanController@DropProject');
	  
	Route::post('ApproveProjectArea', 'KaryawanController@ApproveProjectArea');
	Route::post('ApproveProjectOfficer', 'KaryawanController@ApproveProjectOfficer');
	
	
	
	
	  /*project*/
	  
	  
	  /*profil*/
     
     Route::post('ChangeName', 'KaryawanController@q_UpdateName');
	 
	 
     Route::post('downloadExcelData', 'KaryawanController@downloadExcelData');
     Route::post('downloadExcelDataBaru', 'KaryawanController@downloadExcelDataBaru');
     
	
	 
	  /*profil*/
	  
	   
	  Route::get('GetProfileOfficerPSC', 'KaryawanController@GetProfileOfficerPSC');
	  Route::get('GetProjectPSC', 'KaryawanController@GetProjectPSC');
	  Route::get('GetProjectSPPO', 'KaryawanController@GetProjectSPPO');
	  Route::get('GetProjectDetailPRPO/{id}', 'KaryawanController@GetProjectDetailPRPO');
	  Route::post('SubmitPR', 'KaryawanController@SubmitPR');
	  Route::post('SubmitPO', 'KaryawanController@SubmitPO');
	  
	  
	  Route::get('GetProjectApprovalEGMUB2S', 'KaryawanController@GetProjectApprovalEGMUB2S');
	  Route::get('GetProjectApprovalEGMUUNTAPPED', 'KaryawanController@GetProjectApprovalEGMUUNTAPPED');
	  Route::post('ApprovalEGMUmasal', 'KaryawanController@simulasiB2Smasal');
	  Route::post('ApprovalProjectOfficeMasal', 'KaryawanController@ApprovalProjectOfficeMasal');
	 
	 
	 
	 
	 
});


















